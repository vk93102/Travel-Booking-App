import 'package:get/get.dart';

import '../../../features/auth/data/repositories/auth_repository.dart';
import '../controller/phone_otp_controller.dart';

/// Binding for [PhoneOtpScreen].
class PhoneOtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PhoneOtpController>(
      () => PhoneOtpController(Get.find<AuthRepository>()),
    );
  }
}
