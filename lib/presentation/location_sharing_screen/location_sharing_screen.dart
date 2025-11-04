import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_image_view.dart';
import './controller/location_sharing_controller.dart';

class LocationSharingScreen extends GetWidget<LocationSharingController> {
  LocationSharingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF7F5F4),
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(56.h),
            child: CustomAppBar(
                leadingIcon: ImageConstant.imgFrame2147234282,
                onLeadingPressed: () => Get.back())),
        body: Column(children: [
          Expanded(
              child: Padding(
                  padding: EdgeInsets.only(top: 18.h, left: 16.h, right: 16.h),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.46,
                            child: Text('Share your exact location details',
                                style: TextStyleHelper.instance.title18BoldSyne
                                    .copyWith(
                                        height: 1.17,
                                        color: Color(0xFF041816)))),
                        SizedBox(height: 25.h),
                        Text('Pin your location on the map.',
                            style: TextStyleHelper.instance.body13RegularPoppins
                                .copyWith(
                                    height: 1.54, color: Color(0xFFA2A2A2))),
                        Container(
                            margin: EdgeInsets.only(top: 24.h),
                            padding: EdgeInsets.all(18.h),
                            decoration: BoxDecoration(
                                color: Color(0xFFFFFFFF),
                                borderRadius: BorderRadius.circular(10.h)),
                            child: Row(spacing: 26.h, children: [
                              CustomImageView(
                                  imagePath: ImageConstant.imgLocationPin,
                                  height: 24.h,
                                  width: 24.h),
                              Expanded(
                                  child: Padding(
                                      padding: EdgeInsets.only(bottom: 2.h),
                                      child: Text(
                                          'Al Marsa Street, Dubai Marina, Dubai, United Arab Emirates',
                                          style: TextStyleHelper
                                              .instance.body14RegularPoppins
                                              .copyWith(
                                                  height: 1.43,
                                                  color: Color(0xFF000000))))),
                            ])),
                        Container(
                            margin: EdgeInsets.only(top: 10.h),
                            decoration: BoxDecoration(
                                color: Color(0xFFFFFFFF),
                                borderRadius: BorderRadius.circular(10.h),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color(0x0C000000),
                                      offset: Offset(2, 2),
                                      blurRadius: 10),
                                ]),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.h),
                                child: SizedBox(
                                    height: 400.h,
                                    child: Obx(() {
                                      return GoogleMap(
                                          onMapCreated: controller.onMapCreated,
                                          initialCameraPosition: CameraPosition(
                                              target: controller
                                                      .locationSharingModel
                                                      .value
                                                      ?.currentLocation!
                                                      .value ??
                                                  LatLng(25.0760,
                                                      55.1090), // Dubai Marina coordinates
                                              zoom: 14.0),
                                          markers: Set<Marker>.from(controller
                                                  .locationSharingModel
                                                  .value
                                                  ?.markers!
                                                  .value ??
                                              []),
                                          onTap: controller.onMapTapped,
                                          myLocationEnabled: true,
                                          myLocationButtonEnabled: true,
                                          zoomControlsEnabled: false);
                                    })))),
                      ]))),
          Container(
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(38.h, 20.h, 38.h, 20.h),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [
                    0.0,
                    0.5,
                    1.0
                  ],
                      colors: [
                    Color(0x00F7F5F4),
                    Color(0x99F7F5F4),
                    Color(0xFFF7F5F4),
                  ])),
              child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                CustomButton(
                    text: 'Next',
                    rightIcon: ImageConstant.imgMynauiarrowupWhiteA700,
                    onPressed: controller.onNextPressed),
              ])),
        ]));
  }
}
