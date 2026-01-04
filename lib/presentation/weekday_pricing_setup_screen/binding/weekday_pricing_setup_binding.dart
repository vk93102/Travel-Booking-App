import 'package:get/get.dart';
import '../controller/weekday_pricing_setup_controller.dart';
import '../../../core/app_export.dart';

class WeekdayPricingSetupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WeekdayPricingSetupController());
  }
}
