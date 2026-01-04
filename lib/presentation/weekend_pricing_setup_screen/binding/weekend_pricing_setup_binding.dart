import 'package:get/get.dart';
import '../controller/weekend_pricing_setup_controller.dart';
import '../../../core/app_export.dart';

class WeekendPricingSetupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WeekendPricingSetupController>(
      () => WeekendPricingSetupController(),
    );
  }
}
