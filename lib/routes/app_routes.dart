import '../core/app_export.dart';
import 'package:get/get.dart';
import '../presentation/host_onboarding_screen/host_onboarding_screen.dart';
import '../presentation/host_category_selection_screen/host_category_selection_screen.dart';

import '../presentation/host_onboarding_screen/binding/host_onboarding_binding.dart';
import '../presentation/host_category_selection_screen/binding/host_category_selection_binding.dart';
import '../presentation/app_navigation_screen/app_navigation_screen.dart';
import '../presentation/app_navigation_screen/binding/app_navigation_binding.dart';

// ignore_for_file: must_be_immutable
class AppRoutes {
  static const String hostOnboardingScreen = '/host_onboarding_screen';
  static const String hostCategorySelectionScreen =
      '/host_category_selection_screen';

  static const String appNavigationScreen = '/app_navigation_screen';
  static const String initialRoute = '/';

  static List<GetPage> pages = [
    GetPage(
      name: hostOnboardingScreen,
      page: () => HostOnboardingScreen(),
      bindings: [HostOnboardingBinding()],
    ),
    GetPage(
      name: hostCategorySelectionScreen,
      page: () => HostCategorySelectionScreen(),
      bindings: [HostCategorySelectionBinding()],
    ),
    GetPage(
      name: appNavigationScreen,
      page: () => AppNavigationScreen(),
      bindings: [AppNavigationBinding()],
    ),
    GetPage(
      name: initialRoute,
      page: () => AppNavigationScreen(),
      bindings: [AppNavigationBinding()],
    ),
  ];
}
