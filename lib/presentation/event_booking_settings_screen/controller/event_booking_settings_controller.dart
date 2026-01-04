import '../../../core/app_export.dart';
import '../models/event_booking_settings_model.dart';

class EventBookingSettingsController extends GetxController {
  final eventBookingSettingsModel = Rx<EventBookingSettingsModel?>(null);

  @override
  void onInit() {
    super.onInit();
    eventBookingSettingsModel.value = EventBookingSettingsModel();
  }

  void toggleEventBooking(bool value) {
    eventBookingSettingsModel.value?.isEventBookingEnabled?.value = value;
  }

  void onNextPressed() {
    // Navigate to the next screen in the property setup flow
    Get.toNamed(AppRoutes.eventBookingConfigurationScreen);
  }
}
