import 'package:get/get.dart';
import '../../../core/app_export.dart';

/// This class is used in the [BookingPreferenceSetupScreen] screen with GetX.

class BookingPreferenceSetupModel {
  Rx<String>? selectedType;
  Rx<bool>? isInstantBookingSelected;
  Rx<bool>? isReservationBookingSelected;
  Rx<bool>? isHourlyBookingSelected;

  BookingPreferenceSetupModel({
    this.selectedType,
    this.isInstantBookingSelected,
    this.isReservationBookingSelected,
    this.isHourlyBookingSelected,
  }) {
    selectedType = selectedType ?? Rx("instant");
    isInstantBookingSelected = isInstantBookingSelected ?? Rx(true);
    isReservationBookingSelected = isReservationBookingSelected ?? Rx(false);
    isHourlyBookingSelected = isHourlyBookingSelected ?? Rx(false);
  }
}
