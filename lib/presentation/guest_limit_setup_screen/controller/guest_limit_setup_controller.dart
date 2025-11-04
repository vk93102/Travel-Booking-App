import '../../../core/app_export.dart';
import '../models/guest_limit_setup_model.dart';

class GuestLimitSetupController extends GetxController {
  // Observable variables for reactive state management
  final guestsCount = 6.obs;
  final bedroomsCount = 2.obs;
  final bedCount = 4.obs;
  final bathroomsCount = 2.obs;
  final isPetsAllowed = false.obs;

  // Model instance
  final guestLimitSetupModel = Rx<GuestLimitSetupModel?>(null);

  @override
  void onInit() {
    super.onInit();
    guestLimitSetupModel.value = GuestLimitSetupModel(
      guests: guestsCount.value.obs,
      bedrooms: bedroomsCount.value.obs,
      beds: bedCount.value.obs,
      bathrooms: bathroomsCount.value.obs,
      petsAllowed: isPetsAllowed.value.obs,
    );
  }

  void incrementCount(RxInt count) {
    if (count.value < 99) {
      count.value++;
      _updateModel();
    }
  }

  void decrementCount(RxInt count) {
    if (count.value > 0) {
      count.value--;
      _updateModel();
    }
  }

  void togglePets(bool value) {
    isPetsAllowed.value = value;
    _updateModel();
  }

  void _updateModel() {
    guestLimitSetupModel.value?.guests?.value = guestsCount.value;
    guestLimitSetupModel.value?.bedrooms?.value = bedroomsCount.value;
    guestLimitSetupModel.value?.beds?.value = bedCount.value;
    guestLimitSetupModel.value?.bathrooms?.value = bathroomsCount.value;
    guestLimitSetupModel.value?.petsAllowed?.value = isPetsAllowed.value;
  }

  void onNextPressed() {
    // Navigate to property registration screen based on the next logical flow
    Get.toNamed(AppRoutes.propertyRegistrationScreen);
  }

  @override
  void onClose() {
    super.onClose();
  }
}
