import '../../../core/app_export.dart';
import '../models/booking_preference_setup_model.dart';

class BookingPreferenceSetupController extends GetxController {
  final bookingPreferenceSetupModel = Rx<BookingPreferenceSetupModel?>(null);
  final selectedBookingType = 'instant'.obs;

  @override
  void onInit() {
    super.onInit();
    bookingPreferenceSetupModel.value = BookingPreferenceSetupModel();
  }

  void selectBookingType(String type) {
    selectedBookingType.value = type;
    bookingPreferenceSetupModel.value?.selectedType?.value = type;
  }

  void onNextPressed() {
    // Save booking preference selection
    print('Selected booking type: ${selectedBookingType.value}');

    // Navigate to next screen
    // Based on the app flow, this would typically go to the next setup screen
    Get.toNamed(AppRoutes.extraServicesAddonsScreen);
  }

  void onLearnMorePressed() {
    // Handle learn more link tap
    print('Learn more pressed');
    // Could open a dialog or navigate to information screen
  }
}
