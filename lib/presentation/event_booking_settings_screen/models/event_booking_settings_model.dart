import 'package:get/get.dart';
import '../../../core/app_export.dart';

/// This class is used in the [EventBookingSettingsScreen] screen with GetX.

class EventBookingSettingsModel {
  Rx<bool>? isEventBookingEnabled;

  EventBookingSettingsModel({this.isEventBookingEnabled}) {
    isEventBookingEnabled = isEventBookingEnabled ?? Rx(true);
  }
}
