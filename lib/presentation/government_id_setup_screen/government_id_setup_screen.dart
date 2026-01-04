import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_dropdown.dart';
import './controller/government_id_setup_controller.dart';

class GovernmentIdSetupScreen extends GetWidget<GovernmentIdSetupController> {
  const GovernmentIdSetupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F5F4),
      appBar: _buildAppBar(),
      body: Column(
        children: [
          Expanded(
            child: _buildMainContent(),
          ),
          _buildBottomSection(),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      leadingIcon: ImageConstant.imgFrame2147234282,
      onLeadingPressed: () => Get.back(),
      backgroundColor: Color(0xFFF7F5F4),
    );
  }

  Widget _buildMainContent() {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.h, 18.h, 16.h, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeaderSection(),
          SizedBox(height: 20.h),
          _buildCountryDropdown(),
          SizedBox(height: 12.h),
          _buildIdOptionsSection(),
          SizedBox(height: 26.h),
          _buildPrivacyNotice(),
        ],
      ),
    );
  }

  Widget _buildHeaderSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Add your government ID",
          style: TextStyleHelper.instance.title18BoldSyne
              .copyWith(color: Color(0xFF041816)),
        ),
        SizedBox(height: 20.h),
        Text(
          "Provide an official government ID according to your country's regulations.",
          style: TextStyleHelper.instance.body13RegularPoppins
              .copyWith(color: Color(0xFFA2A2A2), height: 1.46),
        ),
      ],
    );
  }

  Widget _buildCountryDropdown() {
    return Obx(() => CustomDropdown(
          hintText: "Issuing country/Region",
          value: controller.selectedCountry.value.isNotEmpty
              ? controller.selectedCountry.value
              : null,
          items: controller.countries,
          onChanged: (value) {
            controller.updateSelectedCountry(value ?? '');
          },
        ));
  }

  Widget _buildIdOptionsSection() {
    return Column(
      children: [
        _buildIdOption(
          title: "Driving License",
          onTap: () => controller.selectIdType("driving_license"),
        ),
        SizedBox(height: 12.h),
        _buildIdOption(
          title: "Passport",
          onTap: () => controller.selectIdType("passport"),
        ),
        SizedBox(height: 12.h),
        _buildIdOption(
          title: "Identity Card",
          onTap: () => controller.selectIdType("identity_card"),
        ),
      ],
    );
  }

  Widget _buildIdOption({required String title, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 10.h),
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(14.h),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyleHelper.instance.body13MediumPoppins
                  .copyWith(color: Color(0xFF515151)),
            ),
            Image.asset(
              ImageConstant.imgIconamoonArrowUp2LightBlack900,
              width: 24.h,
              height: 24.h,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPrivacyNotice() {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "Your info is handled according to our ",
            style: TextStyleHelper.instance.body13RegularPoppins
                .copyWith(color: Color(0xFFA2A2A2)),
          ),
          TextSpan(
            text: "Privacy Policy.",
            style: TextStyleHelper.instance.body13SemiBoldPoppins.copyWith(
                color: Color(0xFF605C5C), decoration: TextDecoration.underline),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomSection() {
    return Container(
      width: double.infinity,
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
        ),
      ),
      child: Align(
        alignment: Alignment.centerRight,
        child: CustomButton(
          text: "Next",
          rightIcon: ImageConstant.imgMynauiarrowupWhiteA700,
          onPressed: () => controller.proceedToNext(),
        ),
      ),
    );
  }
}
