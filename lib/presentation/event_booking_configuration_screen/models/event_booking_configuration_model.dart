import 'package:get/get.dart';
import '../../../core/app_export.dart';

/// This class is used in the [EventBookingConfigurationScreen] screen with GetX.

class EventBookingConfigurationModel {
  // Event type selections
  Rx<bool>? isWeddingSelected;
  Rx<bool>? isBirthdayPartySelected;
  Rx<bool>? isCorporateEventSelected;
  Rx<bool>? isOtherSelected;
  Rx<String>? otherEventType;

  // Form fields
  Rx<String>? maxGuestCapacity;
  Rx<String>? eventBookingPrice;
  Rx<String>? securityDeposit;

  // Notification settings
  Rx<bool>? getEventNotifications;

  // Cancellation policy selections
  Rx<bool>? isLightPolicySelected;
  Rx<bool>? isMediumPolicySelected;
  Rx<bool>? isHardPolicySelected;

  EventBookingConfigurationModel({
    this.isWeddingSelected,
    this.isBirthdayPartySelected,
    this.isCorporateEventSelected,
    this.isOtherSelected,
    this.otherEventType,
    this.maxGuestCapacity,
    this.eventBookingPrice,
    this.securityDeposit,
    this.getEventNotifications,
    this.isLightPolicySelected,
    this.isMediumPolicySelected,
    this.isHardPolicySelected,
  }) {
    isWeddingSelected = isWeddingSelected ?? Rx(false);
    isBirthdayPartySelected = isBirthdayPartySelected ?? Rx(false);
    isCorporateEventSelected = isCorporateEventSelected ?? Rx(false);
    isOtherSelected = isOtherSelected ?? Rx(false);
    otherEventType = otherEventType ?? Rx("");
    maxGuestCapacity = maxGuestCapacity ?? Rx("");
    eventBookingPrice = eventBookingPrice ?? Rx("");
    securityDeposit = securityDeposit ?? Rx("");
    getEventNotifications = getEventNotifications ?? Rx(false);
    isLightPolicySelected =
        isLightPolicySelected ?? Rx(true); // Default selected
    isMediumPolicySelected = isMediumPolicySelected ?? Rx(false);
    isHardPolicySelected = isHardPolicySelected ?? Rx(false);
  }
}
