import '../../../core/app_export.dart';
import '../models/bayt_ai_setup_model.dart';

class BaytAiSetupController extends GetxController {
  // Observable model
  final baytAiSetupModel = Rx<BaytAiSetupModel?>(null);

  @override
  void onInit() {
    super.onInit();
    baytAiSetupModel.value = BaytAiSetupModel();
  }

  /// Toggle pricing engine enable/disable
  void togglePricingEngine(bool value) {
    baytAiSetupModel.value?.isPricingEngineEnabled?.value = value;
  }

  /// Handle next button press
  void onNextPressed() {
    // Navigate to the next screen in the flow
    Get.toNamed(AppRoutes.eventBookingConfigurationScreen);
  }
}
