import 'package:get/get.dart';
import '../../../core/app_export.dart';

/// This class represents an individual amenity item.

class AmenityItemModel {
  Rx<String> name;
  Rx<String> imagePath;
  Rx<bool> isSelected;

  AmenityItemModel({
    required this.name,
    required this.imagePath,
    required this.isSelected,
  });
}
