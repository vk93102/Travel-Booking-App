import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_image_view.dart';
import '../../widgets/custom_switch.dart';
import './controller/event_booking_settings_controller.dart';

class EventBookingSettingsScreen
    extends GetWidget<EventBookingSettingsController> {
  EventBookingSettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F5F4),
      appBar: _buildAppBar(context),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                  top: 18.h,
                  left: 16.h,
                  right: 16.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeaderSection(),
                    _buildEventIllustration(),
                    _buildAllowEventBookingsSection(),
                  ],
                ),
              ),
            ),
          ),
          _buildNextButtonSection(),
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

  Widget _buildHeaderSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 204.h,
          child: Text(
            'Allow your property to host events',
            style: TextStyleHelper.instance.title18BoldSyne
                .copyWith(color: Color(0xFF041816), height: 1.17),
          ),
        ),
        SizedBox(height: 2.h),
        SizedBox(
          width: 290.h,
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Ev',
                  style: TextStyleHelper.instance.body13RegularPoppins
                      .copyWith(color: Color(0xFFA2A2A2), height: 1.46),
                ),
                TextSpan(
                  text:
                      'ent bookings can significantly increase your earnings.',
                  style: TextStyleHelper.instance.body13RegularPoppins
                      .copyWith(color: Color(0xFFA2A2A2), height: 1.46),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEventIllustration() {
    return Container(
      margin: EdgeInsets.only(top: 30.h),
      child: Center(
        child: CustomImageView(
          imagePath: ImageConstant.imgRectangle39597,
          width: 302.h,
          height: 302.h,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget _buildAllowEventBookingsSection() {
    return Container(
      margin: EdgeInsets.only(top: 40.h),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Allow Event Bookings',
                style: TextStyleHelper.instance.title16BoldPoppins
                    .copyWith(color: Color(0xFF041816), height: 1.5),
              ),
              Obx(
                () => CustomSwitch(
                  value: controller.eventBookingSettingsModel.value
                          ?.isEventBookingEnabled?.value ??
                      true,
                  onChanged: (value) {
                    controller.toggleEventBooking(value);
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Text(
            'Enable this option to allow guests to book your property for special events such as parties, weddings, or corporate gatherings.',
            style: TextStyleHelper.instance.body13RegularPoppins
                .copyWith(color: Color(0x80515151), height: 1.54),
          ),
          SizedBox(height: 48.h),
        ],
      ),
    );
  }

  Widget _buildNextButtonSection() {
    return Container(
      width: double.infinity,
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
      padding: EdgeInsets.only(
        top: 20.h,
        right: 38.h,
        bottom: 20.h,
      ),
      child: Align(
        alignment: Alignment.centerRight,
        child: CustomButton(
          text: 'Next',
          rightIcon: ImageConstant.imgMynauiarrowupWhiteA700,
          onPressed: () {
            controller.onNextPressed();
          },
        ),
      ),
    );
  }
}
