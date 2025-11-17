import 'package:get/get.dart';
import '../controller/property_amenities_selection_controller.dart';
import '../../../core/app_export.dart';

class PropertyAmenitiesSelectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PropertyAmenitiesSelectionController());
  }
}
