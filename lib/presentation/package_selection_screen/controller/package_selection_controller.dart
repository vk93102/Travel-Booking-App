import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../models/package_selection_model.dart';

class PackageSelectionController extends GetxController {
  // Observable variables
  final selectedPackageIndex = 0.obs;
  final packageSelectionModel = Rx<PackageSelectionModel?>(null);

  @override
  void onInit() {
    super.onInit();
    packageSelectionModel.value = PackageSelectionModel();
    initializePackages();
  }

  void initializePackages() {
    packageSelectionModel.value?.packages.addAll([
      PackageItemModel(
          title: "Free Listing".obs,
          price: "0.00 AED".obs,
          isSelected: true.obs),
      PackageItemModel(
          title: "Free Listing & Media services".obs,
          price: "100.00 AED".obs,
          isSelected: false.obs),
      PackageItemModel(
          title: "Free Listing, Media services & Featured placement".obs,
          price: "200.00 AED".obs,
          isSelected: false.obs),
    ]);
  }

  void selectPackage(int index) {
    selectedPackageIndex.value = index;

    // Update all packages to unselected
    for (int i = 0;
        i < (packageSelectionModel.value?.packages.length ?? 0);
        i++) {
      packageSelectionModel.value?.packages[i].isSelected!.value = false;
    }

    // Select the chosen package
    if (index < (packageSelectionModel.value?.packages.length ?? 0)) {
      packageSelectionModel.value?.packages[index].isSelected!.value = true;
    }
  }

  void onNextPressed() {
    // Navigate to next screen or perform action based on selected package
    Get.snackbar('Package Selected',
        'You have selected: ${packageSelectionModel.value?.packages[selectedPackageIndex.value].title!.value ?? ""}',
        backgroundColor: Color(0xFF260F06),
        colorText: appTheme.whiteCustom,
        duration: Duration(seconds: 2));

    // Navigate to next screen based on AppRoutes
    // Get.toNamed(AppRoutes.nextScreenRoute);
  }
}
