import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../core/app_export.dart';

/// This class is used in the [PropertyPhotoUploadScreen] screen with GetX.

class PropertyPhotoUploadModel {
  // Observable variables for reactive state management
  Rx<List<XFile>> selectedPhotos;
  RxBool isPhotosValid;
  RxInt photoCount;
  RxString uploadStatus;

  // Simple constructor with default values
  PropertyPhotoUploadModel({
    List<XFile>? selectedPhotos,
    bool? isPhotosValid,
    int? photoCount,
    String? uploadStatus,
  })  : selectedPhotos = Rx(selectedPhotos ?? []),
        isPhotosValid = (isPhotosValid ?? false)
            .obs, // Modified: Fixed RxBool initialization
        photoCount =
            (photoCount ?? 0).obs, // Modified: Fixed RxInt initialization
        uploadStatus =
            (uploadStatus ?? '').obs; // Modified: Fixed RxString initialization
}
