import 'dart:typed_data';
import 'package:get/get.dart';
import '../../../core/app_export.dart';

/// This class is used in the [IdDocumentFrontCaptureScreen] screen with GetX.

class IdDocumentFrontCaptureModel {
  Rx<String>? imagePath;
  Rx<Uint8List?>? imageBytes;
  Rx<bool>? isDocumentDetected;
  Rx<bool>? isCaptureComplete;

  IdDocumentFrontCaptureModel({
    this.imagePath,
    this.imageBytes,
    this.isDocumentDetected,
    this.isCaptureComplete,
  }) {
    imagePath = imagePath ?? Rx('');
    imageBytes = imageBytes ?? Rx<Uint8List?>(null);
    isDocumentDetected = isDocumentDetected ?? Rx(false);
    isCaptureComplete = isCaptureComplete ?? Rx(false);
  }
}
