import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_icon_button.dart';
import './controller/id_document_front_capture_controller.dart';

class IdDocumentFrontCaptureScreen
    extends GetWidget<IdDocumentFrontCaptureController> {
  IdDocumentFrontCaptureScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F5F4),
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(14.h, 18.h, 14.h, 18.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Front of ID',
                      style: TextStyleHelper.instance.title18BoldSyne
                          .copyWith(color: Color(0xFF041816), height: 1.22),
                    ),
                    Spacer(),
                    _buildCameraPreview(),
                    Spacer(),
                    Text(
                      'ID Front Side',
                      style: TextStyleHelper.instance.body14BoldPoppins
                          .copyWith(color: Color(0xFF5A5A5A), height: 1.57),
                    ),
                    Container(
                      width: 290.h,
                      margin: EdgeInsets.only(top: 6.h, bottom: 28.h),
                      child: Text(
                        'Position your ID in the frame, and the photo will be captured automatically.',
                        style: TextStyleHelper.instance.body13RegularPoppins
                            .copyWith(color: Color(0xFF888888), height: 1.69),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Container(
      width: double.infinity,
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
            onTap: () => Get.back(),
          ),
        ],
      ),
    );
  }

  Widget _buildCameraPreview() {
    return Obx(() {
      if (controller.isLoading.value) {
        return Container(
          width: 360.h,
          height: 250.h,
          decoration: BoxDecoration(
            color: Color(0xFFF2F2F2),
            border: Border.all(
              color: Color(0xFFD9D9D9),
              width: 2.h,
            ),
            borderRadius: BorderRadius.circular(30.h),
          ),
          child: Center(
            child: CircularProgressIndicator(
              color: Color(0xFF041816),
            ),
          ),
        );
      }

      if (controller.capturedImagePath.value != null) {
        return Container(
          width: 360.h,
          height: 250.h,
          decoration: BoxDecoration(
            border: Border.all(
              color: Color(0xFF4CAF50),
              width: 3.h,
            ),
            borderRadius: BorderRadius.circular(30.h),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(28.h),
            child: Image.memory(
              controller.capturedImageBytes.value!,
              fit: BoxFit.cover,
            ),
          ),
        );
      }

      if (controller.cameraController.value != null &&
          controller.cameraController.value!.value.isInitialized) {
        return Container(
          width: 360.h,
          height: 250.h,
          decoration: BoxDecoration(
            border: Border.all(
              color: Color(0xFFD9D9D9),
              width: 2.h,
            ),
            borderRadius: BorderRadius.circular(30.h),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(28.h),
            child: Stack(
              children: [
                CameraPreview(controller.cameraController.value!),
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xFF2196F3),
                        width: 2.h,
                      ),
                      borderRadius: BorderRadius.circular(28.h),
                    ),
                  ),
                ),
                if (controller.isReadyToCapture.value)
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xFF4CAF50),
                          width: 3.h,
                        ),
                        borderRadius: BorderRadius.circular(28.h),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      }

      return Container(
        width: 360.h,
        height: 250.h,
        decoration: BoxDecoration(
          color: Color(0xFFF2F2F2),
          border: Border.all(
            color: Color(0xFFD9D9D9),
            width: 2.h,
          ),
          borderRadius: BorderRadius.circular(30.h),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.camera_alt,
              size: 48.h,
              color: Color(0xFF888888),
            ),
            SizedBox(height: 16.h),
            Text(
              'Camera not available',
              style: TextStyleHelper.instance.body14MediumPoppins
                  .copyWith(color: Color(0xFF888888)),
            ),
            SizedBox(height: 8.h),
            TextButton(
              onPressed: () => controller.initializeCamera(),
              child: Text(
                'Retry',
                style: TextStyleHelper.instance.body14SemiBoldPoppins
                    .copyWith(color: Color(0xFF2196F3)),
              ),
            ),
          ],
        ),
      );
    });
  }
}
