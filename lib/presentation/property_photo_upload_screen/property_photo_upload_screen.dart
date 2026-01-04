import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_image_view.dart';
import './controller/property_photo_upload_controller.dart';

class PropertyPhotoUploadScreen
    extends GetWidget<PropertyPhotoUploadController> {
  PropertyPhotoUploadScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F5F4),
      appBar: CustomAppBar(
        leadingIcon: ImageConstant.imgFrame2147234282,
        onLeadingPressed: () => Get.back(),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  top: 18.h,
                  left: 16.h,
                  right: 16.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Upload photos of your property',
                      style: TextStyleHelper.instance.title18BoldSyne
                          .copyWith(height: 1.17, color: Color(0xFF041816)),
                    ),
                    SizedBox(height: 18.h),
                    Text(
                      'Start with at least 3 photos. You can always add or update them later.',
                      style: TextStyleHelper.instance.body13RegularPoppins
                          .copyWith(height: 1.46, color: Color(0xFFA2A2A2)),
                    ),
                    SizedBox(height: 24.h),
                    _buildPhotoUploadOption(
                      icon: ImageConstant.imgLineiconsPlusGray50002,
                      title: 'Choose from device',
                      onTap: () => controller.pickFromGallery(),
                    ),
                    SizedBox(height: 12.h),
                    _buildPhotoUploadOption(
                      icon: ImageConstant.imgIconoirCamera,
                      title: 'Take new photos',
                      onTap: () => controller.takeNewPhoto(),
                    ),
                    SizedBox(height: 24.h),
                    Obx(() {
                      if (controller.selectedPhotos.isNotEmpty) {
                        return _buildSelectedPhotosPreview();
                      }
                      return SizedBox.shrink();
                    }),
                  ],
                ),
              ),
            ),
            _buildBottomSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildPhotoUploadOption({
    required String icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(12.h),
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(10.h),
        ),
        child: Row(
          children: [
            SizedBox(width: 4.h),
            CustomImageView(
              imagePath: icon,
              height: 24.h,
              width: 24.h,
            ),
            SizedBox(width: 10.h),
            Text(
              title,
              style: TextStyleHelper.instance.body14RegularPoppins
                  .copyWith(height: 1.5, color: Color(0xFF515151)),
            ),
            Spacer(),
            CustomImageView(
              imagePath: ImageConstant.imgIconamoonArrowUp2Light,
              height: 24.h,
              width: 24.h,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectedPhotosPreview() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Selected Photos (${controller.selectedPhotos.length})',
          style: TextStyleHelper.instance.title16SemiBoldSyne
              .copyWith(color: Color(0xFF041816)),
        ),
        SizedBox(height: 12.h),
        Container(
          height: 120.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.selectedPhotos.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(right: 12.h),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.h),
                      child: CustomImageView(
                        imagePath: controller.selectedPhotos[index].path,
                        height: 120.h,
                        width: 120.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 4.h,
                      right: 4.h,
                      child: GestureDetector(
                        onTap: () => controller.removePhoto(index),
                        child: Container(
                          padding: EdgeInsets.all(4.h),
                          decoration: BoxDecoration(
                            color: Colors.black54,
                            borderRadius: BorderRadius.circular(12.h),
                          ),
                          child: Icon(
                            Icons.close,
                            color: appTheme.whiteCustom,
                            size: 16.h,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildBottomSection() {
    return Container(
      width: double.infinity,
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
          stops: [0.0, 0.5, 1.0],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Obx(() => CustomButton(
                text: 'Next',
                rightIcon: ImageConstant.imgMynauiarrowupWhiteA700,
                backgroundColor: Color(0xFF260F06),
                textColor: Color(0xFFFFFFFF),
                isEnabled: controller.canProceed.value,
                onPressed: controller.canProceed.value
                    ? () => controller.proceedToNext()
                    : null,
              )),
        ],
      ),
    );
  }
}
