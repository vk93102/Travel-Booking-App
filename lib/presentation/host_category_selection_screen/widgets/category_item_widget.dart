import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../../../widgets/custom_image_view.dart';
import '../models/host_category_selection_model.dart';

class CategoryItemWidget extends StatelessWidget {
  final CategoryItemModel category;
  final VoidCallback? onTap;

  CategoryItemWidget({
    Key? key,
    required this.category,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Obx(() => Container(
            decoration: BoxDecoration(
              color: appTheme.white_A700,
              borderRadius: BorderRadius.circular(10.h),
              border: category.isSelected?.value == true
                  ? Border.all(
                      color: appTheme.gray_900,
                      width: 2.h,
                    )
                  : null,
            ),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.all(8.h),
                    child: CustomImageView(
                      imagePath: category.image?.value ?? "",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.fromLTRB(16.h, 0, 16.h, 14.h),
                  child: Text(
                    category.title?.value ?? "",
                    style: TextStyleHelper.instance.body14RegularPoppins
                        .copyWith(height: 1.5),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
