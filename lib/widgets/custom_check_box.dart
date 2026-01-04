import 'package:flutter/material.dart';

import '../core/app_export.dart';

/**
 * CustomCheckBox - A flexible checkbox component that supports optional text labels
 * 
 * Features:
 * - Optional text label with customizable styling
 * - Configurable spacing between checkbox and label
 * - Support for custom colors and styling
 * - Responsive design using SizeUtils
 * - Proper state management with callback handling
 * 
 * @param isChecked - Boolean state of the checkbox
 * @param onChanged - Callback function triggered when checkbox state changes
 * @param label - Optional text label displayed next to checkbox
 * @param textStyle - Custom text style for the label
 * @param checkboxColor - Color of the checkbox when checked
 * @param spacing - Space between checkbox and label
 * @param alignment - Alignment of the checkbox and label
 */
class CustomCheckBox extends StatelessWidget {
  CustomCheckBox({
    Key? key,
    required this.isChecked,
    required this.onChanged,
    this.label,
    this.textStyle,
    this.checkboxColor,
    this.spacing,
    this.alignment,
  }) : super(key: key);

  /// Boolean state indicating if checkbox is checked
  final bool isChecked;

  /// Callback function triggered when checkbox state changes
  final Function(bool?) onChanged;

  /// Optional text label displayed next to checkbox
  final String? label;

  /// Custom text style for the label
  final TextStyle? textStyle;

  /// Color of the checkbox when checked
  final Color? checkboxColor;

  /// Space between checkbox and label
  final double? spacing;

  /// Alignment of the checkbox and label
  final MainAxisAlignment? alignment;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(!isChecked),
      child: Row(
        mainAxisAlignment: alignment ?? MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 24.h,
            width: 24.h,
            child: Checkbox(
              value: isChecked,
              onChanged: onChanged,
              activeColor: checkboxColor ?? Theme.of(context).primaryColor,
              checkColor: appTheme.whiteCustom,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ),
          if (label != null) ...[
            SizedBox(width: spacing ?? 8.h),
            Flexible(
              child: Text(
                label!,
                style: textStyle ??
                    TextStyleHelper.instance.body13RegularPoppins
                        .copyWith(height: 1.54, color: Color(0xFF000000)),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
