import 'package:flutter/material.dart';

import '../core/app_export.dart';

/**
 * CustomFloatingTextField - A reusable floating label text field component
 * 
 * Features:
 * - Floating label animation
 * - Customizable input types and validation
 * - Character counter support
 * - Responsive design with SizeUtils
 * - Consistent styling with app theme
 * 
 * @param placeholder - Hint text displayed when field is empty
 * @param initialValue - Initial text value for the field
 * @param keyboardType - Type of keyboard to show (text, number, etc.)
 * @param validator - Validation function for form validation
 * @param onChanged - Callback when text changes
 * @param maxLength - Maximum character limit
 * @param showCounter - Whether to show character counter
 * @param isRequired - Whether field is required (affects validation)
 * @param margin - External spacing around the field
 * @param enabled - Whether the field is enabled for input
 */
class CustomFloatingTextField extends StatelessWidget {
  const CustomFloatingTextField({
    Key? key,
    this.placeholder,
    this.initialValue,
    this.keyboardType,
    this.validator,
    this.onChanged,
    this.maxLength,
    this.showCounter = false,
    this.isRequired = false,
    this.margin,
    this.enabled = true,
    this.controller,
  }) : super(key: key);

  final String? placeholder;
  final String? initialValue;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final int? maxLength;
  final bool showCounter;
  final bool isRequired;
  final EdgeInsetsGeometry? margin;
  final bool enabled;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.only(top: 18.h),
      child: TextFormField(
        controller: controller,
        initialValue: controller == null ? initialValue : null,
        keyboardType: keyboardType ?? TextInputType.text,
        enabled: enabled,
        maxLength: maxLength,
        buildCounter: showCounter
            ? _buildCounter
            : (context,
                    {required currentLength, required isFocused, maxLength}) =>
                null,
        style: TextStyleHelper.instance.body14RegularPoppins
            .copyWith(height: 22.h / 14.fSize, color: Color(0xFF000000)),
        decoration: InputDecoration(
          hintText: placeholder,
          hintStyle: TextStyleHelper.instance.body14RegularPoppins
              .copyWith(color: Color(0xFFBCBCBC)),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          contentPadding: EdgeInsets.fromLTRB(14.h, 24.h, 14.h, 6.h),
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
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.h),
            borderSide: BorderSide(
              color: Color(0xFFD9D9D9).withAlpha(128),
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
        validator: validator ?? (isRequired ? _defaultValidator : null),
        onChanged: onChanged,
      ),
    );
  }

  Widget? _buildCounter(BuildContext context,
      {required int currentLength, required bool isFocused, int? maxLength}) {
    if (!showCounter || maxLength == null) return null;

    return Padding(
      padding: EdgeInsets.only(top: 4.h),
      child: Text(
        '$currentLength/$maxLength',
        style: TextStyleHelper.instance.body12RegularPoppins
            .copyWith(color: Color(0xFFBCBCBC)),
      ),
    );
  }

  String? _defaultValidator(String? value) {
    if (isRequired && (value == null || value.isEmpty)) {
      return 'This field is required';
    }
    return null;
  }
}
