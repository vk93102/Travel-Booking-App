import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../models/property_registration_model.dart';

class PropertyRegistrationController extends GetxController {
  // Form key for validation
  final formKey = GlobalKey<FormState>();

  // Text controllers
  late TextEditingController licenseController;

  // Observable variables
  final isLoading = false.obs;
  final isFormValid = false.obs;
  final propertyRegistrationModel = Rx<PropertyRegistrationModel?>(null);

  @override
  void onInit() {
    super.onInit();
    licenseController = TextEditingController();
    propertyRegistrationModel.value = PropertyRegistrationModel();
  }

  @override
  void onClose() {
    licenseController.dispose();
    super.onClose();
  }

  /// Validates the license number input
  String? validateLicenseNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter property license number';
    }
    if (value.length < 5) {
      return 'License number must be at least 5 digits';
    }
    return null;
  }

  /// Called when license number text changes
  void onLicenseNumberChanged(String value) {
    propertyRegistrationModel.value?.licenseNumber?.value = value;
    _validateForm();
  }

  /// Validates the entire form
  void _validateForm() {
    isFormValid.value =
        licenseController.text.isNotEmpty && licenseController.text.length >= 5;
  }

  /// Handles Get Property License button press
  void onGetPropertyLicense() {
    // TODO: Implement navigation to property license registration
    Get.snackbar(
      'Info',
      'Redirecting to property license registration...',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Color(0xFF7C412E),
      colorText: appTheme.whiteCustom,
    );
  }

  /// Handles Next button press
  void onNextPressed() {
    if (formKey.currentState?.validate() ?? false) {
      isLoading.value = true;

      // Save form data
      propertyRegistrationModel.value?.licenseNumber?.value =
          licenseController.text;

      // Simulate API call
      Future.delayed(Duration(seconds: 1), () {
        isLoading.value = false;

        // Navigate to next screen
        Get.toNamed(AppRoutes.propertyDetailsSetupScreen);

        // Show success message
        Get.snackbar(
          'Success',
          'Property license number saved successfully',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: appTheme.greenCustom,
          colorText: appTheme.whiteCustom,
        );

        // Clear form
        _clearForm();
      });
    }
  }

  /// Clears the form data
  void _clearForm() {
    licenseController.clear();
    propertyRegistrationModel.value?.licenseNumber?.value = '';
    isFormValid.value = false;
  }
}
