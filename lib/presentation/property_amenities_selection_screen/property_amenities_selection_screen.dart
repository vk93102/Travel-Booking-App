import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_icon_button.dart';
import './controller/property_amenities_selection_controller.dart';
import './widgets/amenity_card_widget.dart';

class PropertyAmenitiesSelectionScreen
    extends GetWidget<PropertyAmenitiesSelectionController> {
  PropertyAmenitiesSelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F5F4),
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 16.h, left: 16.h, right: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeaderSection(context),
              _buildEssentialAmenitiesSection(context),
              _buildStandoutAmenitiesSection(context),
              _buildSafetyItemsSection(context),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomSection(context),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: appTheme.transparentCustom,
      elevation: 0,
      leading: CustomIconButton(
        iconPath: ImageConstant.imgFrame2147234282,
        height: 44.h,
        width: 44.h,
        padding: EdgeInsets.all(10.h),
        backgroundColor: Color(0xFFFFFFFF),
        borderRadius: 22.h,
        onTap: () => Get.back(),
      ),
      leadingWidth: 60.h,
    );
  }

  Widget _buildHeaderSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 200.h,
          child: Text(
            'Tell us the essentials about your property',
            style: TextStyleHelper.instance.title18BoldSyne
                .copyWith(color: Color(0xFF041816), height: 1.17),
          ),
        ),
        SizedBox(height: 16.h),
        SizedBox(
          width: 310.h,
          child: Text(
            'Amenities can be updated anytime, even after your listing goes live.',
            style: TextStyleHelper.instance.body13RegularPoppins
                .copyWith(color: Color(0xFFA2A2A2), height: 1.46),
          ),
        ),
      ],
    );
  }

  Widget _buildEssentialAmenitiesSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 24.h),
      child: Obx(() => GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8.h,
              mainAxisSpacing: 8.h,
              childAspectRatio: 0.8,
            ),
            itemCount: controller.essentialAmenities.length,
            itemBuilder: (context, index) {
              final amenity = controller.essentialAmenities[index];
              return AmenityCardWidget(
                amenity: amenity,
                onTap: () => controller.toggleAmenitySelection(amenity),
              );
            },
          )),
    );
  }

  Widget _buildStandoutAmenitiesSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 32.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Any standout amenities',
            style: TextStyleHelper.instance.title18BoldSyne
                .copyWith(color: Color(0xFF041816), height: 1.22),
          ),
          SizedBox(height: 16.h),
          Obx(() => GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8.h,
                  mainAxisSpacing: 8.h,
                  childAspectRatio: 0.8,
                ),
                itemCount: controller.standoutAmenities.length,
                itemBuilder: (context, index) {
                  final amenity = controller.standoutAmenities[index];
                  return AmenityCardWidget(
                    amenity: amenity,
                    onTap: () => controller.toggleAmenitySelection(amenity),
                  );
                },
              )),
        ],
      ),
    );
  }

  Widget _buildSafetyItemsSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 32.h, bottom: 32.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Safety items',
            style: TextStyleHelper.instance.title18BoldSyne
                .copyWith(color: Color(0xFF041816), height: 1.22),
          ),
          SizedBox(height: 16.h),
          Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: controller.safetyItems
                    .map((amenity) => SizedBox(
                          width: 114.h,
                          child: AmenityCardWidget(
                            amenity: amenity,
                            onTap: () =>
                                controller.toggleAmenitySelection(amenity),
                          ),
                        ))
                    .toList(),
              )),
        ],
      ),
    );
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
          stops: [0.0, 0.5, 1.0],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomButton(
            text: 'Next',
            rightIcon: ImageConstant.imgMynauiarrowupWhiteA700,
            backgroundColor: Color(0xFF260F06),
            textColor: Color(0xFFFFFFFF),
            borderRadius: 22.h,
            padding: EdgeInsets.fromLTRB(18.h, 12.h, 18.h, 12.h),
            onPressed: () => controller.onNextPressed(),
          ),
        ],
      ),
    );
  }
}
