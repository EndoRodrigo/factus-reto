import 'package:get/get.dart';
import '../../../data/models/product_model.dart';
import '../../../core/utils/product_service.dart';

class HomeController extends GetxController {
  final ProductService _service = ProductService();

  var products = <ProductModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadProducts();
  }

  void loadProducts() {
    isLoading.value = true;
    _service.getProducts().listen((snapshot) {
      products.value = snapshot.docs.map((doc) {
        return ProductModel.fromMap(doc.id, doc.data() as Map<String, dynamic>);
      }).toList();
      isLoading.value = false;
    }, onError: (error) {
      isLoading.value = false;
      Get.snackbar('Error', 'No se pudieron cargar los productos');
    });
  }
}
