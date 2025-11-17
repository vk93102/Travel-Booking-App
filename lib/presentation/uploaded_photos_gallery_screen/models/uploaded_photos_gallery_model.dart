import '../../../core/app_export.dart';

/// This class is used in the [UploadedPhotosGalleryScreen] screen with GetX.
class UploadedPhotosGalleryModel {
  Rx<String>? mainPhoto;
  Rx<String>? photo1;
  Rx<String>? photo2;
  Rx<int>? photoCount;

  UploadedPhotosGalleryModel({
    this.mainPhoto,
    this.photo1,
    this.photo2,
    this.photoCount,
  }) {
    mainPhoto = mainPhoto ?? Rx(ImageConstant.imgRectangle39575);
    photo1 = photo1 ?? Rx(ImageConstant.imgRectangle39575188x174);
    photo2 = photo2 ?? Rx(ImageConstant.imgRectangle395751);
    photoCount = photoCount ?? Rx(3);
  }
}
