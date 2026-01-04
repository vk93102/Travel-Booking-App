import 'package:get/get.dart';
import '../controller/cancellation_policy_selection_controller.dart';
import '../../../core/app_export.dart';

class CancellationPolicySelectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CancellationPolicySelectionController());
  }
}
