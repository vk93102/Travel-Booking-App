import 'package:get/get.dart';
import '../controller/event_booking_settings_controller.dart';
import '../../../core/app_export.dart';

class EventBookingSettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EventBookingSettingsController>(
      () => EventBookingSettingsController(),
    );
  }
}
