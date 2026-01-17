import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../data/services/product_service.dart';

class AdminController extends GetxController {
  final ProductService _productService = ProductService();
  
  var totalOrders = 0.obs;
  var totalRevenue = 0.0.obs;
  
  // Agregamos el stream de productos para la vista
  Stream<QuerySnapshot> get products => _productService.getProducts();

  @override
  void onInit() {
    loadStats();
    super.onInit();
  }

  void loadStats() async {
    try {
      final snapshot = await FirebaseFirestore.instance.collection('orders').get();
      totalOrders.value = snapshot.docs.length;
      totalRevenue.value = snapshot.docs.fold(
        0.0,
        (sum, doc) => sum + (doc.data().containsKey('total') ? (doc['total'] as num).toDouble() : 0.0),
      );
    } catch (e) {
      print("Error loading stats: $e");
    }
  }

  Future<void> deleteProduct(String id) async {
    try {
      await _productService.deleteProduct(id);
      Get.snackbar('Éxito', 'Producto eliminado');
    } catch (e) {
      Get.snackbar('Error', 'No se pudo eliminar el producto');
    }
  }
}
