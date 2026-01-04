import 'package:get/get.dart';
import '../../../core/app_export.dart';

/// This class is used in the [IdentityVerificationSetupScreen] screen with GetX.
class IdentityVerificationSetupModel {
  Rx<bool>? isInformationVerificationSelected;
  Rx<bool>? isMobileVerificationSelected;
  Rx<String>? verificationStatus;

  IdentityVerificationSetupModel({
    this.isInformationVerificationSelected,
    this.isMobileVerificationSelected,
    this.verificationStatus,
  }) {
    isInformationVerificationSelected =
        isInformationVerificationSelected ?? Rx(false);
    isMobileVerificationSelected = isMobileVerificationSelected ?? Rx(false);
    verificationStatus = verificationStatus ?? Rx('pending');
  }
}
