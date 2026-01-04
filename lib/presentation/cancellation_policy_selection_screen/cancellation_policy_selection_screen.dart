import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_check_box.dart';
import '../../widgets/custom_image_view.dart';
import './controller/cancellation_policy_selection_controller.dart';

class CancellationPolicySelectionScreen
    extends GetWidget<CancellationPolicySelectionController> {
  CancellationPolicySelectionScreen({Key? key}) : super(key: key);

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
      backgroundColor: appTheme.transparentCustom,
      onLeadingPressed: () => Get.back(),
    );
  }

  Widget _buildMainContent(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.fromLTRB(16.h, 18.h, 16.h, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Cancellation policy',
              style: TextStyleHelper.instance.title18BoldSyne
                  .copyWith(color: Color(0xFF041816)),
            ),
            SizedBox(height: 4.h),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: Text(
                'Set cancellation charges based on the provided policies.',
                style: TextStyleHelper.instance.body13RegularPoppins
                    .copyWith(color: Color(0xFFA2A2A2)),
              ),
            ),
            SizedBox(height: 20.h),
            _buildPolicyOptions(context),
            SizedBox(height: 32.h),
          ],
        ),
      ),
    );
  }

  Widget _buildPolicyOptions(BuildContext context) {
    return Column(
      spacing: 12.h,
      children: [
        _buildPolicyCard(
          title: 'Light Cancellation Policy (Flexible)',
          description:
              'Full refund for cancellations made up to 5 days before check-in.\nIf cancelled less than 5 days before check-in, 50% refund.\nIf cancelled after check-in, no refund for unused nights.\nFree date changes allowed up to 3 days before check-in (subject to availability).',
          isSelected: true,
          onTap: () => controller.selectPolicy(0),
          showCheckIcon: true,
        ),
        _buildPolicyCard(
          title: 'Medium Cancellation Policy (Moderate)',
          description:
              'Full refund for cancellations made up to 14 days before check-in.\nIf cancelled between 14 and 7 days before check-in, 50% refund.\nNo refund if cancelled less than 7 days before check-in.\nOne date change allowed if requested at least 10 days prior.',
          isSelected: false,
          onTap: () => controller.selectPolicy(1),
          showCheckIcon: false,
        ),
        _buildPolicyCard(
          title: 'Hard Cancellation Policy (Strict)',
          description:
              '50% refund for cancellations made within 48 hours of booking and at least 30 days before check-in.\nNo refund for cancellations made after 48 hours or less than 30 days before check-in.\nNo changes or date modifications allowed after booking is confirmed.',
          isSelected: false,
          onTap: () => controller.selectPolicy(2),
          showCheckIcon: false,
        ),
      ],
    );
  }

  Widget _buildPolicyCard({
    required String title,
    required String description,
    required bool isSelected,
    required VoidCallback onTap,
    required bool showCheckIcon,
  }) {
    return Obx(() {
      final selectedIndex = controller.selectedPolicyIndex.value;
      final isCurrentlySelected =
          (title.contains('Light') && selectedIndex == 0) ||
              (title.contains('Medium') && selectedIndex == 1) ||
              (title.contains('Hard') && selectedIndex == 2);

      return GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(8.h),
          decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(14.h),
            border: isCurrentlySelected
                ? Border.all(
                    width: 1.h,
                    color: Color(0xFF864E19),
                  )
                : null,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 2.h,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 6.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: TextStyleHelper.instance.body14SemiBoldPoppins
                            .copyWith(color: Color(0xFF515151)),
                      ),
                    ),
                    if (isCurrentlySelected && showCheckIcon)
                      Container(
                        width: 24.h,
                        height: 24.h,
                        decoration: BoxDecoration(
                          color: Color(0xFFFFFFFF),
                          borderRadius: BorderRadius.circular(6.h),
                          border: Border.all(
                            width: 1.h,
                            color: Color(0xFF864E19),
                          ),
                        ),
                        child: Center(
                          child: CustomImageView(
                            imagePath: ImageConstant.imgQlementineIcon,
                            width: 22.h,
                            height: 22.h,
                          ),
                        ),
                      )
                    else
                      CustomCheckBox(
                        isChecked: isCurrentlySelected,
                        onChanged: (value) => onTap(),
                      ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 12.h),
                child: SizedBox(
                  width: MediaQuery.of(Get.context!).size.width *
                      (title.contains('Light')
                          ? 0.88
                          : title.contains('Medium')
                              ? 0.90
                              : 0.86),
                  child: Text(
                    description,
                    style: TextStyleHelper.instance.body12RegularPoppins
                        .copyWith(color: Color(0xFF515151), height: 1.67),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildBottomSection(BuildContext context) {
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
