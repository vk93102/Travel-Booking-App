import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../models/amenity_item_model.dart';
import '../models/property_amenities_selection_model.dart';

class PropertyAmenitiesSelectionController extends GetxController {
  final propertyAmenitiesSelectionModel =
      Rx<PropertyAmenitiesSelectionModel?>(null);

  RxList<AmenityItemModel> essentialAmenities = <AmenityItemModel>[].obs;
  RxList<AmenityItemModel> standoutAmenities = <AmenityItemModel>[].obs;
  RxList<AmenityItemModel> safetyItems = <AmenityItemModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    propertyAmenitiesSelectionModel.value = PropertyAmenitiesSelectionModel();
    _initializeAmenities();
  }

  void _initializeAmenities() {
    // Essential Amenities
    essentialAmenities.addAll([
      AmenityItemModel(
        name: 'Wi-Fi'.obs,
        imagePath: ImageConstant.imgRectangle39608.obs,
        isSelected: false.obs,
      ),
      AmenityItemModel(
        name: 'TV'.obs,
        imagePath: ImageConstant.imgRectangle39598.obs,
        isSelected: false.obs,
      ),
      AmenityItemModel(
        name: 'Air\nConditioning'.obs,
        imagePath: ImageConstant.imgRectangle39610.obs,
        isSelected: false.obs,
      ),
      AmenityItemModel(
        name: 'Washing\nMachine'.obs,
        imagePath: ImageConstant.imgRectangle39612.obs,
        isSelected: false.obs,
      ),
      AmenityItemModel(
        name: 'Kitchen'.obs,
        imagePath: ImageConstant.imgRectangle39611.obs,
        isSelected: false.obs,
      ),
      AmenityItemModel(
        name: 'Free parking'.obs,
        imagePath: ImageConstant.imgRectangle3958276x86.obs,
        isSelected: false.obs,
      ),
    ]);

    // Standout Amenities
    standoutAmenities.addAll([
      AmenityItemModel(
        name: 'Pool'.obs,
        imagePath: ImageConstant.imgRectangle39626.obs,
        isSelected: false.obs,
      ),
      AmenityItemModel(
        name: 'Hot Tub'.obs,
        imagePath: ImageConstant.imgRectangle39627.obs,
        isSelected: false.obs,
      ),
      AmenityItemModel(
        name: 'Jacuzzi'.obs,
        imagePath: ImageConstant.imgRectangle39628.obs,
        isSelected: false.obs,
      ),
      AmenityItemModel(
        name: 'Gym'.obs,
        imagePath: ImageConstant.imgRectangle39629.obs,
        isSelected: false.obs,
      ),
      AmenityItemModel(
        name: 'Outdoor\nDining Area'.obs,
        imagePath: ImageConstant.imgRectangle39630.obs,
        isSelected: false.obs,
      ),
      AmenityItemModel(
        name: 'Pool Table'.obs,
        imagePath: ImageConstant.imgRectangle39631.obs,
        isSelected: false.obs,
      ),
      AmenityItemModel(
        name: 'Beach\nAccess'.obs,
        imagePath: ImageConstant.imgRectangle39596.obs,
        isSelected: false.obs,
      ),
      AmenityItemModel(
        name: 'Lake Access'.obs,
        imagePath: ImageConstant.imgRectangle39638.obs,
        isSelected: false.obs,
      ),
      AmenityItemModel(
        name: 'Golf Court Access'.obs,
        imagePath: ImageConstant.imgRectangle39637.obs,
        isSelected: false.obs,
      ),
    ]);

    // Safety Items
    safetyItems.addAll([
      AmenityItemModel(
        name: 'Smoke\nAlarm'.obs,
        imagePath: ImageConstant.imgRectangle39645.obs,
        isSelected: false.obs,
      ),
      AmenityItemModel(
        name: 'First\nAid Kit'.obs,
        imagePath: ImageConstant.imgRectangle39646.obs,
        isSelected: false.obs,
      ),
      AmenityItemModel(
        name: 'Chemical\nAlarm'.obs,
        imagePath: ImageConstant.imgRectangle39647.obs,
        isSelected: false.obs,
      ),
    ]);
  }

  void toggleAmenitySelection(AmenityItemModel amenity) {
    amenity.isSelected.value = !amenity.isSelected.value;
    update();
  }

  List<AmenityItemModel> getSelectedAmenities() {
    List<AmenityItemModel> selected = [];
    selected.addAll(
        essentialAmenities.where((amenity) => amenity.isSelected.value));
    selected
        .addAll(standoutAmenities.where((amenity) => amenity.isSelected.value));
    selected.addAll(safetyItems.where((amenity) => amenity.isSelected.value));
    return selected;
  }

  void onNextPressed() {
    final selectedAmenities = getSelectedAmenities();

    if (selectedAmenities.isEmpty) {
      Get.snackbar(
        'Selection Required',
        'Please select at least one amenity to continue',
        backgroundColor: Color(0xFFE57373),
        colorText: appTheme.whiteCustom,
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    // Show success message
    Get.snackbar(
      'Amenities Selected',
      '${selectedAmenities.length} amenities selected successfully',
      backgroundColor: Color(0xFF4CAF50),
      colorText: appTheme.whiteCustom,
      snackPosition: SnackPosition.BOTTOM,
    );

    // Navigate to next screen (Property Photo Upload Screen)
    Get.toNamed(AppRoutes.propertyPhotoUploadScreen);
  }
}
