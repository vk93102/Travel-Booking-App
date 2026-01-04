import '../../../core/app_export.dart';
import '../models/cancellation_policy_selection_model.dart';

class CancellationPolicySelectionController extends GetxController {
  // Observable variables
  final selectedPolicyIndex = 0.obs;
  final isLoading = false.obs;

  // Model instance
  final cancellationPolicyModel = Rx<CancellationPolicySelectionModel?>(null);

  @override
  void onInit() {
    super.onInit();
    cancellationPolicyModel.value = CancellationPolicySelectionModel();
  }

  void selectPolicy(int index) {
    selectedPolicyIndex.value = index;

    // Update model with selected policy
    switch (index) {
      case 0:
        cancellationPolicyModel.value?.selectedPolicy!.value =
            'Light Cancellation Policy (Flexible)';
        break;
      case 1:
        cancellationPolicyModel.value?.selectedPolicy!.value =
            'Medium Cancellation Policy (Moderate)';
        break;
      case 2:
        cancellationPolicyModel.value?.selectedPolicy!.value =
            'Hard Cancellation Policy (Strict)';
        break;
    }
  }

  void onNextPressed() async {
    isLoading.value = true;

    // Simulate processing
    await Future.delayed(Duration(milliseconds: 500));

    isLoading.value = false;

    // Navigate to the next screen - Package Selection Screen
    Get.toNamed(AppRoutes.packageSelectionScreen);
  }

  String getSelectedPolicyTitle() {
    switch (selectedPolicyIndex.value) {
      case 0:
        return 'Light Cancellation Policy (Flexible)';
      case 1:
        return 'Medium Cancellation Policy (Moderate)';
      case 2:
        return 'Hard Cancellation Policy (Strict)';
      default:
        return 'Light Cancellation Policy (Flexible)';
    }
  }

  String getSelectedPolicyDescription() {
    switch (selectedPolicyIndex.value) {
      case 0:
        return 'Full refund for cancellations made up to 5 days before check-in. If cancelled less than 5 days before check-in, 50% refund. If cancelled after check-in, no refund for unused nights. Free date changes allowed up to 3 days before check-in (subject to availability).';
      case 1:
        return 'Full refund for cancellations made up to 14 days before check-in. If cancelled between 14 and 7 days before check-in, 50% refund. No refund if cancelled less than 7 days before check-in. One date change allowed if requested at least 10 days prior.';
      case 2:
        return '50% refund for cancellations made within 48 hours of booking and at least 30 days before check-in. No refund for cancellations made after 48 hours or less than 30 days before check-in. No changes or date modifications allowed after booking is confirmed.';
      default:
        return '';
    }
  }
}
