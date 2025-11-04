import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_image_view.dart';
import './controller/property_category_selection_controller.dart';
import './models/category_item_model.dart';

class PropertyCategorySelectionScreen
    extends GetWidget<PropertyCategorySelectionController> {
  const PropertyCategorySelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F5F4),
      appBar: _buildAppBar(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: _buildContent(context),
          ),
          _buildBottomSection(context),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingIcon: ImageConstant.imgFrame2147234282,
      onLeadingPressed: () => Get.back(),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.h, 18.h, 16.h, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Introduce your space",
            style: TextStyleHelper.instance.title18BoldSyne
                .copyWith(height: 1.22, color: Color(0xFF041816)),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            margin: EdgeInsets.only(top: 4.h),
            child: Text(
              "Select the category that best represents your property.",
              style: TextStyleHelper.instance.body13RegularPoppins
                  .copyWith(height: 1.46, color: Color(0xFFA2A2A2)),
            ),
          ),
          Expanded(
            child: _buildCategoryGrid(context),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryGrid(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      child: Obx(() => GridView.builder(
            padding: EdgeInsets.zero,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 11.h,
              mainAxisSpacing: 10.h,
              childAspectRatio: 0.87,
            ),
            itemCount: controller.categoryList.length,
            itemBuilder: (context, index) {
              CategoryItemModel item = controller.categoryList[index];
              return _buildCategoryItem(context, item, index);
            },
          )),
    );
  }

  Widget _buildCategoryItem(
      BuildContext context, CategoryItemModel item, int index) {
    return Obx(() => GestureDetector(
          onTap: () => controller.onCategorySelected(index),
          child: Container(
            padding: EdgeInsets.all(8.h),
            decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),
              borderRadius: BorderRadius.circular(10.h),
              border: controller.selectedCategoryIndex.value == index
                  ? Border.all(color: Color(0xFF260F06), width: 2.h)
                  : null,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    child: CustomImageView(
                      imagePath: item.imagePath?.value ?? "",
                      width: double.infinity,
                      fit: BoxFit.cover,
                      radius: BorderRadius.circular(6.h),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Padding(
                  padding: EdgeInsets.only(left: 6.h, bottom: 6.h),
                  child: Text(
                    item.title?.value ?? "",
                    style: TextStyleHelper.instance.body14RegularPoppins
                        .copyWith(height: 1.5, color: Color(0xFF000000)),
                  ),
                ),
              ],
            ),
          ),
        ));
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
            text: "Next",
            rightIcon: ImageConstant.imgMynauiarrowupWhiteA700,
            onPressed: () => controller.onNextPressed(),
          ),
        ],
      ),
    );
  }
}
