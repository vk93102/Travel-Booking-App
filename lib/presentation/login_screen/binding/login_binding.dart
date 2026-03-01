import 'package:get/get.dart';

import '../../../features/auth/data/repositories/auth_repository.dart';
import '../controller/login_controller.dart';

/// Binding for [LoginScreen].
class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(Get.find<AuthRepository>()),
    );
  }
}
