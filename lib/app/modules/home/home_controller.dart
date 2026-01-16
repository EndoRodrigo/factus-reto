import 'package:get/get.dart';
import '../../data/models/product_model.dart';
import '../../data/services/product_service.dart';

class HomeController extends GetxController {
  final ProductService _service = ProductService();

  var products = <ProductModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadProducts();
  }

  void loadProducts() async {
    try {
      isLoading.value = true;
      products.value = (_service.getProducts()) as List<ProductModel>;
    } finally {
      isLoading.value = false;
    }
  }
}
