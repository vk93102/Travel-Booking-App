import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_image_view.dart';
import '../../widgets/custom_switch.dart';
import './controller/guest_limit_setup_controller.dart';

class GuestLimitSetupScreen extends GetWidget<GuestLimitSetupController> {
  GuestLimitSetupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F5F4),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56.h),
        child: CustomAppBar(
          leadingIcon: ImageConstant.imgFrame2147234282,
          onLeadingPressed: () => Get.back(),
          backgroundColor: Colors.transparent,
          leadingButtonColor: Color(0xFFFFFFFF),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 16.h, left: 16.h, right: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.48,
                    child: Text(
                      'Set the maximum guest limit',
                      style: TextStyleHelper.instance.title18BoldSyne
                          .copyWith(height: 1.17, color: Color(0xFF041816)),
                    ),
                  ),
                  SizedBox(height: 26.h),
                  Text(
                    'Details can be updated anytime later.',
                    style: TextStyleHelper.instance.body13RegularPoppins
                        .copyWith(height: 1.54, color: Color(0xFFA2A2A2)),
                  ),
                  SizedBox(height: 24.h),
                  Container(
                    padding: EdgeInsets.all(16.h),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.circular(10.h),
                    ),
                    child: Column(
                      spacing: 40.h,
                      children: [
                        _buildQuantityRow('Guests', controller.guestsCount),
                        _buildQuantityRow('Bedrooms', controller.bedroomsCount),
                        _buildQuantityRow('Bed', controller.bedCount),
                        _buildQuantityRow(
                            'Bathrooms', controller.bathroomsCount),
                        _buildPetsRow(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          _buildBottomSection(),
        ],
      ),
    );
  }

  Widget _buildQuantityRow(String label, RxInt count) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label,
          style: TextStyleHelper.instance.body14MediumPoppins
              .copyWith(height: 1.5, color: Color(0xFF515151)),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _buildDecrementButton(() => controller.decrementCount(count)),
              SizedBox(width: 16.h),
              Obx(() => Text(
                    count.value.toString(),
                    style: TextStyleHelper.instance.title16MediumPoppins
                        .copyWith(height: 1.5, color: Color(0xCC515151)),
                  )),
              SizedBox(width: 16.h),
              _buildIncrementButton(() => controller.incrementCount(count)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPetsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Pets',
          style: TextStyleHelper.instance.body14MediumPoppins
              .copyWith(height: 1.5, color: Color(0xFF515151)),
        ),
        Obx(() => CustomSwitch(
              value: controller.isPetsAllowed.value,
              onChanged: (value) => controller.togglePets(value),
              activeColor: Color(0xFF260F06),
            )),
      ],
    );
  }

  Widget _buildDecrementButton(VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 24.h,
        height: 24.h,
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xFFA4A4A4), width: 1.h),
          borderRadius: BorderRadius.circular(12.h),
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 8.h),
              child: CustomImageView(
                imagePath: ImageConstant.imgVector,
                width: 12.h,
                height: 1.h,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIncrementButton(VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 24.h,
        height: 24.h,
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xFFA4A4A4), width: 1.h),
          borderRadius: BorderRadius.circular(12.h),
        ),
        child: Center(
          child: CustomImageView(
            imagePath: ImageConstant.imgVectorGray50002,
            width: 12.h,
            height: 12.h,
          ),
        ),
      ),
    );
  }

  Widget _buildBottomSection() {
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
          stops: [0.0, 0.5, 1.0],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomButton(
            text: 'Next',
            rightIcon: ImageConstant.imgMynauiarrowupWhiteA700,
            backgroundColor: Color(0xFF260F06),
            textColor: Color(0xFFFFFFFF),
            onPressed: () => controller.onNextPressed(),
          ),
        ],
      ),
    );
  }
}
