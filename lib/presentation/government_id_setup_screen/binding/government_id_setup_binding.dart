import 'package:get/get.dart';
import '../controller/government_id_setup_controller.dart';
import '../../../core/app_export.dart';

class GovernmentIdSetupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GovernmentIdSetupController>(
      () => GovernmentIdSetupController(),
    );
  }
}
