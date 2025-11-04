import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_image_view.dart';
import './controller/host_onboarding_controller.dart';

class HostOnboardingScreen extends GetWidget<HostOnboardingController> {
  const HostOnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: appTheme.white_A700,
          image: DecorationImage(
            image: AssetImage(ImageConstant.imgImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0x15000A13),
                appTheme.color15E50A,
                appTheme.gray_900_01,
              ],
              stops: [0.0, 0.5, 1.0],
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(left: 30.h),
                      child: Text(
                        "Become a Host",
                        style: TextStyleHelper.instance.headline24BoldSyne
                            .copyWith(height: 29 / 24),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 30.h, top: 2.h),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Text(
                          "Lorem ipsum dolor sit amet conse ctetur. Vestibulum diam augue sed malesua.",
                          style: TextStyleHelper.instance.body13RegularPoppins
                              .copyWith(
                                  color: appTheme.gray_400, height: 19 / 13),
                        ),
                      ),
                    ),
                    SizedBox(height: 32.h),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.h),
                child: Column(
                  children: [
                    _buildGetStartedButton(),
                    SizedBox(height: 12.h),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGetStartedButton() {
    return GestureDetector(
      onTap: () => controller.onGetStartedTap(),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(14.h, 10.h, 14.h, 10.h),
        decoration: BoxDecoration(
          color: appTheme.gray_200,
          borderRadius: BorderRadius.circular(22.h),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 4.h),
              child: Text(
                "Get Started",
                style: TextStyleHelper.instance.body14SemiBoldSyne
                    .copyWith(color: appTheme.gray_900, height: 17 / 14),
              ),
            ),
            CustomImageView(
              imagePath: ImageConstant.imgMynauiArrowUp,
              height: 24.h,
              width: 24.h,
            ),
          ],
        ),
      ),
    );
  }
}
