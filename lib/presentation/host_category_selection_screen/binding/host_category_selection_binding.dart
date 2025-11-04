import 'package:get/get.dart';
import '../controller/host_category_selection_controller.dart';
import '../../../core/app_export.dart';

class HostCategorySelectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HostCategorySelectionController());
  }
}
