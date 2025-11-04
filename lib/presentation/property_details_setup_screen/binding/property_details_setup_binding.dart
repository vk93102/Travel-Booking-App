import 'package:get/get.dart';
import '../controller/property_details_setup_controller.dart';
import '../../../core/app_export.dart';

class PropertyDetailsSetupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PropertyDetailsSetupController>(
      () => PropertyDetailsSetupController(),
    );
  }
}
