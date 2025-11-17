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
import '../presentation/uploaded_photos_gallery_screen/uploaded_photos_gallery_screen.dart';
import '../presentation/photo_upload_gallery_screen/photo_upload_gallery_screen.dart';
import '../presentation/extra_services_addons_screen/extra_services_addons_screen.dart';
import '../presentation/property_amenities_selection_screen/property_amenities_selection_screen.dart';
import '../presentation/property_photo_upload_screen/property_photo_upload_screen.dart';
import '../presentation/booking_preference_setup_screen/booking_preference_setup_screen.dart';

import '../presentation/host_onboarding_screen/binding/host_onboarding_binding.dart';
import '../presentation/host_category_selection_screen/binding/host_category_selection_binding.dart';
import '../presentation/location_sharing_screen/binding/location_sharing_binding.dart';
import '../presentation/property_details_setup_screen/binding/property_details_setup_binding.dart';
import '../presentation/guest_limit_setup_screen/binding/guest_limit_setup_binding.dart';
import '../presentation/property_registration_screen/binding/property_registration_binding.dart';
import '../presentation/property_category_selection_screen/binding/property_category_selection_binding.dart';
import '../presentation/property_address_form_screen/binding/property_address_form_binding.dart';
import '../presentation/uploaded_photos_gallery_screen/binding/uploaded_photos_gallery_binding.dart';
import '../presentation/photo_upload_gallery_screen/binding/photo_upload_gallery_binding.dart';
import '../presentation/extra_services_addons_screen/binding/extra_services_addons_binding.dart';
import '../presentation/property_amenities_selection_screen/binding/property_amenities_selection_binding.dart';
import '../presentation/property_photo_upload_screen/binding/property_photo_upload_binding.dart';
import '../presentation/booking_preference_setup_screen/binding/booking_preference_setup_binding.dart';
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
  static const String uploadedPhotosGalleryScreen =
      '/uploaded_photos_gallery_screen';
  static const String photoUploadGalleryScreen = '/photo_upload_gallery_screen';
  static const String extraServicesAddonsScreen =
      '/extra_services_addons_screen';
  static const String propertyAmenitiesSelectionScreen =
      '/property_amenities_selection_screen';
  static const String propertyPhotoUploadScreen =
      '/property_photo_upload_screen';
  static const String bookingPreferenceSetupScreen =
      '/booking_preference_setup_screen';

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
      name: uploadedPhotosGalleryScreen,
      page: () => UploadedPhotosGalleryScreen(),
      bindings: [UploadedPhotosGalleryBinding()],
    ),
    GetPage(
      name: photoUploadGalleryScreen,
      page: () => PhotoUploadGalleryScreen(),
      bindings: [PhotoUploadGalleryBinding()],
    ),
    GetPage(
      name: extraServicesAddonsScreen,
      page: () => ExtraServicesAddonsScreen(),
      bindings: [ExtraServicesAddonsBinding()],
    ),
    GetPage(
      name: propertyAmenitiesSelectionScreen,
      page: () => PropertyAmenitiesSelectionScreen(),
      bindings: [PropertyAmenitiesSelectionBinding()],
    ),
    GetPage(
      name: propertyPhotoUploadScreen,
      page: () => PropertyPhotoUploadScreen(),
      bindings: [PropertyPhotoUploadBinding()],
    ),
    GetPage(
      name: bookingPreferenceSetupScreen,
      page: () => BookingPreferenceSetupScreen(),
      bindings: [BookingPreferenceSetupBinding()],
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
