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
import '../presentation/event_booking_settings_screen/event_booking_settings_screen.dart';
import '../presentation/weekday_pricing_setup_screen/weekday_pricing_setup_screen.dart';
import '../presentation/create_discount_coupons_screen/create_discount_coupons_screen.dart';
import '../presentation/weekend_pricing_setup_screen/weekend_pricing_setup_screen.dart';
import '../presentation/bayt_ai_setup_screen/bayt_ai_setup_screen.dart';
import '../presentation/event_booking_configuration_screen/event_booking_configuration_screen.dart';
import '../presentation/package_selection_screen/package_selection_screen.dart';
import '../presentation/cancellation_policy_selection_screen/cancellation_policy_selection_screen.dart';
import '../presentation/id_document_front_capture_screen/id_document_front_capture_screen.dart';
import '../presentation/id_document_back_capture_screen/id_document_back_capture_screen.dart';
import '../presentation/identity_verification_setup_screen/identity_verification_setup_screen.dart';
import '../presentation/government_id_setup_screen/government_id_setup_screen.dart';

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
import '../presentation/event_booking_settings_screen/binding/event_booking_settings_binding.dart';
import '../presentation/weekday_pricing_setup_screen/binding/weekday_pricing_setup_binding.dart';
import '../presentation/create_discount_coupons_screen/binding/create_discount_coupons_binding.dart';
import '../presentation/weekend_pricing_setup_screen/binding/weekend_pricing_setup_binding.dart';
import '../presentation/bayt_ai_setup_screen/binding/bayt_ai_setup_binding.dart';
import '../presentation/event_booking_configuration_screen/binding/event_booking_configuration_binding.dart';
import '../presentation/package_selection_screen/binding/package_selection_binding.dart';
import '../presentation/cancellation_policy_selection_screen/binding/cancellation_policy_selection_binding.dart';
import '../presentation/id_document_front_capture_screen/binding/id_document_front_capture_binding.dart';
import '../presentation/id_document_back_capture_screen/binding/id_document_back_capture_binding.dart';
import '../presentation/identity_verification_setup_screen/binding/identity_verification_setup_binding.dart';
import '../presentation/government_id_setup_screen/binding/government_id_setup_binding.dart';
import '../presentation/app_navigation_screen/app_navigation_screen.dart';
import '../presentation/app_navigation_screen/binding/app_navigation_binding.dart';
import '../presentation/auth_gate_screen/auth_gate_screen.dart';
import '../presentation/login_screen/login_screen.dart';
import '../presentation/signup_screen/signup_screen.dart';
import '../presentation/phone_otp_screen/phone_otp_screen.dart';

// ignore_for_file: must_be_immutable
class AppRoutes {
  static const String authGateScreen = '/';
  static const String loginScreen = '/login_screen';
  static const String signupScreen = '/signup_screen';
  static const String phoneOtpScreen = '/phone_otp_screen';

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
  static const String eventBookingSettingsScreen =
      '/event_booking_settings_screen';
  static const String weekdayPricingSetupScreen =
      '/weekday_pricing_setup_screen';
  static const String createDiscountCouponsScreen =
      '/create_discount_coupons_screen';
  static const String weekendPricingSetupScreen =
      '/weekend_pricing_setup_screen';
  static const String baytAiSetupScreen = '/bayt_ai_setup_screen';
  static const String eventBookingConfigurationScreen =
      '/event_booking_configuration_screen';
  static const String packageSelectionScreen = '/package_selection_screen';
  static const String cancellationPolicySelectionScreen =
      '/cancellation_policy_selection_screen';
  static const String idDocumentFrontCaptureScreen =
      '/id_document_front_capture_screen';
  static const String idDocumentBackCaptureScreen =
      '/id_document_back_capture_screen';
  static const String identityVerificationSetupScreen =
      '/identity_verification_setup_screen';
  static const String governmentIdSetupScreen = '/government_id_setup_screen';

  static const String appNavigationScreen = '/app_navigation_screen';
  static const String initialRoute = authGateScreen;

  static List<GetPage> pages = [
    GetPage(
      name: authGateScreen,
      page: () => const AuthGateScreen(),
    ),
    GetPage(
      name: loginScreen,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: signupScreen,
      page: () => const SignupScreen(),
    ),
    GetPage(
      name: phoneOtpScreen,
      page: () => const PhoneOtpScreen(),
    ),
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
      name: eventBookingSettingsScreen,
      page: () => EventBookingSettingsScreen(),
      bindings: [EventBookingSettingsBinding()],
    ),
    GetPage(
      name: weekdayPricingSetupScreen,
      page: () => WeekdayPricingSetupScreen(),
      bindings: [WeekdayPricingSetupBinding()],
    ),
    GetPage(
      name: createDiscountCouponsScreen,
      page: () => CreateDiscountCouponsScreen(),
      bindings: [CreateDiscountCouponsBinding()],
    ),
    GetPage(
      name: weekendPricingSetupScreen,
      page: () => WeekendPricingSetupScreen(),
      bindings: [WeekendPricingSetupBinding()],
    ),
    GetPage(
      name: baytAiSetupScreen,
      page: () => BaytAiSetupScreen(),
      bindings: [BaytAiSetupBinding()],
    ),
    GetPage(
      name: eventBookingConfigurationScreen,
      page: () => EventBookingConfigurationScreen(),
      bindings: [EventBookingConfigurationBinding()],
    ),
    GetPage(
      name: packageSelectionScreen,
      page: () => PackageSelectionScreen(),
      bindings: [PackageSelectionBinding()],
    ),
    GetPage(
      name: cancellationPolicySelectionScreen,
      page: () => CancellationPolicySelectionScreen(),
      bindings: [CancellationPolicySelectionBinding()],
    ),
    GetPage(
      name: idDocumentFrontCaptureScreen,
      page: () => IdDocumentFrontCaptureScreen(),
      bindings: [IdDocumentFrontCaptureBinding()],
    ),
    GetPage(
      name: idDocumentBackCaptureScreen,
      page: () => IdDocumentBackCaptureScreen(),
      bindings: [IdDocumentBackCaptureBinding()],
    ),
    GetPage(
      name: identityVerificationSetupScreen,
      page: () => IdentityVerificationSetupScreen(),
      bindings: [IdentityVerificationSetupBinding()],
    ),
    GetPage(
      name: governmentIdSetupScreen,
      page: () => GovernmentIdSetupScreen(),
      bindings: [GovernmentIdSetupBinding()],
    ),
    GetPage(
      name: appNavigationScreen,
      page: () => AppNavigationScreen(),
      bindings: [AppNavigationBinding()],
    ),
  ];
}
