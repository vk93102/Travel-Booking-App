import '../../../core/app_export.dart';
import '../models/host_onboarding_model.dart';

/// A controller class for the HostOnboardingScreen.
///
/// This class manages the state of the HostOnboardingScreen, including the
/// current hostOnboardingModelObj
class HostOnboardingController extends GetxController {
  Rx<HostOnboardingModel> hostOnboardingModelObj = HostOnboardingModel().obs;

  /// Handles the tap event for the "Get Started" button
  void onGetStartedTap() {
    // Navigate to the host category selection screen
    Get.toNamed(AppRoutes.hostCategorySelectionScreen);
  }

  @override
  void onInit() {
    super.onInit();
    // Initialize any required data
  }

  @override
  void onClose() {
    super.onClose();
    // Clean up resources
  }
}
