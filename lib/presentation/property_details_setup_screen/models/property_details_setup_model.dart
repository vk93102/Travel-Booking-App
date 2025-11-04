import 'package:get/get.dart';
import '../../../core/app_export.dart';

/// This class is used in the [PropertyDetailsSetupScreen] screen with GetX.

class PropertyDetailsSetupModel {
  // Observable variables for reactive state management
  Rx<String>? propertyName;
  Rx<String>? description;
  Rx<double>? starRating;
  Rx<String>? id;

  // Simple constructor with no parameters
  PropertyDetailsSetupModel({
    this.propertyName,
    this.description,
    this.starRating,
    this.id,
  }) {
    propertyName = propertyName ?? Rx("Serenity Luxe Villa - Palm Jumeirah");
    description = description ?? Rx("");
    starRating = starRating ?? Rx(4.0);
    id = id ?? Rx("");
  }
}
