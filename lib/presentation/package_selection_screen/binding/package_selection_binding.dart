import 'package:get/get.dart';
import '../controller/package_selection_controller.dart';
import '../../../core/app_export.dart';

class PackageSelectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PackageSelectionController());
  }
}
