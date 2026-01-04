import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../models/property_details_setup_model.dart';

class PropertyDetailsSetupController extends GetxController {
  // Form key for validation
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Text controllers
  late TextEditingController propertyNameController;
  late TextEditingController descriptionController;

  // Observable variables
  final starRating = 4.0.obs;
  final isFormValid = false.obs;
  final isLoading = false.obs;

  // Model
  final propertyDetailsModel = Rx<PropertyDetailsSetupModel?>(null);

  @override
  void onInit() {
    super.onInit();
    propertyNameController = TextEditingController();
    descriptionController = TextEditingController();
    propertyDetailsModel.value = PropertyDetailsSetupModel();

    // Set initial values
    propertyNameController.text = 'Serenity Luxe Villa - Palm Jumeirah';

    // Validate form initially
    _validateForm();
  }

  @override
  void onClose() {
    propertyNameController.dispose();
    descriptionController.dispose();
    super.onClose();
  }

  // Validation methods
  String? validatePropertyName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Property name is required';
    }
    if (value.trim().length < 3) {
      return 'Property name must be at least 3 characters';
    }
    return null;
  }

  String? validateDescription(String? value) {
    if (value != null && value.trim().length > 200) {
      return 'Description cannot exceed 200 characters';
    }
    return null;
  }

  // Event handlers
  void onPropertyNameChanged(String value) {
    propertyDetailsModel.value?.propertyName?.value = value;
    _validateForm();
  }

  void onDescriptionChanged(String value) {
    propertyDetailsModel.value?.description?.value = value;
    _validateForm();
  }

  void updateStarRating(double rating) {
    starRating.value = rating;
    propertyDetailsModel.value?.starRating?.value = rating;
    _validateForm();
  }

  void onNextPressed() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    isLoading.value = true;

    // Save form data
    propertyDetailsModel.value?.propertyName?.value =
        propertyNameController.text;
    propertyDetailsModel.value?.description?.value = descriptionController.text;
    propertyDetailsModel.value?.starRating?.value = starRating.value;

    // Simulate API call
    await Future.delayed(Duration(milliseconds: 500));

    isLoading.value = false;

    // Show success message
    Get.snackbar(
      'Success',
      'Property details saved successfully',
      backgroundColor: appTheme.greenCustom,
      colorText: appTheme.whiteCustom,
      snackPosition: SnackPosition.TOP,
    );

    // Clear form
    _clearForm();

    // Navigate to next screen (Guest Limit Setup)
    Get.toNamed(AppRoutes.guestLimitSetupScreen);
  }

  // Private methods
  void _validateForm() {
    bool isValid = validatePropertyName(propertyNameController.text) == null &&
        validateDescription(descriptionController.text) == null &&
        propertyNameController.text.trim().isNotEmpty;

    isFormValid.value = isValid;
  }

  void _clearForm() {
    propertyNameController.clear();
    descriptionController.clear();
    starRating.value = 1.0;
    propertyDetailsModel.value = PropertyDetailsSetupModel();
  }
}
