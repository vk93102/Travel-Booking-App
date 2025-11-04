import 'package:get/get.dart';
import '../../../core/app_export.dart';

/// This class is used in the [PropertyRegistrationScreen] screen with GetX.
class PropertyRegistrationModel {
  // Observable variables for reactive state management
  Rx<String>? licenseNumber;
  Rx<bool>? isLicenseValid;
  Rx<String>? errorMessage;

  // Simple constructor with no parameters
  PropertyRegistrationModel({
    this.licenseNumber,
    this.isLicenseValid,
    this.errorMessage,
  }) {
    licenseNumber = licenseNumber ?? Rx('');
    isLicenseValid = isLicenseValid ?? Rx(false);
    errorMessage = errorMessage ?? Rx('');
  }
}
