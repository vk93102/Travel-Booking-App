import 'package:get/get.dart';
import '../controller/identity_verification_setup_controller.dart';
import '../../../core/app_export.dart';

class IdentityVerificationSetupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => IdentityVerificationSetupController());
  }
}
