import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../core/app_export.dart';
import '../models/id_document_front_capture_model.dart';

class IdDocumentFrontCaptureController extends GetxController {
  final isLoading = false.obs;
  final isReadyToCapture = false.obs;
  final capturedImagePath = Rx<String?>(null);
  final capturedImageBytes = Rx<Uint8List?>(null);
  final cameraController = Rx<CameraController?>(null);
  final idDocumentFrontCaptureModel = Rx<IdDocumentFrontCaptureModel?>(null);

  List<CameraDescription>? cameras;

  @override
  void onInit() {
    super.onInit();
    idDocumentFrontCaptureModel.value = IdDocumentFrontCaptureModel();
    initializeCamera();
  }

  @override
  void onClose() {
    cameraController.value?.dispose();
    super.onClose();
  }

  Future<void> initializeCamera() async {
    try {
      isLoading.value = true;

      // Request camera permission
      final permission = await Permission.camera.request();
      if (!permission.isGranted) {
        Get.snackbar('Camera Permission',
            'Camera permission is required to capture ID document',
            snackPosition: SnackPosition.TOP,
            backgroundColor: appTheme.redCustom,
            colorText: appTheme.whiteCustom);
        isLoading.value = false;
        return;
      }

      // Get available cameras
      cameras = await availableCameras();
      if (cameras == null || cameras!.isEmpty) {
        Get.snackbar('Camera Error', 'No cameras found on this device',
            snackPosition: SnackPosition.TOP,
            backgroundColor: appTheme.redCustom,
            colorText: appTheme.whiteCustom);
        isLoading.value = false;
        return;
      }

      // Initialize camera controller
      cameraController.value = CameraController(
          cameras!.first, ResolutionPreset.high,
          enableAudio: false);

      await cameraController.value!.initialize();

      // Start detection timer for automatic capture
      _startDocumentDetection();

      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      Get.snackbar(
          'Camera Error', 'Failed to initialize camera: ${e.toString()}',
          snackPosition: SnackPosition.TOP,
          backgroundColor: appTheme.redCustom,
          colorText: appTheme.whiteCustom);
    }
  }

  void _startDocumentDetection() {
    // Simulate document detection for automatic capture
    Future.delayed(Duration(seconds: 2), () {
      if (cameraController.value != null &&
          cameraController.value!.value.isInitialized &&
          capturedImagePath.value == null) {
        isReadyToCapture.value = true;

        Future.delayed(Duration(seconds: 1), () {
          if (isReadyToCapture.value) {
            captureImage();
          }
        });
      }
    });
  }

  Future<void> captureImage() async {
    try {
      if (cameraController.value == null ||
          !cameraController.value!.value.isInitialized) {
        return;
      }

      isReadyToCapture.value = false;

      final XFile image = await cameraController.value!.takePicture();
      final Uint8List imageBytes = await image.readAsBytes();

      capturedImagePath.value = image.path;
      capturedImageBytes.value = imageBytes;

      idDocumentFrontCaptureModel.value?.imagePath!.value = image.path;
      idDocumentFrontCaptureModel.value?.imageBytes!.value = imageBytes;

      Get.snackbar('Success', 'ID document captured successfully',
          snackPosition: SnackPosition.TOP,
          backgroundColor: appTheme.greenCustom,
          colorText: appTheme.whiteCustom);

      // Navigate to next screen after successful capture
      Future.delayed(Duration(seconds: 2), () {
        Get.toNamed(AppRoutes.idDocumentBackCaptureScreen);
      });
    } catch (e) {
      Get.snackbar('Capture Error', 'Failed to capture image: ${e.toString()}',
          snackPosition: SnackPosition.TOP,
          backgroundColor: appTheme.redCustom,
          colorText: appTheme.whiteCustom);
    }
  }

  void retryCapture() {
    capturedImagePath.value = null;
    capturedImageBytes.value = null;
    isReadyToCapture.value = false;
    idDocumentFrontCaptureModel.value?.imagePath!.value = '';
    idDocumentFrontCaptureModel.value?.imageBytes!.value = null;

    _startDocumentDetection();
  }
}
