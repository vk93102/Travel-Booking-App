import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/app_export.dart';
import '../models/create_discount_coupons_model.dart';
import '../models/discount_item_model.dart';

class CreateDiscountCouponsController extends GetxController {
  CreateDiscountCouponsModel createDiscountCouponsModelObj =
      CreateDiscountCouponsModel();

  RxList<DiscountItemModel> discountItems = <DiscountItemModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    _initializeDiscountItems();
  }

  void _initializeDiscountItems() {
    discountItems.value = [
      DiscountItemModel(
        percentage: '20%'.obs,
        title: 'New listing promotion'.obs,
        description: 'Get 20% off on your first booking'.obs,
        isSelected: false.obs,
      ),
      DiscountItemModel(
        percentage: '06%'.obs,
        title: 'New listing promotion'.obs,
        description: 'Get 20% off on your first booking'.obs,
        isSelected: false.obs,
      ),
      DiscountItemModel(
        percentage: '10%'.obs,
        title: 'New listing promotion'.obs,
        description: 'Get 20% off on your first booking'.obs,
        isSelected: false.obs,
      ),
      DiscountItemModel(
        percentage: '18%'.obs,
        title: 'New listing promotion'.obs,
        description: 'Get 20% off on your first booking'.obs,
        isSelected: false.obs,
      ),
    ];
  }

  void onDiscountItemSelected(int index, bool isSelected) {
    if (index >= 0 && index < discountItems.length) {
      discountItems[index].isSelected.value = isSelected;
    }
  }

  void onNextPressed() {
    // Get selected discounts
    List<DiscountItemModel> selectedDiscounts =
        discountItems.where((item) => item.isSelected.value).toList();

    if (selectedDiscounts.isEmpty) {
      Get.snackbar(
        'Selection Required',
        'Please select at least one discount option to continue.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Color(0xFFF44336),
        colorText: Color(0xFFFFFFFF),
        duration: Duration(seconds: 3),
      );
      return;
    }

    // Show success message
    Get.snackbar(
      'Success',
      '${selectedDiscounts.length} discount(s) selected successfully!',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Color(0xFF4CAF50),
      colorText: Color(0xFFFFFFFF),
      duration: Duration(seconds: 2),
    );

    // Navigate to next screen (example navigation)
    // Get.toNamed(AppRoutes.nextScreen);
  }

  bool get hasSelectedItems {
    return discountItems.any((item) => item.isSelected.value);
  }

  List<DiscountItemModel> get selectedDiscounts {
    return discountItems.where((item) => item.isSelected.value).toList();
  }
}
