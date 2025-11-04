import 'package:get/get.dart';
import '../controller/location_sharing_controller.dart';
import '../../../core/app_export.dart';

class LocationSharingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LocationSharingController());
  }
}
