import 'package:get/get.dart';
import '../../../core/app_export.dart';

/// This class is used in the [ExtraServicesAddonsScreen] screen with GetX.

class ExtraServicesAddonsModel {
  // Observable variables for reactive state management
  Rx<bool>? isAirportPickupEnabled;
  Rx<bool>? isLunchEnabled;
  Rx<bool>? isGuidedToursEnabled;
  Rx<String>? airportPickupPrice;
  Rx<String>? guidedToursPrice;

  // Constructor with default values
  ExtraServicesAddonsModel({
    this.isAirportPickupEnabled,
    this.isLunchEnabled,
    this.isGuidedToursEnabled,
    this.airportPickupPrice,
    this.guidedToursPrice,
  }) {
    isAirportPickupEnabled = isAirportPickupEnabled ?? Rx(false);
    isLunchEnabled = isLunchEnabled ?? Rx(false);
    isGuidedToursEnabled = isGuidedToursEnabled ?? Rx(false);
    airportPickupPrice = airportPickupPrice ?? Rx('50.00');
    guidedToursPrice = guidedToursPrice ?? Rx('125.00');
  }
}
