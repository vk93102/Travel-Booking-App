import 'package:get/get.dart';
import '../controller/create_discount_coupons_controller.dart';
import '../../../core/app_export.dart';

class CreateDiscountCouponsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateDiscountCouponsController());
  }
}
