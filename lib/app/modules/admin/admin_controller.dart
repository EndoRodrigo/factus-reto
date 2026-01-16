import 'package:get/get.dart';
import '../../data/services/product_service.dart';

class AdminController extends GetxController {
  final ProductService _service = ProductService();

  Stream get products => _service.getProducts();

  void deleteProduct(String id) {
    _service.deleteProduct(id);
  }
}
