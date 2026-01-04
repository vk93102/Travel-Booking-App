import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_floating_text_field.dart';
import './controller/property_details_setup_controller.dart';

class PropertyDetailsSetupScreen
    extends GetWidget<PropertyDetailsSetupController> {
  PropertyDetailsSetupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F5F4),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56.h),
        child: Container(
          padding: EdgeInsets.fromLTRB(16.h, 6.h, 16.h, 6.h),
          child: CustomAppBar(
            leadingIcon: ImageConstant.imgFrame2147234282,
            onLeadingPressed: () => Get.back(),
            backgroundColor: appTheme.transparentCustom,
            leadingButtonColor: Color(0xFFFFFFFF),
          ),
        ),
      ),
      body: Form(
        key: controller.formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.fromLTRB(16.h, 16.h, 16.h, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Text(
                    'Give your property an identity',
                    style: TextStyleHelper.instance.title18BoldSyne
                        .copyWith(height: 21 / 18, color: Color(0xFF041816)),
                  ),
                ),
                CustomFloatingTextField(
                  controller: controller.propertyNameController,
                  placeholder: 'Property Name',
                  initialValue: 'Serenity Luxe Villa - Palm Jumeirah',
                  margin: EdgeInsets.only(top: 18.h),
                  validator: controller.validatePropertyName,
                  onChanged: (value) => controller.onPropertyNameChanged(value),
                ),
                Container(
                  margin: EdgeInsets.only(top: 32.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 4.h,
                    children: [
                      Text(
                        'Property Star Rating',
                        style: TextStyleHelper
                            .instance.body14RegularPlusJakartaSans
                            .copyWith(
                                height: 18 / 14, color: Color(0xFF737373)),
                      ),
                      Obx(() => RatingBar.builder(
                            initialRating: controller.starRating.value,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: false,
                            itemCount: 5,
                            itemSize: 30.h,
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Color(0xFFFFB800),
                            ),
                            onRatingUpdate: (rating) {
                              controller.updateStarRating(rating);
                            },
                          )),
                    ],
                  ),
                ),
                CustomFloatingTextField(
                  controller: controller.descriptionController,
                  placeholder: 'Description',
                  margin: EdgeInsets.only(top: 24.h),
                  maxLength: 200,
                  showCounter: true,
                  validator: controller.validateDescription,
                  onChanged: (value) => controller.onDescriptionChanged(value),
                ),
                SizedBox(height: 100.h),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Container(
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
            stops: [0.0, 0.5, 1.0],
          ),
        ),
        padding: EdgeInsets.fromLTRB(38.h, 20.h, 38.h, 20.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Obx(() => CustomButton(
                  text: 'Next',
                  rightIcon: ImageConstant.imgMynauiarrowupWhiteA700,
                  backgroundColor: Color(0xFF260F06),
                  textColor: Color(0xFFFFFFFF),
                  borderRadius: 22.h,
                  padding: EdgeInsets.fromLTRB(18.h, 12.h, 12.h, 12.h),
                  onPressed: controller.isFormValid.value
                      ? () => controller.onNextPressed()
                      : null,
                  isEnabled: controller.isFormValid.value,
                )),
          ],
        ),
      ),
    );
  }
}
