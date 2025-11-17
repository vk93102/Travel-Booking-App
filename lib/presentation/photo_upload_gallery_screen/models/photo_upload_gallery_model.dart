import 'package:get/get.dart';
import '../../../core/app_export.dart';

/// This class is used in the [PhotoUploadGalleryScreen] screen with GetX.

class PhotoUploadGalleryModel {
  // Observable variables for reactive state management
  Rx<String>? headerTitle;
  Rx<String>? photoCountText;
  Rx<bool>? isPhotosLoaded;
  RxList<String>? photosList;

  // Simple constructor with no parameters
  PhotoUploadGalleryModel({
    this.headerTitle,
    this.photoCountText,
    this.isPhotosLoaded,
    this.photosList,
  }) {
    headerTitle = headerTitle ?? Rx("Uploaded photos");
    photoCountText = photoCountText ?? Rx("3 photos uploaded");
    isPhotosLoaded = isPhotosLoaded ?? Rx(true);
    photosList = photosList ?? RxList<String>([]);
  }
}
