import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_dropdown.dart';
import '../../widgets/custom_floating_text_field.dart';
import './controller/property_address_form_controller.dart';

class PropertyAddressFormScreen
    extends GetWidget<PropertyAddressFormController> {
  PropertyAddressFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F5F4),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56.h),
        child: CustomAppBar(
          leadingIcon: ImageConstant.imgFrame2147234282,
          backgroundColor: appTheme.transparentCustom,
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
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 18.h),
                      Text(
                        'Share the full address of your property',
                        style: TextStyleHelper.instance.title18BoldSyne
                            .copyWith(height: 1.17, color: Color(0xFF041816)),
                      ),
                      CustomFloatingTextField(
                        controller: controller.buildingNameController,
                        placeholder: 'Building/Villa Name (optional)',
                        initialValue: '18',
                        margin: EdgeInsets.only(top: 18.h),
                        onChanged: (value) =>
                            controller.onBuildingNameChanged(value),
                      ),
                      CustomFloatingTextField(
                        controller: controller.houseNumberController,
                        placeholder: 'House/Villa/Flat Number',
                        initialValue: 'Serenity Luxe Villa',
                        keyboardType: TextInputType.text,
                        margin: EdgeInsets.only(top: 28.h),
                        validator: (value) =>
                            controller.validateHouseNumber(value),
                        onChanged: (value) =>
                            controller.onHouseNumberChanged(value),
                      ),
                      CustomFloatingTextField(
                        controller: controller.streetNameController,
                        placeholder: 'Street name',
                        initialValue: 'Street No: 07',
                        margin: EdgeInsets.only(top: 28.h),
                        validator: (value) =>
                            controller.validateStreetName(value),
                        onChanged: (value) =>
                            controller.onStreetNameChanged(value),
                      ),
                      CustomFloatingTextField(
                        controller: controller.areaController,
                        placeholder: 'Area/Neighborhood',
                        initialValue: 'Al Barsha 1',
                        margin: EdgeInsets.only(top: 28.h),
                        validator: (value) => controller.validateArea(value),
                        onChanged: (value) => controller.onAreaChanged(value),
                      ),
                      CustomFloatingTextField(
                        controller: controller.landmarkController,
                        placeholder: 'Nearby Landmark',
                        initialValue: 'Behind Mall of the Emirates',
                        margin: EdgeInsets.only(top: 28.h),
                        onChanged: (value) =>
                            controller.onLandmarkChanged(value),
                      ),
                      CustomFloatingTextField(
                        controller: controller.cityController,
                        placeholder: 'City',
                        initialValue: 'Dubai',
                        margin: EdgeInsets.only(top: 28.h),
                        validator: (value) => controller.validateCity(value),
                        onChanged: (value) => controller.onCityChanged(value),
                      ),
                      Obx(() => CustomDropdown(
                            hintText: 'Emirates/State',
                            value: controller.propertyAddressFormModel.value
                                ?.selectedEmirate?.value,
                            items: controller.emiratesList,
                            onChanged: (value) =>
                                controller.onEmirateChanged(value),
                            validator: (value) =>
                                controller.validateEmirate(value),
                          )),
                      SizedBox(height: 16.h),
                      Obx(() => CustomDropdown(
                            hintText: 'Country',
                            value: controller.propertyAddressFormModel.value
                                ?.selectedCountry?.value,
                            items: controller.countriesList,
                            onChanged: (value) =>
                                controller.onCountryChanged(value),
                            validator: (value) =>
                                controller.validateCountry(value),
                          )),
                      CustomFloatingTextField(
                        controller: controller.zipCodeController,
                        placeholder: 'ZIP Code (optional)',
                        initialValue: '00000',
                        keyboardType: TextInputType.number,
                        maxLength: 5,
                        margin: EdgeInsets.only(top: 16.h),
                        onChanged: (value) =>
                            controller.onZipCodeChanged(value),
                      ),
                      SizedBox(height: 20.h),
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
              padding: EdgeInsets.fromLTRB(38.h, 20.h, 38.h, 20.h),
              child: Align(
                alignment: Alignment.centerRight,
                child: Obx(() => CustomButton(
                      text: 'Next',
                      rightIcon: ImageConstant.imgMynauiarrowupWhiteA700,
                      backgroundColor: Color(0xFF260F06),
                      textColor: Color(0xFFFFFFFF),
                      borderRadius: 22.h,
                      onPressed: controller.isLoading.value
                          ? null
                          : () => controller.onNextPressed(),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
