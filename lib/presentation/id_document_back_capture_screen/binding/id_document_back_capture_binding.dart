import 'package:get/get.dart';
import '../controller/id_document_back_capture_controller.dart';
import '../../../core/app_export.dart';

class IdDocumentBackCaptureBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IdDocumentBackCaptureController>(
      () => IdDocumentBackCaptureController(),
    );
  }
}
