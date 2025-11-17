import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../core/app_export.dart';
import '../../../widgets/custom_image_view.dart';
import '../models/photo_upload_gallery_model.dart';

class PhotoUploadGalleryController extends GetxController {
  final photoUploadGalleryModel = Rx<PhotoUploadGalleryModel?>(null);
  final ImagePicker _picker = ImagePicker();

  // Observable list of uploaded photos
  final RxList<String> uploadedPhotos = <String>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    photoUploadGalleryModel.value = PhotoUploadGalleryModel();
    _initializeDefaultPhotos();
  }

  void _initializeDefaultPhotos() {
    uploadedPhotos.addAll([
      ImageConstant.imgRectangle395752,
      ImageConstant.imgRectangle395751,
      ImageConstant.imgRectangle39575188x174,
    ]);
  }

  Future<void> pickImage() async {
    try {
      isLoading.value = true;

      // Request camera and storage permissions
      Map<Permission, PermissionStatus> permissions = await [
        Permission.camera,
        Permission.storage,
      ].request();

      if (permissions[Permission.camera]!.isDenied) {
        Get.snackbar(
          'Permission Required',
          'Camera permission is required to take photos',
          backgroundColor: Colors.orange,
          colorText: Colors.white,
        );
        return;
      }

      // Show options to pick from gallery or camera
      await _showImageSourceDialog();
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to pick image. Please try again.',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> _showImageSourceDialog() async {
    await Get.dialog(
      AlertDialog(
        title: Text('Select Image Source'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.camera_alt),
              title: Text('Camera'),
              onTap: () {
                Get.back();
                _pickFromCamera();
              },
            ),
            ListTile(
              leading: Icon(Icons.photo_library),
              title: Text('Gallery'),
              onTap: () {
                Get.back();
                _pickFromGallery();
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text('Cancel'),
          ),
        ],
      ),
    );
  }

  Future<void> _pickFromCamera() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 85,
        maxWidth: 1024,
        maxHeight: 1024,
      );

      if (image != null) {
        uploadedPhotos.add(image.path);
        Get.snackbar(
          'Success',
          'Photo added successfully!',
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to take photo. Please try again.',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  Future<void> _pickFromGallery() async {
    try {
      final List<XFile> images = await _picker.pickMultiImage(
        imageQuality: 85,
        maxWidth: 1024,
        maxHeight: 1024,
      );

      if (images.isNotEmpty) {
        for (XFile image in images) {
          uploadedPhotos.add(image.path);
        }
        Get.snackbar(
          'Success',
          '${images.length} photo(s) added successfully!',
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to pick photos. Please try again.',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void viewPhoto(String imagePath) {
    // Navigate to photo viewer or show full screen image
    Get.dialog(
      Dialog(
        backgroundColor: Colors.black,
        child: Stack(
          children: [
            Center(
              child: CustomImageView(
                imagePath: imagePath,
                fit: BoxFit.contain,
                height: Get.height * 0.8,
                width: Get.width,
              ),
            ),
            Positioned(
              top: 40.h,
              right: 20.h,
              child: IconButton(
                onPressed: () => Get.back(),
                icon: Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 30.h,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void removePhoto(String imagePath) {
    uploadedPhotos.remove(imagePath);
    Get.snackbar(
      'Photo Removed',
      'Photo has been removed from gallery',
      backgroundColor: Colors.orange,
      colorText: Colors.white,
    );
  }

  void onNextPressed() {
    if (uploadedPhotos.isEmpty) {
      Get.snackbar(
        'Photos Required',
        'Please upload at least one photo before proceeding',
        backgroundColor: Colors.orange,
        colorText: Colors.white,
      );
      return;
    }

    // Navigate to next screen
    Get.toNamed(AppRoutes.propertyAmenitiesSelectionScreen);
  }

  @override
  void onClose() {
    super.onClose();
  }
}
