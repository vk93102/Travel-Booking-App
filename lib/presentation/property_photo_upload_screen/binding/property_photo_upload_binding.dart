import 'package:get/get.dart';
import '../controller/property_photo_upload_controller.dart';
import '../../../core/app_export.dart';

class PropertyPhotoUploadBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PropertyPhotoUploadController>(
      () => PropertyPhotoUploadController(),
    );
  }
}
