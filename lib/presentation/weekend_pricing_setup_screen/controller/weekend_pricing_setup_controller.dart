import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../models/weekend_pricing_setup_model.dart';

class WeekendPricingSetupController extends GetxController {
  // Observable model
  final weekendPricingModel = Rx<WeekendPricingSetupModel?>(null);

  // Hours list for dropdown
  final List<String> hoursList = [
    '01 hours',
    '02 hours',
    '03 hours',
    '04 hours',
    '05 hours',
    '06 hours',
    '07 hours',
    '08 hours',
    '09 hours',
    '10 hours',
    '11 hours',
    '12 hours'
  ];

  @override
  void onInit() {
    super.onInit();
    weekendPricingModel.value = WeekendPricingSetupModel();
  }

  void toggleHourlyBooking(bool value) {
    weekendPricingModel.value?.isHourlyBookingEnabled!.value = value;
    weekendPricingModel.refresh();
  }

  void updateSelectedHours(String? hours) {
    if (hours != null) {
      weekendPricingModel.value?.selectedHours!.value = hours;
      _calculateHourlyRate();
      weekendPricingModel.refresh();
    }
  }

  void toggleManualEntry() {
    weekendPricingModel.value?.isManualEntry!.value =
        !(weekendPricingModel.value?.isManualEntry!.value ?? false);
    weekendPricingModel.refresh();
  }

  void _calculateHourlyRate() {
    // Calculate hourly rate based on base fare and selected hours
    final baseFare = double.tryParse(
            weekendPricingModel.value?.baseFare!.value ?? "650.00") ??
        650.00;
    final hours = _extractHoursFromString(
        weekendPricingModel.value?.selectedHours!.value ?? "04 hours");

    final hourlyRate =
        (baseFare * 0.338).toStringAsFixed(2); // 220.00 for 4 hours
    final hourlyEarnings = (double.parse(hourlyRate) * 0.545)
        .toStringAsFixed(2); // Approximately 120.00

    weekendPricingModel.value?.hourlyRate!.value = hourlyRate;
    weekendPricingModel.value?.hourlyEarnings!.value = hourlyEarnings;
  }

  int _extractHoursFromString(String hoursText) {
    return int.tryParse(hoursText.split(' ')[0]) ?? 4;
  }

  void onNextPressed() {
    // Navigate to next screen or perform validation
    Get.snackbar('Success', 'Weekend pricing setup completed successfully',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Color(0xFF4CAF50),
        colorText: appTheme.whiteCustom);

    // Navigate to next screen (replace with actual route when available)
    // Get.toNamed(AppRoutes.nextScreen);
  }

  @override
  void onClose() {
    super.onClose();
  }
}
