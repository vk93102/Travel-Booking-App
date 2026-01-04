import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../models/government_id_setup_model.dart';

class GovernmentIdSetupController extends GetxController {
  final governmentIdSetupModel = Rx<GovernmentIdSetupModel?>(null);

  // Observable variables for reactive state management
  final selectedCountry = ''.obs;
  final selectedIdType = ''.obs;

  // Available countries list
  final List<String> countries = [
    'United Arab Emirates',
    'Saudi Arabia',
    'Kuwait',
    'Qatar',
    'Bahrain',
    'Oman',
    'United States',
    'United Kingdom',
    'Canada',
    'Australia',
  ];

  @override
  void onInit() {
    super.onInit();
    governmentIdSetupModel.value = GovernmentIdSetupModel();
    // Set default selected country
    selectedCountry.value = 'United Arab Emirates';
  }

  void updateSelectedCountry(String country) {
    selectedCountry.value = country;
    governmentIdSetupModel.value?.country?.value = country;
  }

  void selectIdType(String idType) {
    selectedIdType.value = idType;
    governmentIdSetupModel.value?.idType?.value = idType;

    // Navigate based on selected ID type
    switch (idType) {
      case 'driving_license':
        Get.toNamed(AppRoutes.idDocumentFrontCaptureScreen);
        break;
      case 'passport':
        Get.toNamed(AppRoutes.idDocumentFrontCaptureScreen);
        break;
      case 'identity_card':
        Get.toNamed(AppRoutes.idDocumentFrontCaptureScreen);
        break;
    }
  }

  void proceedToNext() {
    if (selectedCountry.value.isEmpty) {
      Get.snackbar(
        'Missing Information',
        'Please select an issuing country/region',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Color(0xFFE57373),
        colorText: Color(0xFFFFFFFF),
      );
      return;
    }

    if (selectedIdType.value.isEmpty) {
      Get.snackbar(
        'Missing Information',
        'Please select an ID document type',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Color(0xFFE57373),
        colorText: Color(0xFFFFFFFF),
      );
      return;
    }

    // Navigate to ID document capture screen
    Get.toNamed(AppRoutes.idDocumentFrontCaptureScreen);
  }
}
