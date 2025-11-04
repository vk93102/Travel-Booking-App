import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../models/property_address_form_model.dart';

class PropertyAddressFormController extends GetxController {
  final formKey = GlobalKey<FormState>();

  // Text controllers
  late TextEditingController buildingNameController;
  late TextEditingController houseNumberController;
  late TextEditingController streetNameController;
  late TextEditingController areaController;
  late TextEditingController landmarkController;
  late TextEditingController cityController;
  late TextEditingController zipCodeController;

  // Observable variables
  final isLoading = false.obs;
  final isFormValid = false.obs;
  final propertyAddressFormModel = Rx<PropertyAddressFormModel?>(null);

  // Dropdown items
  final emiratesList = [
    'Dubai',
    'Abu Dhabi',
    'Sharjah',
    'Ajman',
    'Umm Al Quwain',
    'Ras Al Khaimah',
    'Fujairah'
  ];

  final countriesList = [
    'United Arab Emirates',
    'Saudi Arabia',
    'Kuwait',
    'Qatar',
    'Bahrain',
    'Oman'
  ];

  @override
  void onInit() {
    super.onInit();
    _initializeControllers();
    propertyAddressFormModel.value = PropertyAddressFormModel();

    // Set initial values
    propertyAddressFormModel.value?.selectedEmirate?.value = 'Dubai';
    propertyAddressFormModel.value?.selectedCountry?.value =
        'United Arab Emirates';
  }

  void _initializeControllers() {
    buildingNameController = TextEditingController(text: '18');
    houseNumberController = TextEditingController(text: 'Serenity Luxe Villa');
    streetNameController = TextEditingController(text: 'Street No: 07');
    areaController = TextEditingController(text: 'Al Barsha 1');
    landmarkController =
        TextEditingController(text: 'Behind Mall of the Emirates');
    cityController = TextEditingController(text: 'Dubai');
    zipCodeController = TextEditingController(text: '00000');
  }

  @override
  void onClose() {
    buildingNameController.dispose();
    houseNumberController.dispose();
    streetNameController.dispose();
    areaController.dispose();
    landmarkController.dispose();
    cityController.dispose();
    zipCodeController.dispose();
    super.onClose();
  }

  // Validation methods
  String? validateHouseNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'House/Villa/Flat number is required';
    }
    return null;
  }

  String? validateStreetName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Street name is required';
    }
    return null;
  }

  String? validateArea(String? value) {
    if (value == null || value.isEmpty) {
      return 'Area/Neighborhood is required';
    }
    return null;
  }

  String? validateCity(String? value) {
    if (value == null || value.isEmpty) {
      return 'City is required';
    }
    return null;
  }

  String? validateEmirate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select Emirates/State';
    }
    return null;
  }

  String? validateCountry(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select country';
    }
    return null;
  }

  // Event handlers
  void onBuildingNameChanged(String value) {
    propertyAddressFormModel.value?.buildingName?.value = value;
    _checkFormValidity();
  }

  void onHouseNumberChanged(String value) {
    propertyAddressFormModel.value?.houseNumber?.value = value;
    _checkFormValidity();
  }

  void onStreetNameChanged(String value) {
    propertyAddressFormModel.value?.streetName?.value = value;
    _checkFormValidity();
  }

  void onAreaChanged(String value) {
    propertyAddressFormModel.value?.area?.value = value;
    _checkFormValidity();
  }

  void onLandmarkChanged(String value) {
    propertyAddressFormModel.value?.landmark?.value = value;
    _checkFormValidity();
  }

  void onCityChanged(String value) {
    propertyAddressFormModel.value?.city?.value = value;
    _checkFormValidity();
  }

  void onEmirateChanged(String? value) {
    propertyAddressFormModel.value?.selectedEmirate?.value = value ?? '';
    _checkFormValidity();
  }

  void onCountryChanged(String? value) {
    propertyAddressFormModel.value?.selectedCountry?.value = value ?? '';
    _checkFormValidity();
  }

  void onZipCodeChanged(String value) {
    propertyAddressFormModel.value?.zipCode?.value = value;
    _checkFormValidity();
  }

  void _checkFormValidity() {
    isFormValid.value = formKey.currentState?.validate() ?? false;
  }

  void onNextPressed() async {
    if (formKey.currentState?.validate() ?? false) {
      isLoading.value = true;

      try {
        // Simulate API call
        await Future.delayed(Duration(seconds: 1));

        // Update model with current values
        _updateModelWithFormData();

        // Show success message
        Get.snackbar(
          'Success',
          'Address information saved successfully',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );

        // Clear form
        _clearForm();

        // Navigate to next screen
        Get.toNamed(AppRoutes.propertyDetailsSetupScreen);
      } catch (e) {
        Get.snackbar(
          'Error',
          'Failed to save address information',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      } finally {
        isLoading.value = false;
      }
    }
  }

  void _updateModelWithFormData() {
    propertyAddressFormModel.value?.buildingName?.value =
        buildingNameController.text;
    propertyAddressFormModel.value?.houseNumber?.value =
        houseNumberController.text;
    propertyAddressFormModel.value?.streetName?.value =
        streetNameController.text;
    propertyAddressFormModel.value?.area?.value = areaController.text;
    propertyAddressFormModel.value?.landmark?.value = landmarkController.text;
    propertyAddressFormModel.value?.city?.value = cityController.text;
    propertyAddressFormModel.value?.zipCode?.value = zipCodeController.text;
  }

  void _clearForm() {
    buildingNameController.clear();
    houseNumberController.clear();
    streetNameController.clear();
    areaController.clear();
    landmarkController.clear();
    cityController.clear();
    zipCodeController.clear();

    propertyAddressFormModel.value?.selectedEmirate?.value = '';
    propertyAddressFormModel.value?.selectedCountry?.value = '';
  }
}
