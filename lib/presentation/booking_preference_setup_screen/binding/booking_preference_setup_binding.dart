import 'package:get/get.dart';
import '../controller/booking_preference_setup_controller.dart';
import '../../../core/app_export.dart';

class BookingPreferenceSetupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BookingPreferenceSetupController());
  }
}
