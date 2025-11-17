import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_edit_text.dart';
import '../../widgets/custom_switch.dart';
import './controller/extra_services_addons_controller.dart';

class ExtraServicesAddonsScreen
    extends GetWidget<ExtraServicesAddonsController> {
  ExtraServicesAddonsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF7F5F4),
        body: Column(children: [
          SizedBox(height: 42.h),
          _buildAppBar(),
          Expanded(child: _buildMainContent()),
          _buildBottomSection(),
        ]));
  }

  Widget _buildAppBar() {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(16.h, 6.h, 16.h, 6.h),
        child: CustomAppBar(
            leadingIcon: 'assets/images/img_frame_2147234282.svg',
            onLeadingPressed: () => Get.back(),
            backgroundColor: Colors.transparent,
            leadingButtonColor: Color(0xFFFFFFFF)));
  }

  Widget _buildMainContent() {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(10.h, 16.h, 10.h, 0.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
              margin: EdgeInsets.only(left: 6.h),
              child: Text('Extra services and add-ons',
                  style: TextStyleHelper.instance.title18BoldSyne
                      .copyWith(height: 1.17, color: Color(0xFF041816)))),
          SizedBox(height: 26.h),
          Container(
              margin: EdgeInsets.only(left: 6.h),
              child: Text('Include Extra Services with Pricing',
                  style: TextStyleHelper.instance.body13RegularPoppins
                      .copyWith(height: 1.54, color: Color(0xFFA2A2A2)))),
          SizedBox(height: 40.h),
          _buildAirportPickupSection(),
          SizedBox(height: 16.h),
          _buildDivider(),
          SizedBox(height: 14.h),
          _buildLunchSection(),
          SizedBox(height: 16.h),
          _buildDivider(),
          SizedBox(height: 14.h),
          _buildGuidedToursSection(),
          SizedBox(height: 40.h),
          _buildAddMoreServicesButton(),
        ]));
  }

  Widget _buildAirportPickupSection() {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 6.h),
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text('Airport pick-up',
                style: TextStyleHelper.instance.body14MediumPoppins
                    .copyWith(height: 1.57, color: Color(0xFF515151))),
            Obx(() => CustomSwitch(
                value: controller.extraServicesAddonsModel.value
                        ?.isAirportPickupEnabled!.value ??
                    false, // Modified: Added required value parameter
                onChanged: (value) => controller.toggleAirportPickup(value))),
          ]),
          SizedBox(height: 12.h),
          Obx(() => Visibility(
              visible: controller.extraServicesAddonsModel.value
                      ?.isAirportPickupEnabled!.value ??
                  false,
              child: Row(children: [
                Expanded(
                    child: CustomEditText(
                        controller: controller.airportPickupPriceController,
                        placeholder: '50.00',
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        borderColor: Color(0xFFD9D9D9))),
                SizedBox(width: 16.h),
                Container(
                    alignment: Alignment.bottomCenter,
                    child: Text('AED',
                        style: TextStyleHelper.instance.body14MediumPoppins
                            .copyWith(height: 1.5, color: Color(0xFF515151)))),
              ]))),
        ]));
  }

  Widget _buildLunchSection() {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 6.h),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text('Lunch',
              style: TextStyleHelper.instance.body14MediumPoppins
                  .copyWith(height: 1.57, color: Color(0xFF515151))),
          Obx(() => CustomSwitch(
              value: controller
                      .extraServicesAddonsModel.value?.isLunchEnabled!.value ??
                  false, // Modified: Added required value parameter
              onChanged: (value) => controller.toggleLunch(value))),
        ]));
  }

  Widget _buildGuidedToursSection() {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 6.h),
        child: Column(spacing: 12.h, children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text('Guided tours',
                style: TextStyleHelper.instance.body14MediumPoppins
                    .copyWith(height: 1.57, color: Color(0xFF515151))),
            Obx(() => CustomSwitch(
                value: controller.extraServicesAddonsModel.value
                        ?.isGuidedToursEnabled!.value ??
                    false, // Modified: Added required value parameter
                onChanged: (value) => controller.toggleGuidedTours(value))),
          ]),
          Obx(() => Visibility(
              visible: controller.extraServicesAddonsModel.value
                      ?.isGuidedToursEnabled!.value ??
                  false,
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Expanded(
                    child: CustomEditText(
                        controller: controller.guidedToursPriceController,
                        placeholder: '125.00',
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        borderColor: Color(0xFFD9D9D9))),
                SizedBox(width: 16.h),
                Container(
                    alignment: Alignment.bottomCenter,
                    child: Text('AED',
                        style: TextStyleHelper.instance.body14MediumPoppins
                            .copyWith(height: 1.5, color: Color(0xFF515151)))),
              ]))),
        ]));
  }

  Widget _buildDivider() {
    return Container(
        height: 1.h, width: double.infinity, color: Color(0x66D9D9D9));
  }

  Widget _buildAddMoreServicesButton() {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 6.h),
        decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(24.h),
            boxShadow: [
              BoxShadow(
                  color: Color(0x14000000),
                  offset: Offset(2, 2),
                  blurRadius: 8.h),
            ]),
        child: Row(children: [
          Container(
              padding: EdgeInsets.all(12.h),
              child: Image.asset(ImageConstant.imgLineiconsPlus,
                  width: 24.h, height: 24.h)),
          SizedBox(width: 8.h),
          Expanded(
              child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 14.h),
                  child: Text('Add more services',
                      style: TextStyleHelper.instance.body14MediumSyne
                          .copyWith(height: 1.21, color: Color(0xFF000000))))),
          SizedBox(width: 30.h),
        ]));
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
                stops: [
              0.0,
              0.5,
              1.0
            ])),
        child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          CustomButton(
              text: 'Next',
              rightIcon: 'assets/images/img_mynauiarrowup_white_a700.svg',
              backgroundColor: Color(0xFF260F06),
              textColor: Color(0xFFFFFFFF),
              onPressed: () => controller.onNextButtonPressed()),
        ]));
  }
}
