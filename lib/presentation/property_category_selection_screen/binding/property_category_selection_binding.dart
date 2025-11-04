import 'package:get/get.dart';
import '../controller/property_category_selection_controller.dart';
import '../../../core/app_export.dart';

class PropertyCategorySelectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PropertyCategorySelectionController());
  }
}
