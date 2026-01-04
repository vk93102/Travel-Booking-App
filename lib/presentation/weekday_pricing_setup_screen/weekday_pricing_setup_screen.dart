import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_dropdown.dart';
import '../../widgets/custom_switch.dart';
import './controller/weekday_pricing_setup_controller.dart';

class WeekdayPricingSetupScreen
    extends GetWidget<WeekdayPricingSetupController> {
  const WeekdayPricingSetupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF7F5F4),
        appBar: _buildAppBar(context),
        body: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.h),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 16.h),
                      Text("Set the base price for weekdays",
                          style: TextStyleHelper.instance.title18BoldSyne
                              .copyWith(color: Color(0xFF041816))),
                      SizedBox(height: 16.h),
                      Text("Set your weekday rates",
                          style: TextStyleHelper.instance.body13RegularPoppins
                              .copyWith(color: Color(0xFFA2A2A2))),
                      SizedBox(height: 30.h),
                      _buildTotalPriceSection(),
                      SizedBox(height: 40.h),
                      _buildPriceBreakdownSection(),
                      SizedBox(height: 40.h),
                      _buildEarningsSection(),
                      SizedBox(height: 50.h),
                      _buildHourlyBookingSection(),
                      SizedBox(height: 32.h),
                    ]))),
        bottomNavigationBar: _buildBottomSection(context));
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingIcon: ImageConstant.imgFrame2147234282,
        onLeadingPressed: () => Get.back());
  }

  Widget _buildTotalPriceSection() {
    return Center(
        child: RichText(
            text: TextSpan(children: [
      TextSpan(
          text: "600.00 ",
          style: TextStyleHelper.instance.display40BoldPoppins
              .copyWith(color: Color(0xFF041816))),
      TextSpan(
          text: "AED",
          style: TextStyleHelper.instance.headline24SemiBoldPoppins
              .copyWith(color: Color(0xFF041816))),
    ])));
  }

  Widget _buildPriceBreakdownSection() {
    return Container(
        padding: EdgeInsets.all(20.h),
        decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(14.h)),
        child: Column(spacing: 12.h, children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("Base Fare",
                style: TextStyleHelper.instance.body13RegularPoppins
                    .copyWith(color: Color(0xFF515151))),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: "450.00",
                  style: TextStyleHelper.instance.body13RegularPoppins
                      .copyWith(color: Color(0xCC515151))),
              TextSpan(
                  text: " ",
                  style: TextStyleHelper.instance.body14RegularPoppins
                      .copyWith(color: Color(0xCC515151))),
              TextSpan(
                  text: "AED",
                  style: TextStyleHelper.instance.body12RegularPoppins
                      .copyWith(color: Color(0xCC515151))),
            ])),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("Guest Service Fee",
                style: TextStyleHelper.instance.body13RegularPoppins
                    .copyWith(color: Color(0xFF515151))),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: "150.00",
                  style: TextStyleHelper.instance.body13RegularPoppins
                      .copyWith(color: Color(0xCC515151))),
              TextSpan(
                  text: " ",
                  style: TextStyleHelper.instance.body14RegularPoppins
                      .copyWith(color: Color(0xCC515151))),
              TextSpan(
                  text: "AED",
                  style: TextStyleHelper.instance.body12RegularPoppins
                      .copyWith(color: Color(0xCC515151))),
            ])),
          ]),
          Container(
              width: double.infinity, height: 1.h, color: Color(0xFFD9D9D9)),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("Guest Price",
                style: TextStyleHelper.instance.body14SemiBoldPoppins
                    .copyWith(color: Color(0xFF041816))),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: "600.00",
                  style: TextStyleHelper.instance.body14SemiBoldPoppins
                      .copyWith(color: Color(0xCC041816))),
              TextSpan(
                  text: " ",
                  style: TextStyleHelper.instance.title16SemiBoldPoppins
                      .copyWith(color: Color(0xCC041816))),
              TextSpan(
                  text: "AED",
                  style: TextStyleHelper.instance.body13SemiBoldPoppins
                      .copyWith(color: Color(0xCC041816))),
            ])),
          ]),
        ]));
  }

  Widget _buildEarningsSection() {
    return Container(
        padding: EdgeInsets.all(12.h),
        decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(14.h)),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text("Your Earnings",
              style: TextStyleHelper.instance.title15SemiBoldPoppins
                  .copyWith(color: Color(0xFF041816))),
          RichText(
              text: TextSpan(children: [
            TextSpan(
                text: "450.00",
                style: TextStyleHelper.instance.title15SemiBoldPoppins
                    .copyWith(color: Color(0xCC041816))),
            TextSpan(
                text: " ",
                style: TextStyleHelper.instance.title18SemiBoldPoppins
                    .copyWith(color: Color(0xCC041816))),
            TextSpan(
                text: "AED",
                style: TextStyleHelper.instance.body13SemiBoldPoppins
                    .copyWith(color: Color(0xCC041816))),
          ])),
        ]));
  }

  Widget _buildHourlyBookingSection() {
    return Column(spacing: 12.h, children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text("Add hourly booking rates",
            style: TextStyleHelper.instance.body14MediumPoppins
                .copyWith(color: Color(0xFF515151))),
        Obx(() => CustomSwitch(
            value: controller.weekdayPricingSetupModel.value
                    ?.isHourlyBookingEnabled?.value ??
                false, // Modified: Added required value parameter
            onChanged: controller.onHourlyBookingToggle)),
      ]),
      Obx(() {
        return Visibility(
            visible: controller.weekdayPricingSetupModel.value
                    ?.isHourlyBookingEnabled!.value ??
                false,
            child: Container(
                padding: EdgeInsets.all(12.h),
                decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(14.h)),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Add booking hours",
                          style: TextStyleHelper.instance.body14SemiBoldPoppins
                              .copyWith(color: Color(0xFF444444))),
                      SizedBox(height: 8.h),
                      CustomDropdown(
                          hintText: "04 hours",
                          items: [
                            '01 hours',
                            '02 hours',
                            '03 hours',
                            '04 hours',
                            '05 hours',
                            '06 hours'
                          ],
                          onChanged: controller.onHoursChanged),
                      SizedBox(height: 30.h),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                  text: "Rate ",
                                  style: TextStyleHelper
                                      .instance.body14SemiBoldPoppins
                                      .copyWith(color: Color(0xFF444444))),
                              TextSpan(
                                  text: "(calculated from the base fare)",
                                  style: TextStyleHelper
                                      .instance.body12RegularPoppins
                                      .copyWith(color: Color(0xFF444444))),
                            ])),
                            GestureDetector(
                                onTap: controller.onEnterManually,
                                child: Text("Enter manually",
                                    style: TextStyleHelper
                                        .instance.body12MediumPoppins
                                        .copyWith(
                                            color: Color(0xFF444444),
                                            decoration:
                                                TextDecoration.underline))),
                          ]),
                      SizedBox(height: 8.h),
                      Center(
                          child: RichText(
                              text: TextSpan(children: [
                        TextSpan(
                            text: "180.00 ",
                            style: TextStyleHelper.instance.display40BoldPoppins
                                .copyWith(color: Color(0xFF041816))),
                        TextSpan(
                            text: "AED",
                            style: TextStyleHelper
                                .instance.headline24SemiBoldPoppins
                                .copyWith(color: Color(0xFF041816))),
                      ]))),
                      SizedBox(height: 8.h),
                      Container(
                          width: double.infinity,
                          height: 1.h,
                          color: Color(0xFFD9D9D9)),
                      SizedBox(height: 10.h),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Your Earnings",
                                style: TextStyleHelper
                                    .instance.title15SemiBoldPoppins
                                    .copyWith(color: Color(0xFF041816))),
                            RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                  text: "120.00",
                                  style: TextStyleHelper
                                      .instance.title15SemiBoldPoppins
                                      .copyWith(color: Color(0xFF041816))),
                              TextSpan(
                                  text: " ",
                                  style: TextStyleHelper
                                      .instance.title18SemiBoldPoppins
                                      .copyWith(color: Color(0xFF041816))),
                              TextSpan(
                                  text: "AED",
                                  style: TextStyleHelper
                                      .instance.body13SemiBoldPoppins
                                      .copyWith(color: Color(0xFF041816))),
                            ])),
                          ]),
                      SizedBox(height: 10.h),
                    ])));
      }),
    ]);
  }

  Widget _buildBottomSection(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 20.h, right: 38.h, bottom: 20.h),
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
        child: Align(
            alignment: Alignment.centerRight,
            child: CustomButton(
                text: "Next",
                rightIcon: ImageConstant.imgMynauiarrowupWhiteA700,
                onPressed: controller.onNextPressed)));
  }
}
