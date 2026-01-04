import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_image_view.dart';
import './controller/booking_preference_setup_controller.dart';

class BookingPreferenceSetupScreen
    extends GetWidget<BookingPreferenceSetupController> {
  BookingPreferenceSetupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F5F4),
      appBar: _buildAppBar(context),
      body: Column(
        children: [
          Expanded(
            child: _buildMainContent(context),
          ),
          _buildBottomSection(context),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingIcon: ImageConstant.imgFrame2147234282,
      onLeadingPressed: () => Get.back(),
    );
  }

  Widget _buildMainContent(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.h, 16.h, 16.h, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Set up your booking preference',
            style: TextStyleHelper.instance.title18BoldSyne
                .copyWith(color: Color(0xFF041816)),
          ),
          SizedBox(height: 12.h),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Settings can be updated anytime. ',
                  style: TextStyleHelper.instance.body13RegularPoppins
                      .copyWith(color: Color(0xFFA2A2A2)),
                ),
                TextSpan(
                  text: 'Learn more',
                  style: TextStyleHelper.instance.body13SemiBoldPoppins
                      .copyWith(
                          color: Color(0xFF605C5C),
                          decoration: TextDecoration.underline),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          Expanded(
            child: _buildBookingOptionsList(context),
          ),
        ],
      ),
    );
  }

  Widget _buildBookingOptionsList(BuildContext context) {
    return Obx(() => Column(
          spacing: 12.h,
          children: [
            _buildBookingOption(
              context,
              title: 'Instant Booking',
              description:
                  'Let Customers book instantly. No prior request or approval needed.',
              iconPath: ImageConstant.imgAkarIconsThunder,
              isSelected: controller.selectedBookingType.value == 'instant',
              onTap: () => controller.selectBookingType('instant'),
            ),
            _buildBookingOption(
              context,
              title: 'Reservation Booking',
              description:
                  'Let Customers reserve initially, and book only when you approve their booking.',
              iconPath: ImageConstant.imgMynauiFile,
              isSelected: controller.selectedBookingType.value == 'reservation',
              onTap: () => controller.selectBookingType('reservation'),
            ),
            _buildBookingOption(
              context,
              title: 'Hourly Booking',
              description:
                  'Create booking flexibility for the customers depending on their needs and requirement.',
              iconPath: ImageConstant.imgMaterialSymbol,
              isSelected: controller.selectedBookingType.value == 'hourly',
              onTap: () => controller.selectBookingType('hourly'),
            ),
          ],
        ));
  }

  Widget _buildBookingOption(
    BuildContext context, {
    required String title,
    required String description,
    required String iconPath,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.h),
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(10.h),
          border: isSelected
              ? Border.all(
                  width: 1.h,
                  color: Color(0xFFB5804F),
                )
              : null,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 6.h,
                children: [
                  Text(
                    title,
                    style: TextStyleHelper.instance.body14MediumPoppins
                        .copyWith(color: Color(0xFF041816)),
                  ),
                  Text(
                    description,
                    style: TextStyleHelper.instance.body13RegularPoppins
                        .copyWith(color: Color(0xFF888888)),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 8.h),
              child: CustomImageView(
                imagePath: iconPath,
                height: 40.h,
                width: 40.h,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(38.h, 20.h, 38.h, 20.h),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0x00F7F5F4),
            Color(0x99F7F5F4),
            Color(0xFFF7F5F4),
          ],
          stops: [0.0, 0.5, 1.0],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomButton(
            text: 'Next',
            rightIcon: ImageConstant.imgMynauiarrowupWhiteA700,
            onPressed: () => controller.onNextPressed(),
          ),
        ],
      ),
    );
  }
}
