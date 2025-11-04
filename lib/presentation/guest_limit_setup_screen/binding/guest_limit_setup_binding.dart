import 'package:get/get.dart';

import '../../../core/app_export.dart';
import '../controller/guest_limit_setup_controller.dart';

/// A binding class for the GuestLimitSetupScreen.
///
/// This class ensures that the GuestLimitSetupController is created when
/// GuestLimitSetupScreen is first called.
class GuestLimitSetupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GuestLimitSetupController());
  }
}
