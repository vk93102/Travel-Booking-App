import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_button.dart';
import './controller/host_category_selection_controller.dart';
import './models/host_category_selection_model.dart';
import './widgets/category_item_widget.dart';

class HostCategorySelectionScreen
    extends GetWidget<HostCategorySelectionController> {
  HostCategorySelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.gray_100,
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.only(
                  top: 96.h,
                  left: 14.h,
                  right: 14.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "What would you like to host?",
                      style: TextStyleHelper.instance.title18BoldSyne
                          .copyWith(height: 1.22),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 4.h),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "S",
                              style: TextStyleHelper
                                  .instance.body13RegularPoppins
                                  .copyWith(height: 1.46),
                            ),
                            TextSpan(
                              text:
                                  "elect the category that best represents your property.",
                              style: TextStyleHelper
                                  .instance.body13RegularPoppins
                                  .copyWith(height: 1.46),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(
                          top: 20.h,
                          right: 2.h,
                          bottom: 42.h,
                        ),
                        child: Obx(() => GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 12.h,
                                mainAxisSpacing: 12.h,
                                childAspectRatio: 0.88,
                              ),
                              itemCount: controller.hostCategorySelectionModel
                                      .value?.categoryList?.length ??
                                  0,
                              itemBuilder: (context, index) {
                                CategoryItemModel category = controller
                                        .hostCategorySelectionModel
                                        .value
                                        ?.categoryList?[index] ??
                                    CategoryItemModel();
                                return CategoryItemWidget(
                                  category: category,
                                  onTap: () => controller.onCategoryTap(index),
                                );
                              },
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
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
                    appTheme.color99F7F5,
                    appTheme.gray_100,
                  ],
                  stops: [0.0, 0.5, 1.0],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CustomButton(
                    text: "Next",
                    rightIcon: ImageConstant.imgMynauiarrowupWhiteA700,
                    backgroundColor: appTheme.gray_900,
                    textColor: appTheme.white_A700,
                    borderRadius: 22.h,
                    padding: EdgeInsets.fromLTRB(18.h, 12.h, 18.h, 12.h),
                    onPressed: () => controller.onNextPressed(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
