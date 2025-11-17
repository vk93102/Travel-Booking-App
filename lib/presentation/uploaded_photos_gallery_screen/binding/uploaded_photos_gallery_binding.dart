import 'package:get/get.dart';
import '../controller/uploaded_photos_gallery_controller.dart';
import '../../../core/app_export.dart';

class UploadedPhotosGalleryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UploadedPhotosGalleryController());
  }
}
