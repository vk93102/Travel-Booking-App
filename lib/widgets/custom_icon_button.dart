import 'package:flutter/material.dart';

import '../core/app_export.dart';
import '../core/utils/size_utils.dart';
import './custom_image_view.dart';

/**
 * CustomIconButton - A reusable icon button widget with customizable styling
 * 
 * This widget provides a flexible icon button implementation with support for:
 * - Custom icon paths (SVG, PNG, network images)
 * - Configurable dimensions and padding
 * - Customizable background colors and border radius
 * - Tap event handling
 * - Responsive design using SizeUtils extensions
 * 
 * @param iconPath - Path to the icon image (required)
 * @param onTap - Callback function when button is tapped
 * @param height - Height of the button
 * @param width - Width of the button
 * @param padding - Internal padding around the icon
 * @param backgroundColor - Background color of the button
 * @param borderRadius - Border radius for rounded corners
 * @param iconColor - Color filter for the icon
 * @param boxFit - How the icon should be fitted within its bounds
 */
class CustomIconButton extends StatelessWidget {
  CustomIconButton({
    Key? key,
    required this.iconPath,
    this.onTap,
    this.height,
    this.width,
    this.padding,
    this.backgroundColor,
    this.borderRadius,
    this.iconColor,
    this.boxFit,
  }) : super(key: key);

  /// Path to the icon image (SVG, PNG, network URL, etc.)
  final String iconPath;

  /// Callback function triggered when the button is tapped
  final VoidCallback? onTap;

  /// Height of the button
  final double? height;

  /// Width of the button
  final double? width;

  /// Internal padding around the icon
  final EdgeInsetsGeometry? padding;

  /// Background color of the button
  final Color? backgroundColor;

  /// Border radius for rounded corners
  final double? borderRadius;

  /// Color filter applied to the icon
  final Color? iconColor;

  /// How the icon should be fitted within its bounds
  final BoxFit? boxFit;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? 44.h,
        width: width ?? 44.h,
        padding: padding ?? EdgeInsets.all(10.h),
        decoration: BoxDecoration(
          color: backgroundColor ?? Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(borderRadius ?? 22.h),
        ),
        child: CustomImageView(
          imagePath: iconPath,
          height: double.infinity,
          width: double.infinity,
          fit: boxFit ?? BoxFit.contain,
          color: iconColor,
        ),
      ),
    );
  }
}
