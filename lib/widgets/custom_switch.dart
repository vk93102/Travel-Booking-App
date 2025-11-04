import 'package:flutter/material.dart';

/**
 * A customizable switch widget that wraps Flutter's built-in Switch component.
 * Provides configurable colors and state management for toggle functionality.
 * 
 * @param value - The current state of the switch (true/false)
 * @param onChanged - Callback function triggered when switch state changes
 * @param activeColor - Color of the switch when it's in the on position
 * @param inactiveThumbColor - Color of the thumb when switch is off
 * @param inactiveTrackColor - Color of the track when switch is off
 */
class CustomSwitch extends StatelessWidget {
  CustomSwitch({
    Key? key,
    required this.value,
    this.onChanged,
    this.activeColor,
    this.inactiveThumbColor,
    this.inactiveTrackColor,
  }) : super(key: key);

  /// The current state of the switch
  final bool value;

  /// Callback function triggered when the switch state changes
  final Function(bool)? onChanged;

  /// Color of the switch when it's in the on position
  final Color? activeColor;

  /// Color of the thumb when the switch is in the off position
  final Color? inactiveThumbColor;

  /// Color of the track when the switch is in the off position
  final Color? inactiveTrackColor;

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: value,
      onChanged: onChanged,
      activeColor: activeColor ?? Theme.of(context).primaryColor,
      inactiveThumbColor: inactiveThumbColor ?? Colors.grey[300],
      inactiveTrackColor: inactiveTrackColor ?? Colors.grey[400],
    );
  }
}
