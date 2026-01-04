import 'package:get/get.dart';
import '../controller/bayt_ai_setup_controller.dart';
import '../../../core/app_export.dart';

class BaytAiSetupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BaytAiSetupController());
  }
}
