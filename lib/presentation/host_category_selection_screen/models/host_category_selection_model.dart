import 'package:get/get.dart';
import '../../../core/app_export.dart';

class HostCategorySelectionModel {
  RxList<CategoryItemModel>? categoryList;

  HostCategorySelectionModel({this.categoryList}) {
    categoryList = categoryList ?? <CategoryItemModel>[].obs;
  }
}

class CategoryItemModel {
  Rx<String>? image;
  Rx<String>? title;
  Rx<bool>? isSelected;

  CategoryItemModel({
    this.image,
    this.title,
    this.isSelected,
  }) {
    image = image ?? Rx("");
    title = title ?? Rx("");
    isSelected = isSelected ?? Rx(false);
  }
}
