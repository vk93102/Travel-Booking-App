import '../core/app_export.dart';
import 'package:get/get.dart';
import '../presentation/host_onboarding_screen/host_onboarding_screen.dart';
import '../presentation/host_category_selection_screen/host_category_selection_screen.dart';
import '../presentation/location_sharing_screen/location_sharing_screen.dart';
import '../presentation/property_details_setup_screen/property_details_setup_screen.dart';
import '../presentation/guest_limit_setup_screen/guest_limit_setup_screen.dart';
import '../presentation/property_registration_screen/property_registration_screen.dart';
import '../presentation/property_category_selection_screen/property_category_selection_screen.dart';
import '../presentation/property_address_form_screen/property_address_form_screen.dart';

import '../presentation/host_onboarding_screen/binding/host_onboarding_binding.dart';
import '../presentation/host_category_selection_screen/binding/host_category_selection_binding.dart';
import '../presentation/location_sharing_screen/binding/location_sharing_binding.dart';
import '../presentation/property_details_setup_screen/binding/property_details_setup_binding.dart';
import '../presentation/guest_limit_setup_screen/binding/guest_limit_setup_binding.dart';
import '../presentation/property_registration_screen/binding/property_registration_binding.dart';
import '../presentation/property_category_selection_screen/binding/property_category_selection_binding.dart';
import '../presentation/property_address_form_screen/binding/property_address_form_binding.dart';
import '../presentation/app_navigation_screen/app_navigation_screen.dart';
import '../presentation/app_navigation_screen/binding/app_navigation_binding.dart';

// ignore_for_file: must_be_immutable
class AppRoutes {
  static const String hostOnboardingScreen = '/host_onboarding_screen';
  static const String hostCategorySelectionScreen =
      '/host_category_selection_screen';
  static const String locationSharingScreen = '/location_sharing_screen';
  static const String propertyDetailsSetupScreen =
      '/property_details_setup_screen';
  static const String guestLimitSetupScreen = '/guest_limit_setup_screen';
  static const String propertyRegistrationScreen =
      '/property_registration_screen';
  static const String propertyCategorySelectionScreen =
      '/property_category_selection_screen';
  static const String propertyAddressFormScreen =
      '/property_address_form_screen';

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
      name: locationSharingScreen,
      page: () => LocationSharingScreen(),
      bindings: [LocationSharingBinding()],
    ),
    GetPage(
      name: propertyDetailsSetupScreen,
      page: () => PropertyDetailsSetupScreen(),
      bindings: [PropertyDetailsSetupBinding()],
    ),
    GetPage(
      name: guestLimitSetupScreen,
      page: () => GuestLimitSetupScreen(),
      bindings: [GuestLimitSetupBinding()],
    ),
    GetPage(
      name: propertyRegistrationScreen,
      page: () => PropertyRegistrationScreen(),
      bindings: [PropertyRegistrationBinding()],
    ),
    GetPage(
      name: propertyCategorySelectionScreen,
      page: () => PropertyCategorySelectionScreen(),
      bindings: [PropertyCategorySelectionBinding()],
    ),
    GetPage(
      name: propertyAddressFormScreen,
      page: () => PropertyAddressFormScreen(),
      bindings: [PropertyAddressFormBinding()],
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
