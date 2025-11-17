import 'package:get/get.dart';
import '../controller/photo_upload_gallery_controller.dart';
import '../../../core/app_export.dart';

class PhotoUploadGalleryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PhotoUploadGalleryController());
  }
}
