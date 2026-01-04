import '../../../core/app_export.dart';
import '../models/weekday_pricing_setup_model.dart';

class WeekdayPricingSetupController extends GetxController {
  Rx<WeekdayPricingSetupModel?> weekdayPricingSetupModel =
      Rx<WeekdayPricingSetupModel?>(null);

  @override
  void onInit() {
    super.onInit();
    weekdayPricingSetupModel.value = WeekdayPricingSetupModel();
  }

  void onHourlyBookingToggle(bool? value) {
    weekdayPricingSetupModel.value?.isHourlyBookingEnabled!.value =
        value ?? false;
  }

  void onHoursChanged(String? value) {
    weekdayPricingSetupModel.value?.selectedHours!.value = value ?? '';
  }

  void onEnterManually() {
    // Handle enter manually functionality
    Get.snackbar(
        'Manual Entry', 'Manual rate entry feature would be implemented here',
        snackPosition: SnackPosition.BOTTOM);
  }

  void onNextPressed() {
    // Navigate to the next screen in the pricing setup flow
    Get.toNamed(AppRoutes.weekendPricingSetupScreen);
  }
}
