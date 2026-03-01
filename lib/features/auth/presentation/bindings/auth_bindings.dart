import 'package:get/get.dart';

import '../../../../features/auth/data/repositories/auth_repository.dart';
import '../controllers/login_controller.dart';
import '../controllers/phone_otp_controller.dart';
import '../controllers/signup_controller.dart';

/// Binding for login screen dependencies.
class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController(Get.find<AuthRepository>()));
  }
}

/// Binding for signup screen dependencies.
class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupController>(
      () => SignupController(Get.find<AuthRepository>()),
    );
  }
}

/// Binding for phone OTP screen dependencies.
class PhoneOtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PhoneOtpController>(
      () => PhoneOtpController(Get.find<AuthRepository>()),
    );
  }
}
