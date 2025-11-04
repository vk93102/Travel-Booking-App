import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core/app_export.dart';

/**
 * CustomEditText - A reusable text input field component with validation support
 * 
 * Features:
 * - Customizable placeholder text and keyboard type
 * - Built-in validation support with error handling
 * - Responsive design with proper scaling
 * - Configurable styling and input formatting
 * - Form integration with TextEditingController support
 * 
 * @param controller - TextEditingController for managing input text
 * @param placeholder - Hint text displayed when field is empty
 * @param validator - Function to validate input and return error message
 * @param keyboardType - Type of keyboard to display for input
 * @param onChanged - Callback function triggered when text changes
 * @param enabled - Whether the text field is enabled for input
 * @param inputFormatters - List of input formatters to apply to text input
 * @param maxLines - Maximum number of lines for text input
 * @param textStyle - Custom text style for input text
 * @param hintTextStyle - Custom text style for placeholder text
 * @param borderColor - Color of the input field border
 * @param focusedBorderColor - Color of border when field is focused
 * @param errorBorderColor - Color of border when validation fails
 */
class CustomEditText extends StatelessWidget {
  CustomEditText({
    Key? key,
    this.controller,
    this.placeholder,
    this.validator,
    this.keyboardType,
    this.onChanged,
    this.enabled,
    this.inputFormatters,
    this.maxLines,
    this.textStyle,
    this.hintTextStyle,
    this.borderColor,
    this.focusedBorderColor,
    this.errorBorderColor,
  }) : super(key: key);

  /// Controller for managing the text input
  final TextEditingController? controller;

  /// Placeholder text shown when field is empty
  final String? placeholder;

  /// Validation function that returns error message or null
  final String? Function(String?)? validator;

  /// Type of keyboard to display
  final TextInputType? keyboardType;

  /// Callback when text changes
  final Function(String)? onChanged;

  /// Whether the text field is enabled
  final bool? enabled;

  /// Input formatters for text processing
  final List<TextInputFormatter>? inputFormatters;

  /// Maximum number of lines
  final int? maxLines;

  /// Custom text style for input text
  final TextStyle? textStyle;

  /// Custom text style for hint text
  final TextStyle? hintTextStyle;

  /// Border color
  final Color? borderColor;

  /// Focused border color
  final Color? focusedBorderColor;

  /// Error border color
  final Color? errorBorderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16.h),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType ?? TextInputType.text,
        enabled: enabled ?? true,
        maxLines: maxLines ?? 1,
        onChanged: onChanged,
        validator: validator,
        inputFormatters: inputFormatters,
        style: textStyle ??
            TextStyleHelper.instance.body13RegularPoppins
                .copyWith(color: Color(0xFF000000)),
        decoration: InputDecoration(
          hintText: placeholder ?? '',
          hintStyle: hintTextStyle ??
              TextStyleHelper.instance.body13RegularPoppins
                  .copyWith(color: Color(0xFFC3C3C3)),
          contentPadding: EdgeInsets.symmetric(
            vertical: 12.h,
            horizontal: 14.h,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.h),
            borderSide: BorderSide(
              color: borderColor ?? Color(0xFFD9D9D9),
              width: 1.h,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.h),
            borderSide: BorderSide(
              color: borderColor ?? Color(0xFFD9D9D9),
              width: 1.h,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.h),
            borderSide: BorderSide(
              color: focusedBorderColor ?? Color(0xFF2196F3),
              width: 1.h,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.h),
            borderSide: BorderSide(
              color: errorBorderColor ?? Color(0xFFE57373),
              width: 1.h,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.h),
            borderSide: BorderSide(
              color: errorBorderColor ?? Color(0xFFE57373),
              width: 1.h,
            ),
          ),
        ),
      ),
    );
  }
}
