import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../models/event_booking_configuration_model.dart';

class EventBookingConfigurationController extends GetxController {
  // Observable model
  final eventBookingConfigurationModel =
      Rx<EventBookingConfigurationModel?>(null);

  // Form controllers
  late TextEditingController otherEventTypeController;
  late TextEditingController maxGuestCapacityController;
  late TextEditingController eventBookingPriceController;
  late TextEditingController securityDepositController;

  // Form key for validation
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    _initializeControllers();
    eventBookingConfigurationModel.value = EventBookingConfigurationModel();
  }

  @override
  void onClose() {
    _disposeControllers();
    super.onClose();
  }

  void _initializeControllers() {
    otherEventTypeController = TextEditingController();
    maxGuestCapacityController = TextEditingController(text: '50');
    eventBookingPriceController = TextEditingController(text: '500.00');
    securityDepositController = TextEditingController(text: '150.00');
  }

  void _disposeControllers() {
    otherEventTypeController.dispose();
    maxGuestCapacityController.dispose();
    eventBookingPriceController.dispose();
    securityDepositController.dispose();
  }

  // Event type selection methods
  void onWeddingChanged(bool? value) {
    eventBookingConfigurationModel.value?.isWeddingSelected!.value =
        value ?? false;
  }

  void onBirthdayPartyChanged(bool? value) {
    eventBookingConfigurationModel.value?.isBirthdayPartySelected!.value =
        value ?? false;
  }

  void onCorporateEventChanged(bool? value) {
    eventBookingConfigurationModel.value?.isCorporateEventSelected!.value =
        value ?? false;
  }

  void onOtherChanged(bool? value) {
    eventBookingConfigurationModel.value?.isOtherSelected!.value =
        value ?? false;
  }

  // Notification toggle
  void onEventNotificationsChanged(bool? value) {
    eventBookingConfigurationModel.value?.getEventNotifications!.value =
        value ?? false;
  }

  // Cancellation policy selection methods
  void onMediumPolicyChanged(bool? value) {
    if (value ?? false) {
      eventBookingConfigurationModel.value?.isLightPolicySelected!.value =
          false;
      eventBookingConfigurationModel.value?.isMediumPolicySelected!.value =
          true;
      eventBookingConfigurationModel.value?.isHardPolicySelected!.value = false;
    }
  }

  void onHardPolicyChanged(bool? value) {
    if (value ?? false) {
      eventBookingConfigurationModel.value?.isLightPolicySelected!.value =
          false;
      eventBookingConfigurationModel.value?.isMediumPolicySelected!.value =
          false;
      eventBookingConfigurationModel.value?.isHardPolicySelected!.value = true;
    }
  }

  // Validation methods
  String? validateMaxGuestCapacity(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter maximum guest capacity';
    }
    final number = int.tryParse(value);
    if (number == null || number <= 0) {
      return 'Please enter a valid number';
    }
    return null;
  }

  String? validateEventBookingPrice(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter event booking price';
    }
    final price = double.tryParse(value);
    if (price == null || price <= 0) {
      return 'Please enter a valid price';
    }
    return null;
  }

  // Form submission
  void onNextPressed() {
    if (_validateForm()) {
      _saveFormData();

      // Navigate to next screen - checking if any route exists for next step
      // Since no specific navigateTo is provided, we'll navigate to the next logical screen
      // Based on the app flow, this could be pricing setup or confirmation
      Get.toNamed(AppRoutes.weekdayPricingSetupScreen);
    }
  }

  bool _validateForm() {
    // Check if at least one event type is selected
    bool eventTypeSelected = (eventBookingConfigurationModel
                .value?.isWeddingSelected!.value ??
            false) ||
        (eventBookingConfigurationModel.value?.isBirthdayPartySelected!.value ??
            false) ||
        (eventBookingConfigurationModel
                .value?.isCorporateEventSelected!.value ??
            false) ||
        (eventBookingConfigurationModel.value?.isOtherSelected!.value ?? false);

    if (!eventTypeSelected) {
      Get.snackbar('Validation Error', 'Please select at least one event type',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: appTheme.redCustom,
          colorText: appTheme.whiteCustom);
      return false;
    }

    // Validate required fields
    if (maxGuestCapacityController.text.isEmpty) {
      Get.snackbar('Validation Error', 'Please enter maximum guest capacity',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: appTheme.redCustom,
          colorText: appTheme.whiteCustom);
      return false;
    }

    if (eventBookingPriceController.text.isEmpty) {
      Get.snackbar('Validation Error', 'Please enter event booking price',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: appTheme.redCustom,
          colorText: appTheme.whiteCustom);
      return false;
    }

    return true;
  }

  void _saveFormData() {
    // Save form data to model
    eventBookingConfigurationModel.value?.maxGuestCapacity!.value =
        maxGuestCapacityController.text;
    eventBookingConfigurationModel.value?.eventBookingPrice!.value =
        eventBookingPriceController.text;
    eventBookingConfigurationModel.value?.securityDeposit!.value =
        securityDepositController.text;
    eventBookingConfigurationModel.value?.otherEventType!.value =
        otherEventTypeController.text;

    // Show success message
    Get.snackbar('Success', 'Event booking configuration saved successfully',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: appTheme.greenCustom,
        colorText: appTheme.whiteCustom);

    // Clear form fields
    _clearFormFields();
  }

  void _clearFormFields() {
    otherEventTypeController.clear();
    maxGuestCapacityController.clear();
    eventBookingPriceController.clear();
    securityDepositController.clear();

    // Reset selections
    eventBookingConfigurationModel.value?.isWeddingSelected!.value = false;
    eventBookingConfigurationModel.value?.isBirthdayPartySelected!.value =
        false;
    eventBookingConfigurationModel.value?.isCorporateEventSelected!.value =
        false;
    eventBookingConfigurationModel.value?.isOtherSelected!.value = false;
    eventBookingConfigurationModel.value?.getEventNotifications!.value = false;
    eventBookingConfigurationModel.value?.isLightPolicySelected!.value = true;
    eventBookingConfigurationModel.value?.isMediumPolicySelected!.value = false;
    eventBookingConfigurationModel.value?.isHardPolicySelected!.value = false;
  }
}
