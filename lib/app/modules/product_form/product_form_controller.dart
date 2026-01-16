import 'package:get/get.dart';
import '../../data/services/product_service.dart';

class ProductFormController extends GetxController {
  final ProductService _service = ProductService();

  final name = ''.obs;
  final price = 0.0.obs;
  final imageUrl = ''.obs;

  void save() {
    _service.createProduct({
      'name': name.value,
      'price': price.value,
      'imageUrl': imageUrl.value,
      'isActive': true,
    });

    Get.back();
  }
}
