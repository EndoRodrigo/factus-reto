import 'package:get/get.dart';

class OrderDetailController extends GetxController {
  late Map<String, dynamic> order;

  @override
  void onInit() {
    order = Get.arguments;
    super.onInit();
  }
}
