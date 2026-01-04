import 'package:get/get.dart';
import '../../../core/app_export.dart';

/// This class is used in the [BaytAiSetupScreen] screen with GetX.

class BaytAiSetupModel {
  // Observable variables for reactive state management
  Rx<bool>? isPricingEngineEnabled;

  // Simple constructor
  BaytAiSetupModel({this.isPricingEngineEnabled}) {
    isPricingEngineEnabled = isPricingEngineEnabled ?? Rx(true);
  }
}
