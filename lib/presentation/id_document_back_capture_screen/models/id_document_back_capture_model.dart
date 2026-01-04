import 'package:get/get.dart';
import '../../../core/app_export.dart';

/// This class is used in the [IdDocumentBackCaptureScreen] screen with GetX.
class IdDocumentBackCaptureModel {
  // Observable variables for reactive state management
  Rx<String>? imagePath;
  Rx<bool>? isImageCaptured;
  Rx<String>? documentType;

  // Simple constructor with no parameters
  IdDocumentBackCaptureModel({
    this.imagePath,
    this.isImageCaptured,
    this.documentType,
  }) {
    imagePath = imagePath ?? Rx("");
    isImageCaptured = isImageCaptured ?? Rx(false);
    documentType = documentType ?? Rx("ID Back");
  }
}
