import 'package:get/get.dart';

import '../../../core/app_export.dart';
import '../controller/host_onboarding_controller.dart';

/// A binding class for the HostOnboardingScreen.
///
/// This class ensures that the HostOnboardingController is created when the
/// HostOnboardingScreen is first loaded.
class HostOnboardingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HostOnboardingController());
  }
}
