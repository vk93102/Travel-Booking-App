import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_icon_button.dart';
import '../../widgets/custom_image_view.dart';
import './controller/uploaded_photos_gallery_controller.dart';

class UploadedPhotosGalleryScreen
    extends GetWidget<UploadedPhotosGalleryController> {
  const UploadedPhotosGalleryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F5F4),
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(context),
            Expanded(
              child: _buildMainContent(context),
            ),
            _buildBottomSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16.h, 6.h, 16.h, 6.h),
      child: Row(
        children: [
          CustomIconButton(
            iconPath: ImageConstant.imgFrame2147234282,
            height: 44.h,
            width: 44.h,
            padding: EdgeInsets.all(10.h),
            backgroundColor: Color(0xFFFFFFFF),
            borderRadius: 22.h,
            onTap: () {
              Get.back();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildMainContent(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16.h, 12.h, 16.h, 0.h),
      child: Column(
        children: [
          _buildHeaderSection(context),
          SizedBox(height: 12.h),
          _buildLargePhotoSection(context),
          SizedBox(height: 12.h),
          _buildSmallPhotosRow(context),
        ],
      ),
    );
  }

  Widget _buildHeaderSection(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.only(top: 4.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Uploaded photos',
                  style: TextStyleHelper.instance.title18BoldSyne
                      .copyWith(height: 1.22, color: Color(0xFF041816)),
                ),
                SizedBox(height: 4.h),
                Obx(() => Text(
                      '${controller.uploadedPhotosGalleryModel.value?.photoCount?.value ?? 3} photos uploaded',
                      style: TextStyleHelper.instance.body13RegularPoppins
                          .copyWith(height: 1.54, color: Color(0xFFA2A2A2)),
                    )),
              ],
            ),
          ),
        ),
        CustomIconButton(
          iconPath: ImageConstant.imgLineiconsPlus,
          height: 44.h,
          width: 44.h,
          padding: EdgeInsets.all(10.h),
          backgroundColor: Color(0xFFFFFFFF),
          borderRadius: 22.h,
          onTap: () {
            controller.onAddPhotoPressed();
          },
        ),
      ],
    );
  }

  Widget _buildLargePhotoSection(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 188.h,
      child: Stack(
        children: [
          Obx(() => CustomImageView(
                imagePath: controller
                        .uploadedPhotosGalleryModel.value?.mainPhoto?.value ??
                    ImageConstant.imgRectangle39575,
                width: double.infinity,
                height: 188.h,
                fit: BoxFit.cover,
                radius: BorderRadius.circular(10.h),
              )),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              margin: EdgeInsets.only(top: 10.h, right: 10.h),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color(0x88888888),
                    offset: Offset(0, 4),
                    blurRadius: 2,
                  ),
                ],
              ),
              child: CustomIconButton(
                iconPath: ImageConstant.imgFrame2147234282Black900,
                height: 24.h,
                width: 24.h,
                padding: EdgeInsets.all(4.h),
                backgroundColor: Color(0x99FAFAFA),
                borderRadius: 12.h,
                onTap: () {
                  controller.onPhotoOptionsPressed(0);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSmallPhotosRow(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 188.h,
            child: Stack(
              children: [
                Obx(() => CustomImageView(
                      imagePath: controller.uploadedPhotosGalleryModel.value
                              ?.photo1?.value ??
                          ImageConstant.imgRectangle39575188x174,
                      width: double.infinity,
                      height: 188.h,
                      fit: BoxFit.cover,
                      radius: BorderRadius.circular(10.h),
                    )),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    margin: EdgeInsets.only(top: 10.h, right: 10.h),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x88888888),
                          offset: Offset(0, 4),
                          blurRadius: 2,
                        ),
                      ],
                    ),
                    child: CustomIconButton(
                      iconPath: ImageConstant.imgFrame2147234282Black900,
                      height: 24.h,
                      width: 24.h,
                      padding: EdgeInsets.all(4.h),
                      backgroundColor: Color(0x99FAFAFA),
                      borderRadius: 12.h,
                      onTap: () {
                        controller.onPhotoOptionsPressed(1);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 10.h),
        Expanded(
          child: Container(
            height: 188.h,
            child: Stack(
              children: [
                Obx(() => CustomImageView(
                      imagePath: controller.uploadedPhotosGalleryModel.value
                              ?.photo2?.value ??
                          ImageConstant.imgRectangle395751,
                      width: double.infinity,
                      height: 188.h,
                      fit: BoxFit.cover,
                      radius: BorderRadius.circular(10.h),
                    )),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    margin: EdgeInsets.only(top: 10.h, right: 10.h),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x88888888),
                          offset: Offset(0, 4),
                          blurRadius: 2,
                        ),
                      ],
                    ),
                    child: CustomIconButton(
                      iconPath: ImageConstant.imgFrame2147234282Black900,
                      height: 24.h,
                      width: 24.h,
                      padding: EdgeInsets.all(4.h),
                      backgroundColor: Color(0x99FAFAFA),
                      borderRadius: 12.h,
                      onTap: () {
                        controller.onPhotoOptionsPressed(2);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
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
            backgroundColor: Color(0xFF260F06),
            textColor: Color(0xFFFFFFFF),
            borderRadius: 22.h,
            padding: EdgeInsets.fromLTRB(18.h, 12.h, 18.h, 12.h),
            onPressed: () {
              controller.onNextPressed();
            },
          ),
        ],
      ),
    );
  }
}
