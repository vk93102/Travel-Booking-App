import 'package:flutter/material.dart';

import '../core/app_export.dart';
import './custom_image_view.dart';

/**
 * CustomAppBar is a reusable AppBar component that provides a consistent header
 * with customizable leading button and styling options.
 * 
 * @param leadingIcon - Path to the leading icon image (optional)
 * @param onLeadingPressed - Callback function when leading button is pressed (optional)
 * @param backgroundColor - Background color of the AppBar (optional)
 * @param leadingButtonColor - Background color of the leading button (optional)
 */
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({
    Key? key,
    this.leadingIcon,
    this.onLeadingPressed,
    this.backgroundColor,
    this.leadingButtonColor,
  }) : super(key: key);

  /// Path to the leading icon image
  final String? leadingIcon;

  /// Callback function when leading button is pressed
  final VoidCallback? onLeadingPressed;

  /// Background color of the AppBar
  final Color? backgroundColor;

  /// Background color of the leading button
  final Color? leadingButtonColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? appTheme.transparentCustom,
      elevation: 0,
      automaticallyImplyLeading: false,
      leading: leadingIcon != null
          ? Padding(
              padding: EdgeInsets.only(left: 16.h),
              child: Container(
                width: 44.h,
                height: 44.h,
                decoration: BoxDecoration(
                  color: leadingButtonColor ?? Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(22.h),
                ),
                child: IconButton(
                  onPressed: onLeadingPressed ?? () => Navigator.pop(context),
                  icon: CustomImageView(
                    imagePath: leadingIcon!,
                    height: 24.h,
                    width: 24.h,
                  ),
                  padding: EdgeInsets.zero,
                ),
              ),
            )
          : null,
      leadingWidth: leadingIcon != null ? 76.h : null,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56.h);
}
