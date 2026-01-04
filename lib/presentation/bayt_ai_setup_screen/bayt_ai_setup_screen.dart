import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_image_view.dart';
import '../../widgets/custom_switch.dart';
import './controller/bayt_ai_setup_controller.dart';

class BaytAiSetupScreen extends GetWidget<BaytAiSetupController> {
  BaytAiSetupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F5F4),
      appBar: _buildAppBar(context),
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.only(
                  top: 16.h,
                  left: 16.h,
                  right: 16.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeaderSection(context),
                    _buildLogoSection(context),
                    _buildPricingEngineSection(context),
                  ],
                ),
              ),
            ),
            _buildBottomSection(context),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingIcon: ImageConstant.imgFrame2147234282,
      onLeadingPressed: () => Get.back(),
    );
  }

  /// Section Widget
  Widget _buildHeaderSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 196.h,
          child: Text(
            'Enable Bayt Ai for automated pricing',
            style: TextStyleHelper.instance.title18BoldSyne
                .copyWith(height: 1.17, color: Color(0xFF041816)),
          ),
        ),
        SizedBox(height: 27.h),
        SizedBox(
          width: 290.h,
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'B',
                  style: TextStyleHelper.instance.body13RegularPoppins
                      .copyWith(height: 1.46, color: Color(0xFFA2A2A2)),
                ),
                TextSpan(
                  text:
                      'ayt AI simplifies pricing by automatically optimizing rates for your property.',
                  style: TextStyleHelper.instance.body13RegularPoppins
                      .copyWith(height: 1.46, color: Color(0xFFA2A2A2)),
                ),
              ],
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildLogoSection(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 56.h,
        left: 80.h,
        right: 72.h,
      ),
      child: CustomImageView(
        imagePath: ImageConstant.imgGroup1000003416,
        height: 218.h,
        width: 206.h,
        fit: BoxFit.contain,
      ),
    );
  }

  /// Section Widget
  Widget _buildPricingEngineSection(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 76.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Bayt AI Pricing Engine',
                style: TextStyleHelper.instance.title16BoldPoppins
                    .copyWith(height: 1.5, color: Color(0xFF041816)),
              ),
              SizedBox(width: 6.h),
              CustomImageView(
                imagePath: ImageConstant.imgFluentWand20Regular,
                height: 22.h,
                width: 22.h,
                fit: BoxFit.contain,
              ),
              Spacer(),
              Obx(() => CustomSwitch(
                    value: controller.baytAiSetupModel.value
                            ?.isPricingEngineEnabled?.value ??
                        false,
                    onChanged: (value) {
                      controller.togglePricingEngine(value);
                    },
                    activeColor: Color(0xFF260F06),
                  )),
            ],
          ),
          SizedBox(height: 12.h),
          SizedBox(
            width: 353.h,
            child: Text(
              'Smart pricing updates your rates automatically according to demand, season, and market trends, helping you earn more with ease.',
              style: TextStyleHelper.instance.body13RegularPoppins
                  .copyWith(height: 1.54, color: Color(0xCC515151)),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildBottomSection(BuildContext context) {
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
        ),
      ),
      padding: EdgeInsets.only(
        top: 20.h,
        right: 38.h,
        bottom: 20.h,
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
