import 'package:get/get.dart';

import '../../../features/auth/data/repositories/auth_repository.dart';
import '../controller/signup_controller.dart';

/// Binding for [SignupScreen].
class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupController>(
      () => SignupController(Get.find<AuthRepository>()),
    );
  }
}
