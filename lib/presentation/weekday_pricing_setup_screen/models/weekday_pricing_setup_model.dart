import 'package:get/get.dart';
import '../../../core/app_export.dart';

class WeekdayPricingSetupModel {
  Rx<bool>? isHourlyBookingEnabled;
  Rx<String>? selectedHours;
  Rx<double>? baseFare;
  Rx<double>? guestServiceFee;
  Rx<double>? guestPrice;
  Rx<double>? userEarnings;
  Rx<double>? hourlyRate;
  Rx<double>? hourlyEarnings;

  WeekdayPricingSetupModel({
    this.isHourlyBookingEnabled,
    this.selectedHours,
    this.baseFare,
    this.guestServiceFee,
    this.guestPrice,
    this.userEarnings,
    this.hourlyRate,
    this.hourlyEarnings,
  }) {
    isHourlyBookingEnabled = isHourlyBookingEnabled ?? Rx(false);
    selectedHours = selectedHours ?? Rx("04 hours");
    baseFare = baseFare ?? Rx(450.00);
    guestServiceFee = guestServiceFee ?? Rx(150.00);
    guestPrice = guestPrice ?? Rx(600.00);
    userEarnings = userEarnings ?? Rx(450.00);
    hourlyRate = hourlyRate ?? Rx(180.00);
    hourlyEarnings = hourlyEarnings ?? Rx(120.00);
  }
}
