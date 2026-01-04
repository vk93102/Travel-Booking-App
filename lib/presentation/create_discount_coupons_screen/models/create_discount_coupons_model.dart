import 'package:get/get.dart';

import '../../../core/app_export.dart';
import './discount_item_model.dart';

/// This class is used in the [CreateDiscountCouponsScreen] screen with GetX.
class CreateDiscountCouponsModel {
  RxList<DiscountItemModel>? discountItems;
  Rx<bool>? hasSelectedItems;

  CreateDiscountCouponsModel({
    this.discountItems,
    this.hasSelectedItems,
  }) {
    discountItems = discountItems ?? RxList<DiscountItemModel>([]);
    hasSelectedItems = hasSelectedItems ?? Rx<bool>(false);
  }
}
