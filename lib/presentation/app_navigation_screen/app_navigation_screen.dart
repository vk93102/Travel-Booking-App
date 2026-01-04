import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import './controller/app_navigation_controller.dart';

// ignore_for_file: must_be_immutable

class AppNavigationScreen extends GetWidget<AppNavigationController> {
  const AppNavigationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFFFFFFFF),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(top: 10.h),
                  child: Column(
                    children: [
                      _buildScreenTitle(
                        context,
                        screenTitle: "iPhone 16 - 580",
                        onTapScreenTitle: () => onTapScreenTitle(
                            context, AppRoutes.hostOnboardingScreen),
                      ),
                      _buildScreenTitle(
                        context,
                        screenTitle: "iPhone 16 - 582",
                        onTapScreenTitle: () => onTapScreenTitle(
                            context, AppRoutes.hostCategorySelectionScreen),
                      ),
                      _buildScreenTitle(
                        context,
                        screenTitle: "iPhone 16 - 586",
                        onTapScreenTitle: () => onTapScreenTitle(
                            context, AppRoutes.locationSharingScreen),
                      ),
                      _buildScreenTitle(
                        context,
                        screenTitle: "iPhone 16 - 590",
                        onTapScreenTitle: () => onTapScreenTitle(
                            context, AppRoutes.propertyDetailsSetupScreen),
                      ),
                      _buildScreenTitle(
                        context,
                        screenTitle: "iPhone 16 - 594",
                        onTapScreenTitle: () => onTapScreenTitle(
                            context, AppRoutes.guestLimitSetupScreen),
                      ),
                      _buildScreenTitle(
                        context,
                        screenTitle: "iPhone 16 - 593",
                        onTapScreenTitle: () => onTapScreenTitle(
                            context, AppRoutes.propertyRegistrationScreen),
                      ),
                      _buildScreenTitle(
                        context,
                        screenTitle: "iPhone 16 - 585",
                        onTapScreenTitle: () => onTapScreenTitle(
                            context, AppRoutes.propertyCategorySelectionScreen),
                      ),
                      _buildScreenTitle(
                        context,
                        screenTitle: "iPhone 16 - 589",
                        onTapScreenTitle: () => onTapScreenTitle(
                            context, AppRoutes.propertyAddressFormScreen),
                      ),
                      _buildScreenTitle(
                        context,
                        screenTitle: "iPhone 16 - 604",
                        onTapScreenTitle: () => onTapScreenTitle(
                            context, AppRoutes.uploadedPhotosGalleryScreen),
                      ),
                      _buildScreenTitle(
                        context,
                        screenTitle: "iPhone 16 - 603",
                        onTapScreenTitle: () => onTapScreenTitle(
                            context, AppRoutes.photoUploadGalleryScreen),
                      ),
                      _buildScreenTitle(
                        context,
                        screenTitle: "iPhone 16 - 599",
                        onTapScreenTitle: () => onTapScreenTitle(
                            context, AppRoutes.extraServicesAddonsScreen),
                      ),
                      _buildScreenTitle(
                        context,
                        screenTitle: "iPhone 16 - 596",
                        onTapScreenTitle: () => onTapScreenTitle(context,
                            AppRoutes.propertyAmenitiesSelectionScreen),
                      ),
                      _buildScreenTitle(
                        context,
                        screenTitle: "iPhone 16 - 600",
                        onTapScreenTitle: () => onTapScreenTitle(
                            context, AppRoutes.propertyPhotoUploadScreen),
                      ),
                      _buildScreenTitle(
                        context,
                        screenTitle: "iPhone 16 - 608",
                        onTapScreenTitle: () => onTapScreenTitle(
                            context, AppRoutes.bookingPreferenceSetupScreen),
                      ),
                      _buildScreenTitle(
                        context,
                        screenTitle: "iPhone 16 - 616",
                        onTapScreenTitle: () => onTapScreenTitle(
                            context, AppRoutes.eventBookingSettingsScreen),
                      ),
                      _buildScreenTitle(
                        context,
                        screenTitle: "iPhone 16 - 609",
                        onTapScreenTitle: () => onTapScreenTitle(
                            context, AppRoutes.weekdayPricingSetupScreen),
                      ),
                      _buildScreenTitle(
                        context,
                        screenTitle: "iPhone 16 - 615",
                        onTapScreenTitle: () => onTapScreenTitle(
                            context, AppRoutes.createDiscountCouponsScreen),
                      ),
                      _buildScreenTitle(
                        context,
                        screenTitle: "iPhone 16 - 610",
                        onTapScreenTitle: () => onTapScreenTitle(
                            context, AppRoutes.weekendPricingSetupScreen),
                      ),
                      _buildScreenTitle(
                        context,
                        screenTitle: "iPhone 16 - 614",
                        onTapScreenTitle: () => onTapScreenTitle(
                            context, AppRoutes.baytAiSetupScreen),
                      ),
                      _buildScreenTitle(
                        context,
                        screenTitle: "iPhone 16 - 620",
                        onTapScreenTitle: () => onTapScreenTitle(
                            context, AppRoutes.eventBookingConfigurationScreen),
                      ),
                      _buildScreenTitle(
                        context,
                        screenTitle: "iPhone 16 - 622",
                        onTapScreenTitle: () => onTapScreenTitle(
                            context, AppRoutes.packageSelectionScreen),
                      ),
                      _buildScreenTitle(
                        context,
                        screenTitle: "iPhone 16 - 621",
                        onTapScreenTitle: () => onTapScreenTitle(context,
                            AppRoutes.cancellationPolicySelectionScreen),
                      ),
                      _buildScreenTitle(
                        context,
                        screenTitle: "iPhone 16 - 630",
                        onTapScreenTitle: () => onTapScreenTitle(
                            context, AppRoutes.idDocumentFrontCaptureScreen),
                      ),
                      _buildScreenTitle(
                        context,
                        screenTitle: "iPhone 16 - 631",
                        onTapScreenTitle: () => onTapScreenTitle(
                            context, AppRoutes.idDocumentBackCaptureScreen),
                      ),
                      _buildScreenTitle(
                        context,
                        screenTitle: "iPhone 16 - 624",
                        onTapScreenTitle: () => onTapScreenTitle(
                            context, AppRoutes.identityVerificationSetupScreen),
                      ),
                      _buildScreenTitle(
                        context,
                        screenTitle: "iPhone 16 - 629",
                        onTapScreenTitle: () => onTapScreenTitle(
                            context, AppRoutes.governmentIdSetupScreen),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  /// Common widget
  Widget _buildScreenTitle(
    BuildContext context, {
    required String screenTitle,
    Function? onTapScreenTitle,
  }) {
    return GestureDetector(
      onTap: () {
        onTapScreenTitle?.call();
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        decoration: BoxDecoration(color: Color(0XFFFFFFFF)),
        child: Column(
          children: [
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  screenTitle,
                  textAlign: TextAlign.center,
                  style: TextStyleHelper.instance.title20RegularRoboto
                      .copyWith(color: Color(0XFF000000)),
                ),
                Icon(
                  Icons.arrow_forward,
                  color: Color(0XFF343330),
                )
              ],
            ),
            SizedBox(height: 10.h),
            Divider(height: 1.h, thickness: 1.h, color: Color(0XFFD2D2D2)),
          ],
        ),
      ),
    );
  }

  /// Common click event
  void onTapScreenTitle(BuildContext context, String routeName) {
    Get.toNamed(routeName);
  }

  /// Common click event for bottomsheet
  void onTapBottomSheetTitle(BuildContext context, Widget className) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return className;
      },
      isScrollControlled: true,
      backgroundColor: appTheme.transparentCustom,
    );
  }

  /// Common click event for dialog
  void onTapDialogTitle(BuildContext context, Widget className) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: className,
          backgroundColor: appTheme.transparentCustom,
          insetPadding: EdgeInsets.zero,
        );
      },
    );
  }
}
