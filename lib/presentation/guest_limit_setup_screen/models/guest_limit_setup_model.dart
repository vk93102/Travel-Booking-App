import 'package:get/get.dart';
import '../../../core/app_export.dart';

/// This class is used in the [GuestLimitSetupScreen] screen with GetX.

class GuestLimitSetupModel {
  // Observable variables for reactive state management
  Rx<int>? guests;
  Rx<int>? bedrooms;
  Rx<int>? beds;
  Rx<int>? bathrooms;
  Rx<bool>? petsAllowed;

  // Simple constructor with default values
  GuestLimitSetupModel({
    this.guests,
    this.bedrooms,
    this.beds,
    this.bathrooms,
    this.petsAllowed,
  }) {
    guests = guests ?? Rx(6);
    bedrooms = bedrooms ?? Rx(2);
    beds = beds ?? Rx(4);
    bathrooms = bathrooms ?? Rx(2);
    petsAllowed = petsAllowed ?? Rx(false);
  }
}
