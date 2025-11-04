import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../models/category_item_model.dart';
import '../models/property_category_selection_model.dart';

class PropertyCategorySelectionController extends GetxController {
  Rx<PropertyCategorySelectionModel> propertyCategorySelectionModelObj =
      PropertyCategorySelectionModel().obs;

  RxList<CategoryItemModel> categoryList = <CategoryItemModel>[].obs;
  RxInt selectedCategoryIndex = (-1).obs;

  @override
  void onInit() {
    super.onInit();
    _initializeCategoryList();
  }

  void _initializeCategoryList() {
    categoryList.value = [
      CategoryItemModel(
        imagePath: ImageConstant.imgRectangle39579.obs,
        title: 'Home'.obs,
      ),
      CategoryItemModel(
        imagePath: ImageConstant.imgRectangle39582.obs,
        title: 'Resorts'.obs,
      ),
      CategoryItemModel(
        imagePath: ImageConstant.imgRectangle39581.obs,
        title: 'Hotels'.obs,
      ),
      CategoryItemModel(
        imagePath: ImageConstant.imgRectangle39580.obs,
        title: 'Villas'.obs,
      ),
    ];
  }

  void onCategorySelected(int index) {
    selectedCategoryIndex.value = index;
    propertyCategorySelectionModelObj.value.selectedCategory?.value =
        categoryList[index].title?.value ?? "";
  }

  void onNextPressed() {
    if (selectedCategoryIndex.value == -1) {
      Get.snackbar(
        'Selection Required',
        'Please select a property category to continue',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Color(0xFFE57373),
        colorText: Colors.white,
      );
      return;
    }

    // Navigate to the next screen based on the flow
    Get.toNamed(AppRoutes.propertyDetailsSetupScreen);
  }
}
