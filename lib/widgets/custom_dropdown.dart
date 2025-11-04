import 'package:flutter/material.dart';

import '../core/app_export.dart';
import './custom_image_view.dart';

/**
 * CustomDropdown - A reusable dropdown component with consistent styling
 * 
 * Features:
 * - Form validation support
 * - Customizable hint text and items
 * - Consistent Material Design styling
 * - Responsive design with SizeUtils
 * - Built-in chevron icon
 * 
 * @param hintText - Placeholder text displayed when no item is selected
 * @param value - Currently selected value
 * @param items - List of dropdown options to display
 * @param onChanged - Callback function when selection changes
 * @param validator - Form validation function
 */
class CustomDropdown extends StatelessWidget {
  CustomDropdown({
    Key? key,
    this.hintText,
    this.value,
    this.items,
    this.onChanged,
    this.validator,
  }) : super(key: key);

  /// Placeholder text shown when no item is selected
  final String? hintText;

  /// Currently selected dropdown value
  final String? value;

  /// List of items to display in dropdown
  final List<String>? items;

  /// Callback function triggered when selection changes
  final Function(String?)? onChanged;

  /// Validation function for form validation
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: value,
      items: (items ?? []).map((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(
            item,
            style: TextStyleHelper.instance.body14RegularPoppins
                .copyWith(height: 22 / 14, color: Color(0xFF000000)),
          ),
        );
      }).toList(),
      onChanged: onChanged,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText ?? "Select an option",
        hintStyle: TextStyleHelper.instance.body14RegularPoppins
            .copyWith(height: 22 / 14, color: Color(0xFF000000)),
        contentPadding: EdgeInsets.only(
          top: 18.h,
          right: 38.h,
          bottom: 18.h,
          left: 14.h,
        ),
        suffixIcon: Padding(
          padding: EdgeInsets.only(right: 14.h),
          child: CustomImageView(
            imagePath: ImageConstant.imgChevronright,
            height: 24.h,
            width: 24.h,
          ),
        ),
        suffixIconConstraints: BoxConstraints(
          maxHeight: 24.h,
          maxWidth: 24.h,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.h),
          borderSide: BorderSide(
            color: Color(0xFFD9D9D9),
            width: 1.h,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.h),
          borderSide: BorderSide(
            color: Color(0xFFD9D9D9),
            width: 1.h,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.h),
          borderSide: BorderSide(
            color: Color(0xFFD9D9D9),
            width: 1.h,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.h),
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.h,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.h),
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.h,
          ),
        ),
      ),
      style: TextStyleHelper.instance.body14RegularPoppins
          .copyWith(height: 22 / 14, color: Color(0xFF000000)),
      icon: SizedBox
          .shrink(), // Hide default dropdown icon since we use custom suffixIcon
      isExpanded: true,
    );
  }
}
