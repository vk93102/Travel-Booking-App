import 'package:get/get.dart';

import '../../features/auth/data/repositories/auth_repository.dart';

/// Global dependency registration for the application.
class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthRepository>(AuthRepository(), permanent: true);
  }
}
