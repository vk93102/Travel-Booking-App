import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_check_box.dart';
import '../../widgets/custom_image_view.dart';
import './controller/package_selection_controller.dart';

class PackageSelectionScreen extends GetWidget<PackageSelectionController> {
  PackageSelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F5F4),
      appBar: _buildAppBar(context),
      body: _buildBody(context),
      bottomSheet: _buildBottomSheet(context),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingIcon: ImageConstant.imgFrame2147234282,
      onLeadingPressed: () => Get.back(),
      backgroundColor: Color(0xFFF7F5F4),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 18.h, left: 16.h, right: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeaderSection(context),
          SizedBox(height: 20.h),
          _buildPackageList(context),
        ],
      ),
    );
  }

  Widget _buildHeaderSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          child: Text(
            "Choose a package to get started",
            style: TextStyleHelper.instance.title18BoldSyne
                .copyWith(color: Color(0xFF041816)),
          ),
        ),
        SizedBox(height: 18.h),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.66,
          child: Text(
            "Pick a packaging service to manage your media needs.",
            style: TextStyleHelper.instance.body13RegularPoppins
                .copyWith(color: Color(0xFFA2A2A2)),
          ),
        ),
      ],
    );
  }

  Widget _buildPackageList(BuildContext context) {
    return Expanded(
      child: Obx(() => Column(
            spacing: 12.h,
            children: [
              _buildPackageItem(
                context,
                "Free Listing",
                "0.00 AED",
                0,
                isSelected: true,
              ),
              _buildPackageItem(
                context,
                "Free Listing & Media services",
                "100.00 AED",
                1,
              ),
              _buildPackageItem(
                context,
                "Free Listing, Media services & Featured placement",
                "200.00 AED",
                2,
              ),
            ],
          )),
    );
  }

  Widget _buildPackageItem(
    BuildContext context,
    String title,
    String price,
    int index, {
    bool isSelected = false,
  }) {
    bool isSelectedState = controller.selectedPackageIndex.value == index;

    return GestureDetector(
      onTap: () => controller.selectPackage(index),
      child: Container(
        padding: EdgeInsets.all(12.h),
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(14.h),
          border: isSelectedState
              ? Border.all(
                  width: 1.h,
                  color: Color(0xFF864E19),
                )
              : null,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: index == 1 ? 24.h : 16.h,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14.fSize,
                      fontFamily: index == 1 ? 'Plus Jakarta Sans' : 'Poppins',
                      fontWeight: FontWeight.w600,
                      color: isSelectedState
                          ? Color(0xFF041816)
                          : Color(0xFF515151),
                    ),
                  ),
                  Text(
                    price,
                    style: TextStyle(
                      fontSize: 13.fSize,
                      fontFamily: index == 1 ? 'Plus Jakarta Sans' : 'Poppins',
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF515151),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 12.h),
            if (isSelectedState && index == 0)
              Container(
                width: 24.h,
                height: 24.h,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1.h,
                    color: Color(0xFF864E19),
                  ),
                  borderRadius: BorderRadius.circular(6.h),
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
                isChecked: isSelectedState,
                onChanged: (value) => controller.selectPackage(index),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomSheet(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 20.h,
        right: 38.h,
        bottom: 20.h,
      ),
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
          text: "Next",
          rightIcon: ImageConstant.imgMynauiarrowupWhiteA700,
          onPressed: () => controller.onNextPressed(),
        ),
      ),
    );
  }
}
