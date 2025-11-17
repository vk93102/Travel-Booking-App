import 'package:get/get.dart';
import '../controller/extra_services_addons_controller.dart';
import '../../../core/app_export.dart';

class ExtraServicesAddonsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExtraServicesAddonsController>(
      () => ExtraServicesAddonsController(),
    );
  }
}
