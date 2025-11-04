import 'package:get/get.dart';
import '../controller/property_address_form_controller.dart';
import '../../../core/app_export.dart';

class PropertyAddressFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PropertyAddressFormController>(
      () => PropertyAddressFormController(),
    );
  }
}
