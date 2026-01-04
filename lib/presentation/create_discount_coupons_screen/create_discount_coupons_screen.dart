import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_check_box.dart';
import './controller/create_discount_coupons_controller.dart';
import './models/discount_item_model.dart';

class CreateDiscountCouponsScreen
    extends GetWidget<CreateDiscountCouponsController> {
  CreateDiscountCouponsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F5F4),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56.h),
        child: CustomAppBar(
          leadingIcon: ImageConstant.imgFrame2147234282,
          onLeadingPressed: () => Get.back(),
          backgroundColor: appTheme.transparentCustom,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(16.h, 16.h, 16.h, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Create discounts and coupons',
                    style: TextStyleHelper.instance.title18BoldSyne
                        .copyWith(height: 1.17, color: Color(0xFF041816)),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'Make your property stand out—offer discounts and coupons to boost bookings.',
                    style: TextStyleHelper.instance.body13RegularPoppins
                        .copyWith(height: 1.46, color: Color(0xFFA2A2A2)),
                  ),
                  SizedBox(height: 20.h),
                  Expanded(
                    child: Obx(() => ListView.separated(
                          itemCount: controller.discountItems.length,
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 12.h),
                          itemBuilder: (context, index) {
                            return _buildDiscountItem(
                              controller.discountItems[index],
                              index,
                            );
                          },
                        )),
                  ),
                ],
              ),
            ),
          ),
          Container(
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
                text: 'Next',
                rightIcon: ImageConstant.imgMynauiarrowupWhiteA700,
                onPressed: () => controller.onNextPressed(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDiscountItem(DiscountItemModel item, int index) {
    return Obx(() => Container(
          width: double.infinity,
          padding: EdgeInsets.all(16.h),
          decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(14.h),
          ),
          child: Row(
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: item.percentage.value.split('%')[0],
                      style: TextStyleHelper
                          .instance.display32BoldPlusJakartaSans
                          .copyWith(height: 1.28, color: Color(0xFF041816)),
                    ),
                    TextSpan(
                      text: '%',
                      style: TextStyleHelper
                          .instance.headline24BoldPlusJakartaSans
                          .copyWith(height: 1.71, color: Color(0xFF041816)),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 14.h),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      item.title.value,
                      style: TextStyleHelper.instance.body14MediumPoppins
                          .copyWith(height: 1.57, color: Color(0xFF041816)),
                    ),
                    Text(
                      item.description.value,
                      style: TextStyleHelper.instance.body13RegularPoppins
                          .copyWith(height: 1.54, color: Color(0xFF888888)),
                    ),
                  ],
                ),
              ),
              CustomCheckBox(
                isChecked: item.isSelected.value,
                onChanged: (value) =>
                    controller.onDiscountItemSelected(index, value ?? false),
              ),
            ],
          ),
        ));
  }
}
