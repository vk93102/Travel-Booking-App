import 'package:get/get.dart';
import '../controller/event_booking_configuration_controller.dart';
import '../../../core/app_export.dart';

class EventBookingConfigurationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EventBookingConfigurationController());
  }
}
