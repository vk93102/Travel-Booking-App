import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_icon_button.dart';
import '../../widgets/custom_image_view.dart';
import './controller/photo_upload_gallery_controller.dart';

class PhotoUploadGalleryScreen extends GetWidget<PhotoUploadGalleryController> {
  const PhotoUploadGalleryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F5F4),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56.h),
        child: Container(
          padding: EdgeInsets.fromLTRB(16.h, 6.h, 16.h, 6.h),
          child: Row(
            children: [
              CustomIconButton(
                iconPath: ImageConstant.imgFrame2147234282,
                height: 44.h,
                width: 44.h,
                backgroundColor: Color(0xFFFFFFFF),
                borderRadius: 22.h,
                onTap: () => Get.back(),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.fromLTRB(16.h, 12.h, 16.h, 0),
              child: Column(
                spacing: 12.h,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeaderSection(),
                  _buildPhotosGrid(),
                ],
              ),
            ),
          ),
          _buildBottomSection(),
        ],
      ),
    );
  }

  Widget _buildHeaderSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.only(top: 4.h),
            child: Column(
              spacing: 4.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Uploaded photos',
                  style: TextStyleHelper.instance.title18BoldSyne
                      .copyWith(height: 1.22, color: Color(0xFF041816)),
                ),
                Obx(() => Text(
                      '${controller.uploadedPhotos.length} photos uploaded',
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
          backgroundColor: Color(0xFFFFFFFF),
          borderRadius: 22.h,
          onTap: () => controller.pickImage(),
        ),
      ],
    );
  }

  Widget _buildPhotosGrid() {
    return Expanded(
      child: Obx(() {
        List<String> photos = controller.uploadedPhotos.toList();

        return Column(
          spacing: 12.h,
          children: [
            // First row - 2 photos
            if (photos.isNotEmpty)
              Row(
                spacing: 10.h,
                children: [
                  _buildPhotoItem(photos[0]),
                  if (photos.length > 1)
                    _buildPhotoItem(photos[1])
                  else
                    _buildAddMorePhotosPlaceholder(),
                ],
              ),
            // Second row - 1 photo + add more section
            if (photos.length > 2)
              Row(
                spacing: 10.h,
                children: [
                  _buildPhotoItem(photos[2]),
                  _buildAddMorePhotosPlaceholder(),
                ],
              )
            else if (photos.length == 2)
              Row(
                spacing: 10.h,
                children: [
                  _buildAddMorePhotosPlaceholder(),
                  Expanded(child: SizedBox()),
                ],
              ),
          ],
        );
      }),
    );
  }

  Widget _buildPhotoItem(String imagePath) {
    return Expanded(
      child: GestureDetector(
        onTap: () => controller.viewPhoto(imagePath),
        child: Container(
          height: 188.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.h),
          ),
          child: CustomImageView(
            imagePath: imagePath,
            height: 188.h,
            width: double.infinity,
            fit: BoxFit.cover,
            radius: BorderRadius.circular(10.h),
          ),
        ),
      ),
    );
  }

  Widget _buildAddMorePhotosPlaceholder() {
    return Expanded(
      child: GestureDetector(
        onTap: () => controller.pickImage(),
        child: Container(
          height: 188.h,
          padding: EdgeInsets.fromLTRB(42.h, 42.h, 42.h, 42.h),
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xFF939393), width: 1.h),
            borderRadius: BorderRadius.circular(10.h),
          ),
          child: Column(
            spacing: 12.h,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 2.h),
                child: CustomIconButton(
                  iconPath: ImageConstant.imgLineiconsPlus,
                  height: 44.h,
                  width: 44.h,
                  backgroundColor: Color(0xFFFAFAFA),
                  borderRadius: 22.h,
                  onTap: () => controller.pickImage(),
                ),
              ),
              Text(
                'Add More\nPhotos',
                textAlign: TextAlign.center,
                style: TextStyleHelper.instance.body14RegularPoppins
                    .copyWith(height: 1.5, color: Color(0xFF000000)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomSection() {
    return Container(
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
            onPressed: () => controller.onNextPressed(),
          ),
        ],
      ),
    );
  }
}
