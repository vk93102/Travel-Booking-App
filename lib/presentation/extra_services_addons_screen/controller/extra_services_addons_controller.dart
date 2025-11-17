import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../models/extra_services_addons_model.dart';

class ExtraServicesAddonsController extends GetxController {
  // Observable model
  final extraServicesAddonsModel = Rx<ExtraServicesAddonsModel?>(null);

  // Text editing controllers
  late TextEditingController airportPickupPriceController;
  late TextEditingController guidedToursPriceController;

  @override
  void onInit() {
    super.onInit();
    airportPickupPriceController = TextEditingController(text: '50.00');
    guidedToursPriceController = TextEditingController(text: '125.00');
    extraServicesAddonsModel.value = ExtraServicesAddonsModel();
  }

  @override
  void onClose() {
    airportPickupPriceController.dispose();
    guidedToursPriceController.dispose();
    super.onClose();
  }

  void toggleAirportPickup(bool value) {
    extraServicesAddonsModel.value?.isAirportPickupEnabled!.value = value;
    if (value) {
      extraServicesAddonsModel.value?.airportPickupPrice!.value =
          airportPickupPriceController.text;
    }
  }

  void toggleLunch(bool value) {
    extraServicesAddonsModel.value?.isLunchEnabled!.value = value;
  }

  void toggleGuidedTours(bool value) {
    extraServicesAddonsModel.value?.isGuidedToursEnabled!.value = value;
    if (value) {
      extraServicesAddonsModel.value?.guidedToursPrice!.value =
          guidedToursPriceController.text;
    }
  }

  void onNextButtonPressed() {
    // Update prices from text controllers
    if (extraServicesAddonsModel.value?.isAirportPickupEnabled!.value ??
        false) {
      extraServicesAddonsModel.value?.airportPickupPrice!.value =
          airportPickupPriceController.text;
    }

    if (extraServicesAddonsModel.value?.isGuidedToursEnabled!.value ?? false) {
      extraServicesAddonsModel.value?.guidedToursPrice!.value =
          guidedToursPriceController.text;
    }

    // Navigate to next screen (based on the flow, likely property photo upload)
    Get.toNamed(AppRoutes.propertyPhotoUploadScreen);
  }
}
