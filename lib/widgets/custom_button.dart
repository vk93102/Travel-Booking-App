import 'package:flutter/material.dart';

import '../core/app_export.dart';
import './custom_image_view.dart';

/**
 * CustomButton - A flexible and reusable button component
 * 
 * Supports text, background colors, icons, and custom styling.
 * Can be used for primary actions, secondary actions, and various button states.
 * 
 * @param text - The text to display on the button
 * @param onPressed - Callback function when button is pressed  
 * @param backgroundColor - Background color of the button
 * @param textColor - Color of the button text
 * @param rightIcon - Optional icon to display on the right side
 * @param borderRadius - Border radius for button corners
 * @param padding - Custom padding for the button
 * @param width - Width of the button
 * @param height - Height of the button
 * @param isEnabled - Whether the button is enabled or disabled
 */
class CustomButton extends StatelessWidget {
  CustomButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.rightIcon,
    this.borderRadius,
    this.padding,
    this.width,
    this.height,
    this.isEnabled = true,
  }) : super(key: key);

  /// The text to display on the button
  final String text;

  /// Callback function when button is pressed
  final VoidCallback? onPressed;

  /// Background color of the button
  final Color? backgroundColor;

  /// Color of the button text
  final Color? textColor;

  /// Optional icon to display on the right side
  final String? rightIcon;

  /// Border radius for button corners
  final double? borderRadius;

  /// Custom padding for the button
  final EdgeInsetsGeometry? padding;

  /// Width of the button
  final double? width;

  /// Height of the button
  final double? height;

  /// Whether the button is enabled or disabled
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height ?? 41.h,
      child: ElevatedButton(
        onPressed: isEnabled ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? Color(0xFF260F06),
          foregroundColor: textColor ?? Color(0xFFFFFFFF),
          padding: padding ?? EdgeInsets.fromLTRB(18.h, 12.h, 18.h, 12.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 22.h),
          ),
          elevation: 0,
          minimumSize: Size.zero,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyleHelper.instance.body14SemiBoldSyne
                  .copyWith(color: textColor ?? Color(0xFFFFFFFF)),
            ),
            if (rightIcon != null) ...[
              SizedBox(width: 8.h),
              CustomImageView(
                imagePath: rightIcon!,
                height: 24.h,
                width: 24.h,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
