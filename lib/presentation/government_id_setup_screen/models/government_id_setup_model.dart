import 'package:get/get.dart';
import '../../../core/app_export.dart';

/// This class is used in the [GovernmentIdSetupScreen] screen with GetX.

class GovernmentIdSetupModel {
  // Observable variables for reactive state management
  Rx<String>? country;
  Rx<String>? idType;

  // Simple constructor with no parameters
  GovernmentIdSetupModel({this.country, this.idType}) {
    country = country ?? Rx("United Arab Emirates");
    idType = idType ?? Rx("");
  }
}
