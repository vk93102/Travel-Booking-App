import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_dropdown.dart';
import '../../widgets/custom_switch.dart';
import './controller/weekend_pricing_setup_controller.dart';

class WeekendPricingSetupScreen
    extends GetWidget<WeekendPricingSetupController> {
  const WeekendPricingSetupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF7F5F4),
        appBar: _buildAppBar(),
        body: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.h),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 16.h),
                      _buildHeaderSection(),
                      SizedBox(height: 30.h),
                      _buildPriceDisplay(),
                      SizedBox(height: 40.h),
                      _buildPriceBredownCard(),
                      SizedBox(height: 40.h),
                      _buildYourEarningsCard(),
                      SizedBox(height: 50.h),
                      _buildHourlyBookingSection(),
                      SizedBox(height: 32.h),
                    ]))),
        bottomSheet: _buildBottomSection());
  }

  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        leadingIcon: ImageConstant.imgFrame2147234282,
        onLeadingPressed: () => Get.back());
  }

  Widget _buildHeaderSection() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(
          width: 190.h,
          child: Text('Set the base price for weekends',
              style: TextStyleHelper.instance.title18BoldSyne
                  .copyWith(color: Color(0xFF041816), height: 1.17))),
      SizedBox(height: 26.h),
      Text('Set your weekend rates',
          style: TextStyleHelper.instance.body13RegularPoppins
              .copyWith(color: Color(0xFFA2A2A2), height: 1.54)),
    ]);
  }

  Widget _buildPriceDisplay() {
    return Obx(() => Center(
            child: RichText(
                text: TextSpan(children: [
          TextSpan(
              text:
                  '${controller.weekendPricingModel.value?.basePrice!.value ?? "850.00"} ',
              style: TextStyleHelper.instance.display40BoldPoppins
                  .copyWith(color: Color(0xFF041816), height: 1.5)),
          TextSpan(
              text: 'AED',
              style: TextStyleHelper.instance.headline24SemiBoldPoppins
                  .copyWith(color: Color(0xFF041816), height: 2.5)),
        ]))));
  }

  Widget _buildPriceBredownCard() {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 20.h),
        decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(14.h)),
        child: Column(children: [
          Obx(() => _buildPriceRow(
              'Base Fare',
              '${controller.weekendPricingModel.value?.baseFare!.value ?? "650.00"} AED',
              false)),
          SizedBox(height: 12.h),
          Obx(() => _buildPriceRow(
              'Guest Service Fee',
              '${controller.weekendPricingModel.value?.guestServiceFee!.value ?? "200.00"} AED',
              false)),
          SizedBox(height: 12.h),
          Container(
              height: 1.h,
              width: double.infinity,
              color: Color(0xFFD9D9D9),
              margin: EdgeInsets.symmetric(horizontal: 2.h)),
          SizedBox(height: 12.h),
          Obx(() => _buildPriceRow(
              'Guest Price',
              '${controller.weekendPricingModel.value?.guestPrice!.value ?? "850.00"} AED',
              true)),
        ]));
  }

  Widget _buildPriceRow(String label, String amount, bool isBold) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.h),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(label,
              style: TextStyle(
                  fontSize: isBold ? 14.fSize : 13.fSize,
                  fontFamily: 'Poppins',
                  fontWeight: isBold ? FontWeight.w600 : FontWeight.w400,
                  color: isBold ? Color(0xFF041816) : Color(0xFF515151),
                  height: isBold ? 1.57 : 1.54)),
          RichText(text: TextSpan(children: _parseAmountText(amount, isBold))),
        ]));
  }

  List<TextSpan> _parseAmountText(String amount, bool isBold) {
    final parts = amount.split(' ');
    return [
      TextSpan(
          text: '${parts[0]} ',
          style: TextStyle(
              fontSize: isBold ? 14.fSize : 13.fSize,
              fontFamily: 'Poppins',
              fontWeight: isBold ? FontWeight.w600 : FontWeight.w400,
              color: isBold ? Color(0xFF041816) : Color(0xCC515151))),
      TextSpan(
          text: parts[1],
          style: TextStyle(
              fontSize: isBold ? 13.fSize : 12.fSize,
              fontFamily: 'Poppins',
              fontWeight: isBold ? FontWeight.w600 : FontWeight.w400,
              color: isBold ? Color(0xFF041816) : Color(0xCC515151))),
    ];
  }

  Widget _buildYourEarningsCard() {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.all(12.h),
        decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(14.h)),
        child: Obx(() =>
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text('Your Earnings',
                  style: TextStyleHelper.instance.title15BoldPoppins
                      .copyWith(color: Color(0xFF041816), height: 1.53)),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text:
                        '${controller.weekendPricingModel.value?.yourEarnings!.value ?? "650.00"} ',
                    style: TextStyleHelper.instance.title15SemiBoldPoppins
                        .copyWith(color: Color(0xFF041816))),
                TextSpan(
                    text: 'AED',
                    style: TextStyleHelper.instance.body13SemiBoldPoppins
                        .copyWith(color: Color(0xFF041816))),
              ])),
            ])));
  }

  Widget _buildHourlyBookingSection() {
    return Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text('Add hourly booking rates',
            style: TextStyleHelper.instance.body14MediumPoppins
                .copyWith(color: Color(0xFF515151), height: 1.57)),
        Obx(() => CustomSwitch(
            value: controller
                    .weekendPricingModel.value?.isHourlyBookingEnabled!.value ??
                false, // Modified: Added required value parameter
            onChanged: (value) => controller.toggleHourlyBooking(value))),
      ]),
      SizedBox(height: 12.h),
      Obx(() =>
          controller.weekendPricingModel.value?.isHourlyBookingEnabled!.value ==
                  true
              ? _buildHourlyBookingCard()
              : SizedBox.shrink()),
    ]);
  }

  Widget _buildHourlyBookingCard() {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 12.h),
        decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(14.h)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.h),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Add booking hours',
                        style: TextStyleHelper.instance.body14SemiBoldPoppins
                            .copyWith(color: Color(0xFF444444), height: 1.5)),
                    SizedBox(height: 8.h),
                    Obx(() => CustomDropdown(
                        hintText: controller.weekendPricingModel.value
                                ?.selectedHours!.value ??
                            '04 hours',
                        items: controller.hoursList,
                        onChanged: (value) =>
                            controller.updateSelectedHours(value))),
                  ])),
          SizedBox(height: 30.h),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.h),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: 'Rate ',
                          style: TextStyleHelper.instance.body14SemiBoldPoppins
                              .copyWith(color: Color(0xFF444444))),
                      TextSpan(
                          text: '(calculated from the base fare)',
                          style: TextStyleHelper.instance.body12RegularPoppins
                              .copyWith(color: Color(0xFF444444))),
                    ])),
                    GestureDetector(
                        onTap: () => controller.toggleManualEntry(),
                        child: Text('Enter manually',
                            style: TextStyleHelper.instance.body12MediumPoppins
                                .copyWith(
                                    color: Color(0xFF444444),
                                    decoration: TextDecoration.underline,
                                    height: 1.5))),
                  ])),
          SizedBox(height: 8.h),
          Obx(() => Center(
                  child: RichText(
                      text: TextSpan(children: [
                TextSpan(
                    text:
                        '${controller.weekendPricingModel.value?.hourlyRate!.value ?? "220.00"} ',
                    style: TextStyleHelper.instance.display40BoldPoppins
                        .copyWith(color: Color(0xFF041816), height: 1.5)),
                TextSpan(
                    text: 'AED',
                    style: TextStyleHelper.instance.headline24SemiBoldPoppins
                        .copyWith(color: Color(0xFF041816), height: 2.5)),
              ])))),
          SizedBox(height: 8.h),
          Container(
              height: 1.h,
              width: double.infinity,
              color: Color(0xFFD9D9D9),
              margin: EdgeInsets.symmetric(horizontal: 2.h)),
          SizedBox(height: 10.h),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 10.h),
              child: Obx(() => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Your Earnings',
                            style: TextStyleHelper
                                .instance.title15SemiBoldPoppins
                                .copyWith(
                                    color: Color(0xFF041816), height: 1.53)),
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text:
                                  '${controller.weekendPricingModel.value?.hourlyEarnings!.value ?? "120.00"} ',
                              style: TextStyleHelper
                                  .instance.title15SemiBoldPoppins
                                  .copyWith(color: Color(0xFF041816))),
                          TextSpan(
                              text: 'AED',
                              style: TextStyleHelper
                                  .instance.body13SemiBoldPoppins
                                  .copyWith(color: Color(0xFF041816))),
                        ])),
                      ]))),
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
                stops: [
              0.0,
              0.5,
              1.0
            ],
                colors: [
              Color(0x00F7F5F4),
              Color(0x99F7F5F4),
              Color(0xFFF7F5F4),
            ])),
        child: CustomButton(
            text: 'Next',
            rightIcon: ImageConstant.imgMynauiarrowupWhiteA700,
            onPressed: () => controller.onNextPressed()));
  }
}
