import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../core/app_export.dart';
import '../models/uploaded_photos_gallery_model.dart';

class UploadedPhotosGalleryController extends GetxController {
  final uploadedPhotosGalleryModel = Rx<UploadedPhotosGalleryModel?>(null);
  final ImagePicker _picker = ImagePicker();
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    uploadedPhotosGalleryModel.value = UploadedPhotosGalleryModel();
  }

  void onAddPhotoPressed() async {
    await _requestCameraPermission();
    _showPhotoSourceOptions();
  }

  Future<void> _requestCameraPermission() async {
    final cameraStatus = await Permission.camera.request();
    final storageStatus = await Permission.storage.request();

    if (cameraStatus.isDenied || storageStatus.isDenied) {
      Get.snackbar(
        'Permission Required',
        'Camera and storage permissions are required to add photos',
        backgroundColor: Colors.orange,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void _showPhotoSourceOptions() {
    Get.bottomSheet(
      Container(
        padding: EdgeInsets.all(20.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.h),
            topRight: Radius.circular(20.h),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Add Photo',
              style: TextStyleHelper.instance.title18Bold,
            ),
            SizedBox(height: 20.h),
            ListTile(
              leading: Icon(Icons.camera_alt),
              title: Text('Take Photo'),
              onTap: () {
                Get.back();
                _pickImageFromCamera();
              },
            ),
            ListTile(
              leading: Icon(Icons.photo_library),
              title: Text('Choose from Gallery'),
              onTap: () {
                Get.back();
                _pickImageFromGallery();
              },
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }

  Future<void> _pickImageFromCamera() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 80,
      );

      if (image != null) {
        _addNewPhoto(image.path);
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to capture photo',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> _pickImageFromGallery() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
      );

      if (image != null) {
        _addNewPhoto(image.path);
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to select photo',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void _addNewPhoto(String imagePath) {
    final model = uploadedPhotosGalleryModel.value;
    if (model != null) {
      // Find the first empty slot or add to the end
      if (model.mainPhoto?.value == ImageConstant.imgRectangle39575) {
        model.mainPhoto?.value = imagePath;
      } else if (model.photo1?.value ==
          ImageConstant.imgRectangle39575188x174) {
        model.photo1?.value = imagePath;
      } else if (model.photo2?.value == ImageConstant.imgRectangle395751) {
        model.photo2?.value = imagePath;
      } else {
        // All slots filled, replace the main photo
        model.mainPhoto?.value = imagePath;
      }

      // Update photo count
      int currentCount = model.photoCount?.value ?? 3;
      model.photoCount?.value = currentCount + 1;

      Get.snackbar(
        'Success',
        'Photo added successfully',
        backgroundColor: Colors.green,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void onPhotoOptionsPressed(int photoIndex) {
    Get.bottomSheet(
      Container(
        padding: EdgeInsets.all(20.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.h),
            topRight: Radius.circular(20.h),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Photo Options',
              style: TextStyleHelper.instance.title18Bold,
            ),
            SizedBox(height: 20.h),
            ListTile(
              leading: Icon(Icons.edit),
              title: Text('Replace Photo'),
              onTap: () {
                Get.back();
                _replacePhoto(photoIndex);
              },
            ),
            ListTile(
              leading: Icon(Icons.delete, color: Colors.red),
              title: Text('Delete Photo', style: TextStyle(color: Colors.red)),
              onTap: () {
                Get.back();
                _deletePhoto(photoIndex);
              },
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }

  Future<void> _replacePhoto(int photoIndex) async {
    await _requestCameraPermission();

    Get.bottomSheet(
      Container(
        padding: EdgeInsets.all(20.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.h),
            topRight: Radius.circular(20.h),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Replace Photo',
              style: TextStyleHelper.instance.title18Bold,
            ),
            SizedBox(height: 20.h),
            ListTile(
              leading: Icon(Icons.camera_alt),
              title: Text('Take Photo'),
              onTap: () {
                Get.back();
                _pickImageFromCameraForReplace(photoIndex);
              },
            ),
            ListTile(
              leading: Icon(Icons.photo_library),
              title: Text('Choose from Gallery'),
              onTap: () {
                Get.back();
                _pickImageFromGalleryForReplace(photoIndex);
              },
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }

  Future<void> _pickImageFromCameraForReplace(int photoIndex) async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 80,
      );

      if (image != null) {
        _updatePhotoAtIndex(photoIndex, image.path);
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to capture photo',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> _pickImageFromGalleryForReplace(int photoIndex) async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
      );

      if (image != null) {
        _updatePhotoAtIndex(photoIndex, image.path);
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to select photo',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void _updatePhotoAtIndex(int photoIndex, String imagePath) {
    final model = uploadedPhotosGalleryModel.value;
    if (model != null) {
      switch (photoIndex) {
        case 0:
          model.mainPhoto?.value = imagePath;
          break;
        case 1:
          model.photo1?.value = imagePath;
          break;
        case 2:
          model.photo2?.value = imagePath;
          break;
      }

      Get.snackbar(
        'Success',
        'Photo replaced successfully',
        backgroundColor: Colors.green,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void _deletePhoto(int photoIndex) {
    final model = uploadedPhotosGalleryModel.value;
    if (model != null) {
      switch (photoIndex) {
        case 0:
          model.mainPhoto?.value = ImageConstant.imgRectangle39575;
          break;
        case 1:
          model.photo1?.value = ImageConstant.imgRectangle39575188x174;
          break;
        case 2:
          model.photo2?.value = ImageConstant.imgRectangle395751;
          break;
      }

      // Update photo count
      int currentCount = model.photoCount?.value ?? 3;
      if (currentCount > 0) {
        model.photoCount?.value = currentCount - 1;
      }

      Get.snackbar(
        'Success',
        'Photo deleted successfully',
        backgroundColor: Colors.orange,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void onNextPressed() {
    final model = uploadedPhotosGalleryModel.value;
    if (model != null) {
      final photoCount = model.photoCount?.value ?? 0;

      if (photoCount < 3) {
        Get.snackbar(
          'Incomplete',
          'Please upload at least 3 photos to continue',
          backgroundColor: Colors.orange,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
        );
        return;
      }
    }

    // Navigate to the next screen
    Get.toNamed(AppRoutes.propertyAmenitiesSelectionScreen);
  }
}
