import 'package:get/get.dart';
import '../controller/property_registration_controller.dart'; // Modified: Fixed import path
import '../../../core/app_export.dart';

class PropertyRegistrationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PropertyRegistrationController>(
      () => PropertyRegistrationController(),
    );
  }
}
