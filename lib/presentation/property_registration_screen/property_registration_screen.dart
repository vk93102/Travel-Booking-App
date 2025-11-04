import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_edit_text.dart';
import './controller/property_registration_controller.dart';

class PropertyRegistrationScreen
    extends GetWidget<PropertyRegistrationController> {
  PropertyRegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F5F4),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56.h),
        child: CustomAppBar(
          leadingIcon: ImageConstant.imgFrame2147234282,
          backgroundColor: Colors.transparent,
          leadingButtonColor: Color(0xFFFFFFFF),
          onLeadingPressed: () => Get.back(),
        ),
      ),
      body: Form(
        key: controller.formKey,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(
                    top: 16.h,
                    left: 16.h,
                    right: 16.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 196.h,
                        child: Text(
                          'Provide property registration details',
                          style: TextStyleHelper.instance.title18BoldSyne
                              .copyWith(height: 1.17, color: Color(0xFF041816)),
                        ),
                      ),
                      SizedBox(height: 27.h),
                      SizedBox(
                        width: 329.h,
                        child: Text(
                          'Providing a valid license or registration number is required for listing approval.',
                          style: TextStyleHelper.instance.body13RegularPoppins
                              .copyWith(height: 1.46, color: Color(0xFFA2A2A2)),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 16.h),
                        child: CustomEditText(
                          controller: controller.licenseController,
                          placeholder: 'Property license number',
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          validator: controller.validateLicenseNumber,
                          onChanged: (value) =>
                              controller.onLicenseNumberChanged(value),
                          borderColor: Color(0xFFD9D9D9),
                          focusedBorderColor: Color(0xFF2196F3),
                          errorBorderColor: Color(0xFFE57373),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 58.h),
                        width: 196.h,
                        child: Text(
                          "Haven't registered your property?",
                          style: TextStyleHelper.instance.title18BoldSyne
                              .copyWith(height: 1.17, color: Color(0xFF041816)),
                        ),
                      ),
                      SizedBox(height: 26.h),
                      Text(
                        'Get your property licensed.',
                        style: TextStyleHelper.instance.body13RegularPoppins
                            .copyWith(height: 1.54, color: Color(0xFFA2A2A2)),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: 20.h,
                          left: 4.h,
                          right: 4.h,
                        ),
                        child: CustomButton(
                          text: 'Get Property License',
                          backgroundColor: Color(0xFF7C412E),
                          textColor: Color(0xFFFFFFFF),
                          borderRadius: 22.h,
                          width: double.infinity,
                          height: 41.h,
                          onPressed: () => controller.onGetPropertyLicense(),
                        ),
                      ),
                      SizedBox(height: 100.h),
                    ],
                  ),
                ),
              ),
            ),
            Container(
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
              padding: EdgeInsets.only(
                top: 20.h,
                bottom: 20.h,
                right: 38.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Obx(() => CustomButton(
                        text: 'Next',
                        backgroundColor: Color(0xFF260F06),
                        textColor: Color(0xFFFFFFFF),
                        rightIcon: ImageConstant.imgMynauiarrowupWhiteA700,
                        borderRadius: 22.h,
                        width: 86.h,
                        height: 41.h,
                        onPressed: controller.isFormValid.value
                            ? () => controller.onNextPressed()
                            : null,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
