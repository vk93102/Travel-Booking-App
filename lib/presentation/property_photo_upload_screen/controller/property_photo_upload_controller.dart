import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../core/app_export.dart';
import '../models/property_photo_upload_model.dart';

class PropertyPhotoUploadController extends GetxController {
  final propertyPhotoUploadModel = Rx<PropertyPhotoUploadModel?>(null);
  final ImagePicker _picker = ImagePicker();

  // Observable variables
  final selectedPhotos = <XFile>[].obs;
  final isLoading = false.obs;
  final canProceed = false.obs;

  // Camera variables
  CameraController? cameraController;
  List<CameraDescription>? cameras;

  @override
  void onInit() {
    super.onInit();
    propertyPhotoUploadModel.value = PropertyPhotoUploadModel();
    _initializeCamera();

    // Watch selected photos to update proceed button state
    ever(selectedPhotos, (_) => _updateProceedState());
  }

  @override
  void onClose() {
    cameraController?.dispose();
    super.onClose();
  }

  void _initializeCamera() async {
    try {
      cameras = await availableCameras();
    } catch (e) {
      print('Error initializing camera: $e');
    }
  }

  void _updateProceedState() {
    canProceed.value = selectedPhotos.length >= 3;
  }

  Future<bool> _requestCameraPermission() async {
    final status = await Permission.camera.request();
    return status.isGranted;
  }

  Future<bool> _requestStoragePermission() async {
    if (kIsWeb) return true;

    final status = await Permission.storage.request();
    return status.isGranted;
  }

  Future<void> pickFromGallery() async {
    try {
      isLoading.value = true;

      // Request storage permission
      if (!await _requestStoragePermission()) {
        Get.snackbar(
          'Permission Required',
          'Storage permission is required to access photos',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: appTheme.redCustom,
          colorText: appTheme.whiteCustom,
        );
        return;
      }

      // Modified: Use pickMultiImage instead of pickMultipleImages
      final List<XFile> images = await _picker.pickMultiImage(
        maxWidth: 1920,
        maxHeight: 1080,
        imageQuality: 85,
      );

      if (images.isNotEmpty) {
        // Add new images to existing selection
        selectedPhotos.addAll(images);

        Get.snackbar(
          'Photos Selected',
          '${images.length} photo(s) added successfully',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: appTheme.greenCustom,
          colorText: appTheme.whiteCustom,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to select photos from gallery',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: appTheme.redCustom,
        colorText: appTheme.whiteCustom,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> takeNewPhoto() async {
    try {
      isLoading.value = true;

      // Request camera permission
      if (!await _requestCameraPermission()) {
        Get.snackbar(
          'Permission Required',
          'Camera permission is required to take photos',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: appTheme.redCustom,
          colorText: appTheme.whiteCustom,
        );
        return;
      }

      final XFile? image = await _picker.pickImage(
        source: ImageSource.camera,
        maxWidth: 1920,
        maxHeight: 1080,
        imageQuality: 85,
      );

      if (image != null) {
        selectedPhotos.add(image);

        Get.snackbar(
          'Photo Captured',
          'Photo captured and added successfully',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: appTheme.greenCustom,
          colorText: appTheme.whiteCustom,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to capture photo',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: appTheme.redCustom,
        colorText: appTheme.whiteCustom,
      );
    } finally {
      isLoading.value = false;
    }
  }

  void removePhoto(int index) {
    if (index >= 0 && index < selectedPhotos.length) {
      selectedPhotos.removeAt(index);

      Get.snackbar(
        'Photo Removed',
        'Photo removed successfully',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: appTheme.orangeCustom,
        colorText: appTheme.whiteCustom,
      );
    }
  }

  void proceedToNext() {
    if (selectedPhotos.length < 3) {
      Get.snackbar(
        'Minimum Photos Required',
        'Please select at least 3 photos to continue',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: appTheme.orangeCustom,
        colorText: appTheme.whiteCustom,
      );
      return;
    }

    // Save selected photos to model
    propertyPhotoUploadModel.value?.selectedPhotos.value =
        selectedPhotos.toList();

    // Navigate to next screen
    Get.toNamed(AppRoutes.uploadedPhotosGalleryScreen);
  }

  void clearAllPhotos() {
    selectedPhotos.clear();

    Get.snackbar(
      'Photos Cleared',
      'All photos have been removed',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: appTheme.greyCustom,
      colorText: appTheme.whiteCustom,
    );
  }
}
