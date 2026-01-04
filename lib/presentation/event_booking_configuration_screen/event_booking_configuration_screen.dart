import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_check_box.dart';
import '../../widgets/custom_edit_text.dart';
import '../../widgets/custom_image_view.dart';
import '../../widgets/custom_switch.dart';
import './controller/event_booking_configuration_controller.dart';

class EventBookingConfigurationScreen
    extends GetWidget<EventBookingConfigurationController> {
  const EventBookingConfigurationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF7F5F4),
        appBar: _buildAppBar(),
        body: _buildBody(),
        bottomNavigationBar: _buildBottomNavigationBar());
  }

  PreferredSize _buildAppBar() {
    return PreferredSize(
        preferredSize: Size.fromHeight(56.h),
        child: CustomAppBar(
            leadingIcon: ImageConstant.imgFrame2147234282,
            onLeadingPressed: () => Get.back(),
            backgroundColor: appTheme.transparentCustom));
  }

  Widget _buildBody() {
    return SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(16.h),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              _buildHeaderSection(),
              SizedBox(height: 24.h),
              _buildEventTypeSection(),
              SizedBox(height: 24.h),
              _buildMaximumGuestCapacitySection(),
              SizedBox(height: 24.h),
              _buildEventBookingPriceSection(),
              SizedBox(height: 24.h),
              _buildSecurityDepositSection(),
              SizedBox(height: 4.h),
              _buildSecurityDepositDescription(),
              SizedBox(height: 24.h),
              _buildEventNotificationsSection(),
              SizedBox(height: 24.h),
              _buildCancellationPolicySection(),
              SizedBox(height: 32.h),
            ])));
  }

  Widget _buildHeaderSection() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
          width: MediaQuery.of(Get.context!).size.width * 0.6,
          child: Text('Customize your event booking settings',
              style: TextStyleHelper.instance.title18BoldSyne
                  .copyWith(color: Color(0xFF041816)))),
      SizedBox(height: 16.h),
      Container(
          width: MediaQuery.of(Get.context!).size.width * 0.66,
          child: Text('Customize how guests can book your property for events.',
              style: TextStyleHelper.instance.body13RegularPoppins
                  .copyWith(color: Color(0xFFA2A2A2)))),
    ]);
  }

  Widget _buildEventTypeSection() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('Choose event type',
          style: TextStyleHelper.instance.body14SemiBoldPlusJakartaSans
              .copyWith(color: Color(0xFF111111))),
      SizedBox(height: 8.h),
      Obx(() => CustomCheckBox(
          isChecked: controller.eventBookingConfigurationModel.value
                  ?.isWeddingSelected!.value ??
              false,
          onChanged: controller.onWeddingChanged,
          label: 'Wedding',
          textStyle: TextStyleHelper.instance.body13RegularPoppins
              .copyWith(color: Color(0xFF000000)))),
      SizedBox(height: 6.h),
      Obx(() => CustomCheckBox(
          isChecked: controller.eventBookingConfigurationModel.value
                  ?.isBirthdayPartySelected!.value ??
              false,
          onChanged: controller.onBirthdayPartyChanged,
          label: 'Birthday party',
          textStyle: TextStyleHelper.instance.body13RegularPoppins
              .copyWith(color: Color(0xFF000000)))),
      SizedBox(height: 8.h),
      Obx(() => CustomCheckBox(
          isChecked: controller.eventBookingConfigurationModel.value
                  ?.isCorporateEventSelected!.value ??
              false,
          onChanged: controller.onCorporateEventChanged,
          label: 'Corporate event',
          textStyle: TextStyleHelper.instance.body13RegularPoppins
              .copyWith(color: Color(0xFF000000)))),
      SizedBox(height: 6.h),
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Obx(() => CustomCheckBox(
            isChecked: controller.eventBookingConfigurationModel.value
                    ?.isOtherSelected!.value ??
                false,
            onChanged: controller.onOtherChanged,
            label: 'Other;',
            textStyle: TextStyleHelper.instance.body13RegularPoppins
                .copyWith(color: Color(0xFF000000)))),
        SizedBox(height: 10.h),
        CustomEditText(
            controller: controller.otherEventTypeController,
            placeholder: 'Specify',
            textStyle: TextStyleHelper.instance.body12RegularPoppins
                .copyWith(color: Color(0xFFB8B8B8)),
            borderColor: appTheme.transparentCustom),
      ]),
    ]);
  }

  Widget _buildMaximumGuestCapacitySection() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('Maximum guest capacity',
          style: TextStyleHelper.instance.body14SemiBoldPlusJakartaSans
              .copyWith(color: Color(0xFF111111))),
      SizedBox(height: 6.h),
      CustomEditText(
          controller: controller.maxGuestCapacityController,
          placeholder: '50',
          keyboardType: TextInputType.number,
          textStyle: TextStyleHelper.instance.title15RegularPlusJakartaSans
              .copyWith(color: Color(0xFF000000)),
          borderColor: Color(0xFFD9D9D9),
          validator: controller.validateMaxGuestCapacity),
    ]);
  }

  Widget _buildEventBookingPriceSection() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('Event booking price',
          style: TextStyleHelper.instance.body14SemiBoldPlusJakartaSans
              .copyWith(color: Color(0xFF111111))),
      SizedBox(height: 6.h),
      Row(children: [
        Expanded(
            child: CustomEditText(
                controller: controller.eventBookingPriceController,
                placeholder: '500.00',
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                textStyle: TextStyleHelper
                    .instance.title15RegularPlusJakartaSans
                    .copyWith(color: Color(0xFF000000)),
                borderColor: Color(0xFFD9D9D9),
                validator: controller.validateEventBookingPrice)),
        SizedBox(width: 12.h),
        Padding(
            padding: EdgeInsets.only(bottom: 8.h),
            child: Text('per day',
                style: TextStyleHelper.instance.body14MediumPlusJakartaSans
                    .copyWith(color: Color(0xFF111111)))),
      ]),
    ]);
  }

  Widget _buildSecurityDepositSection() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      RichText(
          text: TextSpan(children: [
        TextSpan(
            text: 'Security deposit',
            style: TextStyleHelper.instance.body14SemiBoldPlusJakartaSans
                .copyWith(color: Color(0xFF111111))),
        TextSpan(
            text: ' ',
            style: TextStyleHelper.instance.title16SemiBoldPlusJakartaSans
                .copyWith(color: Color(0xFF111111))),
        TextSpan(
            text: '(optional)',
            style: TextStyleHelper.instance.body12RegularPlusJakartaSans
                .copyWith(color: Color(0xFF808080))),
      ])),
      SizedBox(height: 8.h),
      CustomEditText(
          controller: controller.securityDepositController,
          placeholder: '150.00',
          keyboardType: TextInputType.numberWithOptions(decimal: true),
          textStyle: TextStyleHelper.instance.title15RegularPlusJakartaSans
              .copyWith(color: Color(0xFF000000)),
          borderColor: Color(0xFFD9D9D9)),
    ]);
  }

  Widget _buildSecurityDepositDescription() {
    return Text('Optional amount to cover potential damages.',
        style: TextStyleHelper.instance.body12RegularPoppins
            .copyWith(color: Color(0xFF808080)));
  }

  Widget _buildEventNotificationsSection() {
    return Container(
        padding: EdgeInsets.all(12.h),
        decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(14.h)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: EdgeInsets.only(top: 4.h),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Get event notifications',
                        style: TextStyleHelper
                            .instance.body14SemiBoldPlusJakartaSans
                            .copyWith(color: Color(0xFF111111))),
                    Obx(() => CustomSwitch(
                        value: controller.eventBookingConfigurationModel.value
                                ?.getEventNotifications!.value ??
                            false, // Modified: Added missing required value parameter
                        onChanged: controller.onEventNotificationsChanged)),
                  ])),
          SizedBox(height: 2.h),
          Container(
              width: MediaQuery.of(Get.context!).size.width * 0.88,
              child: Text(
                  'Do you like to get notified and receive newsletters for the upcoming worldwide events to host inn.',
                  style: TextStyleHelper.instance.body12RegularPoppins
                      .copyWith(color: Color(0xFF515151)))),
        ]));
  }

  Widget _buildCancellationPolicySection() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('Event Cancellation Policy',
          style: TextStyleHelper.instance.title16SemiBoldPoppins
              .copyWith(color: Color(0xFF041816))),
      SizedBox(height: 14.h),
      Column(children: [
        _buildLightCancellationPolicy(),
        SizedBox(height: 16.h),
        _buildMediumCancellationPolicy(),
        SizedBox(height: 16.h),
        _buildHardCancellationPolicy(),
      ]),
    ]);
  }

  Widget _buildLightCancellationPolicy() {
    return Container(
        padding: EdgeInsets.all(8.h),
        decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(14.h),
            border: Border.all(width: 1.h, color: Color(0xFF864E1A))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: EdgeInsets.only(left: 6.h),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Light Cancellation Policy (Flexible)',
                        style: TextStyleHelper.instance.body14SemiBoldPoppins
                            .copyWith(color: Color(0xFF515151))),
                    Container(
                        height: 24.h,
                        width: 24.h,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Color(0xFF864E1A), width: 1.h),
                            borderRadius: BorderRadius.circular(4.h)),
                        child: Center(
                            child: CustomImageView(
                                imagePath: ImageConstant.imgQlementineIcon,
                                height: 22.h,
                                width: 22.h))),
                  ])),
          SizedBox(height: 2.h),
          Padding(
              padding: EdgeInsets.only(left: 12.h),
              child: Container(
                  width: MediaQuery.of(Get.context!).size.width * 0.9,
                  child: Text(
                      'Full refund for cancellations made up to 15 days before event.\nIf cancelled less than 7 days before check-in, 50% refund.\nIf cancelled after check-in, no refund for unused nights.',
                      style: TextStyleHelper.instance.body12RegularPoppins
                          .copyWith(color: Color(0xFF515151))))),
        ]));
  }

  Widget _buildMediumCancellationPolicy() {
    return Container(
        padding: EdgeInsets.all(10.h),
        decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(14.h)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: EdgeInsets.only(left: 6.h),
              child: Row(children: [
                Text('Medium Cancellation Policy (Moderate)',
                    style: TextStyleHelper.instance.body14SemiBoldPoppins
                        .copyWith(color: Color(0xFF515151))),
                SizedBox(width: 26.h),
                Obx(() => CustomCheckBox(
                    isChecked: controller.eventBookingConfigurationModel.value
                            ?.isMediumPolicySelected!.value ??
                        false,
                    onChanged: controller.onMediumPolicyChanged)),
              ])),
          Padding(
              padding: EdgeInsets.only(left: 12.h, bottom: 4.h),
              child: Container(
                  width: MediaQuery.of(Get.context!).size.width * 0.86,
                  child: Text(
                      'Full refund for cancellations made up to 30 days before check-in.\nIf cancelled between 14 and 7 days before check-in, 50% refund.\nNo refund if cancelled less than 7 days before check-in.',
                      style: TextStyleHelper.instance.body12RegularPoppins
                          .copyWith(color: Color(0xFF515151))))),
        ]));
  }

  Widget _buildHardCancellationPolicy() {
    return Container(
        padding: EdgeInsets.all(10.h),
        decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(14.h)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: EdgeInsets.only(left: 6.h),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Hard Cancellation Policy (Strict)',
                        style: TextStyleHelper.instance.body14SemiBoldPoppins
                            .copyWith(color: Color(0xFF515151))),
                    Obx(() => CustomCheckBox(
                        isChecked: controller.eventBookingConfigurationModel
                                .value?.isHardPolicySelected!.value ??
                            false,
                        onChanged: controller.onHardPolicyChanged)),
                  ])),
          Padding(
              padding: EdgeInsets.only(left: 12.h),
              child: Container(
                  width: MediaQuery.of(Get.context!).size.width * 0.84,
                  child: Text(
                      '50% refund for cancellations made within 48 hours of booking and at least 30 days before check-in.\nNo refund for cancellations made after 48 hours or less than 30 days before check-in.',
                      style: TextStyleHelper.instance.body12RegularPoppins
                          .copyWith(color: Color(0xFF515151))))),
        ]));
  }

  Widget _buildBottomNavigationBar() {
    return Container(
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
        padding: EdgeInsets.only(top: 20.h, right: 38.h, bottom: 20.h),
        child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          CustomButton(
              text: 'Next',
              rightIcon: ImageConstant.imgMynauiarrowupWhiteA700,
              onPressed: controller.onNextPressed,
              backgroundColor: Color(0xFF260F06),
              textColor: Color(0xFFFFFFFF),
              borderRadius: 22.h,
              padding: EdgeInsets.fromLTRB(18.h, 12.h, 18.h, 12.h)),
        ]));
  }
}
