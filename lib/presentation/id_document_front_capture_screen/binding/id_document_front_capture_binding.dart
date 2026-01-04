import 'package:get/get.dart';
import '../controller/id_document_front_capture_controller.dart';
import '../../../core/app_export.dart';

class IdDocumentFrontCaptureBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => IdDocumentFrontCaptureController());
  }
}
