import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../../../widgets/custom_image_view.dart';
import '../models/amenity_item_model.dart';

class AmenityCardWidget extends StatelessWidget {
  final AmenityItemModel amenity;
  final VoidCallback? onTap;

  AmenityCardWidget({
    Key? key,
    required this.amenity,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Obx(() => Container(
            padding: EdgeInsets.all(8.h),
            decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),
              borderRadius: BorderRadius.circular(10.h),
              border: amenity.isSelected.value
                  ? Border.all(color: Color(0xFF260F06), width: 2.h)
                  : null,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomImageView(
                  imagePath: amenity.imagePath.value,
                  height: 60.h,
                  width: 60.h,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 8.h),
                Text(
                  amenity.name.value,
                  textAlign: TextAlign.center,
                  style: TextStyleHelper.instance.body13RegularPoppins
                      .copyWith(color: Color(0xFF000000), height: 1.38),
                ),
              ],
            ),
          )),
    );
  }
}
