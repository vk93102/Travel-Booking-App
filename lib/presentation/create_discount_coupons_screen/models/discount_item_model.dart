import 'package:get/get.dart';
import '../../../core/app_export.dart';

/// This class represents a discount item in the discount selection list.
class DiscountItemModel {
  Rx<String> percentage;
  Rx<String> title;
  Rx<String> description;
  Rx<bool> isSelected;

  DiscountItemModel({
    required this.percentage,
    required this.title,
    required this.description,
    required this.isSelected,
  });
}
