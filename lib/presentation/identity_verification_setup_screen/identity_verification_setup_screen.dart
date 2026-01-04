import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_image_view.dart';
import './controller/identity_verification_setup_controller.dart';

class IdentityVerificationSetupScreen
    extends GetWidget<IdentityVerificationSetupController> {
  IdentityVerificationSetupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F5F4),
      appBar: _buildAppBar(context),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Expanded(
              child: _buildMainContent(context),
            ),
            _buildBottomSection(context),
          ],
        ),
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
      padding: EdgeInsets.only(
        top: 18.h,
        left: 16.h,
        right: 16.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Finish and Publish',
            style: TextStyleHelper.instance.title18BoldSyne
                .copyWith(color: Color(0xFF041816), height: 1.22),
          ),
          Container(
            margin: EdgeInsets.only(top: 4.h),
            width: MediaQuery.of(context).size.width * 0.62,
            child: Text(
              'Complete the last steps and make your property live to begin hosting.',
              style: TextStyleHelper.instance.body13RegularPoppins
                  .copyWith(color: Color(0xFFA2A2A2), height: 1.46),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 36.h),
            child: Text(
              'Verify your identity',
              style: TextStyleHelper.instance.title16SemiBoldPoppins
                  .copyWith(color: Color(0xFF041816), height: 1.5),
            ),
          ),
          _buildVerificationOption(
            context,
            'We\'ll gather some information to verify you are you.',
            () => controller.onInformationVerificationTap(),
            topMargin: 8.h,
          ),
          _buildVerificationOption(
            context,
            'We\'ll text or call to verify your mobile number',
            () => controller.onMobileVerificationTap(),
            topMargin: 12.h,
          ),
        ],
      ),
    );
  }

  Widget _buildVerificationOption(
    BuildContext context,
    String text,
    VoidCallback onTap, {
    double topMargin = 0,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: topMargin),
        padding: EdgeInsets.symmetric(
          horizontal: 16.h,
          vertical: 12.h,
        ),
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(14.h),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                text,
                style: TextStyleHelper.instance.body13RegularPoppins
                    .copyWith(color: Color(0xFF515151), height: 1.54),
              ),
            ),
            CustomImageView(
              imagePath: ImageConstant.imgIconamoonArrowUp2LightBlack900,
              height: 24.h,
              width: 24.h,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomSection(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        top: 20.h,
        right: 38.h,
        bottom: 20.h,
      ),
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
      child: Align(
        alignment: Alignment.centerRight,
        child: CustomButton(
          text: 'Next',
          rightIcon: ImageConstant.imgMynauiarrowupWhiteA700,
          onPressed: () => controller.onNextPressed(),
        ),
      ),
    );
  }
}
