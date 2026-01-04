import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../core/app_export.dart';
import '../models/id_document_back_capture_model.dart';

class IdDocumentBackCaptureController extends GetxController {
  // Observable variables
  final isInitializing = false.obs;
  final isCameraInitialized = false.obs;
  final capturedImage = Rx<File?>(null);
  final errorMessage = ''.obs;

  // Camera controller
  CameraController? cameraController;

  // Model
  final idDocumentBackCaptureModel = Rx<IdDocumentBackCaptureModel?>(null);

  @override
  void onInit() {
    super.onInit();
    idDocumentBackCaptureModel.value = IdDocumentBackCaptureModel();
    initializeCamera();
  }

  @override
  void onClose() {
    cameraController?.dispose();
    super.onClose();
  }

  Future<void> initializeCamera() async {
    try {
      isInitializing.value = true;
      errorMessage.value = '';

      // Request camera permission
      final cameraStatus = await Permission.camera.request();

      if (cameraStatus != PermissionStatus.granted) {
        errorMessage.value = 'Camera permission is required to capture ID';
        _showPermissionDialog();
        return;
      }

      // Get available cameras
      final cameras = await availableCameras();
      if (cameras.isEmpty) {
        errorMessage.value = 'No cameras available on this device';
        return;
      }

      // Initialize camera controller with back camera
      final backCamera = cameras.firstWhere(
          (camera) => camera.lensDirection == CameraLensDirection.back,
          orElse: () => cameras.first);

      cameraController = CameraController(backCamera, ResolutionPreset.medium,
          enableAudio: false);

      await cameraController!.initialize();

      if (cameraController!.value.isInitialized) {
        isCameraInitialized.value = true;

        // Start automatic capture detection
        _startAutomaticCapture();
      }
    } catch (e) {
      errorMessage.value = 'Failed to initialize camera: ${e.toString()}';
      Get.snackbar(
          'Camera Error', 'Failed to initialize camera. Please try again.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: appTheme.redCustom.withAlpha(26),
          colorText: appTheme.redCustom);
    } finally {
      isInitializing.value = false;
    }
  }

  void _startAutomaticCapture() {
    // Simulate automatic capture after 3 seconds when camera is stable
    Future.delayed(Duration(seconds: 3), () {
      if (isCameraInitialized.value && capturedImage.value == null) {
        capturePhoto();
      }
    });
  }

  Future<void> capturePhoto() async {
    try {
      if (cameraController == null || !cameraController!.value.isInitialized) {
        return;
      }

      final XFile image = await cameraController!.takePicture();
      capturedImage.value = File(image.path);

      // Update model
      idDocumentBackCaptureModel.value?.imagePath!.value = image.path;

      Get.snackbar('Success', 'ID back side captured successfully!',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: appTheme.greenCustom.withAlpha(26),
          colorText: appTheme.greenCustom);

      // Navigate to next screen after successful capture
      Future.delayed(Duration(seconds: 2), () {
        onContinuePressed();
      });
    } catch (e) {
      errorMessage.value = 'Failed to capture photo: ${e.toString()}';
      Get.snackbar(
          'Capture Error', 'Failed to capture photo. Please try again.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: appTheme.redCustom.withAlpha(26),
          colorText: appTheme.redCustom);
    }
  }

  void retakePhoto() {
    capturedImage.value = null;
    idDocumentBackCaptureModel.value?.imagePath!.value = '';

    if (isCameraInitialized.value) {
      _startAutomaticCapture();
    }
  }

  void onContinuePressed() {
    if (capturedImage.value != null) {
      // Navigate to the next screen in the verification flow
      // Based on the AppRoutes, this would likely be the next verification step
      Get.back();
    } else {
      Get.snackbar(
          'Photo Required', 'Please capture the back side of your ID first.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: appTheme.orangeCustom.withAlpha(26),
          colorText: appTheme.orangeCustom);
    }
  }

  void _showPermissionDialog() {
    Get.dialog(AlertDialog(
        title: Text('Camera Permission Required'),
        content: Text(
            'This app needs camera access to capture your ID document. Please grant permission in settings.'),
        actions: [
          TextButton(onPressed: () => Get.back(), child: Text('Cancel')),
          TextButton(
              onPressed: () {
                Get.back();
                openAppSettings();
              },
              child: Text('Open Settings')),
        ]));
  }
}
