import 'package:get/get.dart';

import '../admin/admin_controller.dart';

class AdminBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AdminController());
    Get.lazyPut(() => AdminProductController());
    Get.lazyPut(() => AdminOrderController());
  }
}
