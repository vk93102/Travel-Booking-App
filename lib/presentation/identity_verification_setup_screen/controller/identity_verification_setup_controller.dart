import '../../../core/app_export.dart';
import '../models/identity_verification_setup_model.dart';

class IdentityVerificationSetupController extends GetxController {
  Rx<IdentityVerificationSetupModel> identityVerificationSetupModel =
      IdentityVerificationSetupModel().obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onInformationVerificationTap() {
    // Navigate to the next screen where user provides personal information
    Get.toNamed(AppRoutes.governmentIdSetupScreen);
  }

  void onMobileVerificationTap() {
    // Navigate to mobile number verification screen
    // Since this route is not available in AppRoutes, we'll navigate to government ID setup
    Get.toNamed(AppRoutes.governmentIdSetupScreen);
  }

  void onNextPressed() {
    // Navigate to the next step in the verification process
    Get.toNamed(AppRoutes.governmentIdSetupScreen);
  }
}
