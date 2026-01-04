import 'package:get/get.dart';
import '../../../core/app_export.dart';

/// This class is used in the [WeekendPricingSetupScreen] screen with GetX.
class WeekendPricingSetupModel {
  // Price-related variables
  Rx<String>? basePrice;
  Rx<String>? baseFare;
  Rx<String>? guestServiceFee;
  Rx<String>? guestPrice;
  Rx<String>? yourEarnings;

  // Hourly booking variables
  Rx<bool>? isHourlyBookingEnabled;
  Rx<String>? selectedHours;
  Rx<String>? hourlyRate;
  Rx<String>? hourlyEarnings;
  Rx<bool>? isManualEntry;

  WeekendPricingSetupModel({
    this.basePrice,
    this.baseFare,
    this.guestServiceFee,
    this.guestPrice,
    this.yourEarnings,
    this.isHourlyBookingEnabled,
    this.selectedHours,
    this.hourlyRate,
    this.hourlyEarnings,
    this.isManualEntry,
  }) {
    basePrice = basePrice ?? Rx("850.00");
    baseFare = baseFare ?? Rx("650.00");
    guestServiceFee = guestServiceFee ?? Rx("200.00");
    guestPrice = guestPrice ?? Rx("850.00");
    yourEarnings = yourEarnings ?? Rx("650.00");
    isHourlyBookingEnabled = isHourlyBookingEnabled ?? Rx(false);
    selectedHours = selectedHours ?? Rx("04 hours");
    hourlyRate = hourlyRate ?? Rx("220.00");
    hourlyEarnings = hourlyEarnings ?? Rx("120.00");
    isManualEntry = isManualEntry ?? Rx(false);
  }
}
