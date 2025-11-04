import 'package:get/get.dart';
import '../../../core/app_export.dart';

/// This class is used in the [PropertyCategorySelectionScreen] screen with GetX.

class PropertyCategorySelectionModel {
  Rx<String>? selectedCategory;

  PropertyCategorySelectionModel({this.selectedCategory}) {
    selectedCategory = selectedCategory ?? Rx("");
  }
}
