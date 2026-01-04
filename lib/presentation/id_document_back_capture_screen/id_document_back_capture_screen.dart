import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_app_bar.dart';
import './controller/id_document_back_capture_controller.dart';

class IdDocumentBackCaptureScreen
    extends GetWidget<IdDocumentBackCaptureController> {
  const IdDocumentBackCaptureScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F5F4),
      appBar: _buildAppBar(),
      body: _buildBody(context),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      leadingIcon: ImageConstant.imgFrame2147234282,
      backgroundColor: appTheme.transparentCustom,
      onLeadingPressed: () => Get.back(),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(14.h, 18.h, 14.h, 18.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Back of ID',
            style: TextStyleHelper.instance.title18BoldSyne
                .copyWith(color: Color(0xFF041816), height: 1.22),
          ),
          SizedBox(height: 140.h),
          _buildCameraPreview(),
          SizedBox(height: 180.h),
          Text(
            'ID Back Side',
            style: TextStyleHelper.instance.body14BoldPoppins
                .copyWith(color: Color(0xFF5A5A5A), height: 1.57),
          ),
          Container(
            margin: EdgeInsets.only(top: 6.h, bottom: 28.h),
            width: Get.width * 0.76,
            child: Text(
              'Position your ID in the frame, and the photo will be captured automatically.',
              style: TextStyleHelper.instance.body13RegularPoppins
                  .copyWith(color: Color(0xFF888888), height: 1.69),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCameraPreview() {
    return Obx(() {
      if (controller.capturedImage.value != null) {
        return Container(
          width: 360.h,
          height: 250.h,
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xFFD9D9D9), width: 2),
            borderRadius: BorderRadius.circular(30.h),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(28.h),
            child: Image.file(
              controller.capturedImage.value!,
              fit: BoxFit.cover,
            ),
          ),
        );
      }

      if (controller.isCameraInitialized.value &&
          controller.cameraController != null) {
        return Container(
          width: 360.h,
          height: 250.h,
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xFFD9D9D9), width: 2),
            borderRadius: BorderRadius.circular(30.h),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(28.h),
            child: CameraPreview(controller.cameraController!),
          ),
        );
      }

      if (controller.isInitializing.value) {
        return Container(
          width: 360.h,
          height: 250.h,
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xFFD9D9D9), width: 2),
            borderRadius: BorderRadius.circular(30.h),
            color: Color(0xFFF2F2F2),
          ),
          child: Center(
            child: CircularProgressIndicator(
              color: Color(0xFF260F06),
            ),
          ),
        );
      }

      return GestureDetector(
        onTap: () => controller.initializeCamera(),
        child: Container(
          width: 360.h,
          height: 250.h,
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xFFD9D9D9), width: 2),
            borderRadius: BorderRadius.circular(30.h),
            color: Color(0xFFF2F2F2),
          ),
          child: Center(
            child: Icon(
              Icons.camera_alt_outlined,
              size: 48.h,
              color: Color(0xFF888888),
            ),
          ),
        ),
      );
    });
  }
}
