import 'package:get/get.dart';
import '../../../core/app_export.dart';

/// This class is used in the [PackageSelectionScreen] screen with GetX.
class PackageSelectionModel {
  RxList<PackageItemModel> packages = <PackageItemModel>[].obs;

  PackageSelectionModel();
}

class PackageItemModel {
  Rx<String>? title;
  Rx<String>? price;
  Rx<bool>? isSelected;

  PackageItemModel({
    this.title,
    this.price,
    this.isSelected,
  }) {
    title = title ?? Rx("");
    price = price ?? Rx("");
    isSelected = isSelected ?? Rx(false);
  }
}
