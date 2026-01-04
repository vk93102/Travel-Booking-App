import 'package:get/get.dart';
import '../../../core/app_export.dart';

/// This class is used in the [CancellationPolicySelectionScreen] screen with GetX.

class CancellationPolicySelectionModel {
  // Observable variables for reactive state management
  Rx<String>? selectedPolicy;
  Rx<int>? selectedPolicyIndex;
  Rx<bool>? isLightPolicySelected;
  Rx<bool>? isMediumPolicySelected;
  Rx<bool>? isHardPolicySelected;

  // Constructor with default values
  CancellationPolicySelectionModel({
    this.selectedPolicy,
    this.selectedPolicyIndex,
    this.isLightPolicySelected,
    this.isMediumPolicySelected,
    this.isHardPolicySelected,
  }) {
    selectedPolicy =
        selectedPolicy ?? Rx("Light Cancellation Policy (Flexible)");
    selectedPolicyIndex = selectedPolicyIndex ?? Rx(0);
    isLightPolicySelected = isLightPolicySelected ?? Rx(true);
    isMediumPolicySelected = isMediumPolicySelected ?? Rx(false);
    isHardPolicySelected = isHardPolicySelected ?? Rx(false);
  }
}
