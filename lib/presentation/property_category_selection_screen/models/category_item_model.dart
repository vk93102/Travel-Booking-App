import 'package:get/get.dart';
import '../../../core/app_export.dart';

/// This class is used for category items in the grid.

class CategoryItemModel {
  Rx<String>? imagePath;
  Rx<String>? title;

  CategoryItemModel({this.imagePath, this.title}) {
    imagePath = imagePath ?? Rx("");
    title = title ?? Rx("");
  }
}
