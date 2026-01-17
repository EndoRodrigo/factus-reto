import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../data/models/cart_item_model.dart';
import '../../data/models/product_model.dart';
import '../../data/services/order_service.dart';

class CartController extends GetxController {
  var items = <CartItemModel>[].obs;
  final OrderService _orderService = OrderService();

  void addToCart(ProductModel product) {
    final index = items.indexWhere(
          (item) => item.product.id == product.id,
    );

    if (index >= 0) {
      items[index].quantity++;
      items.refresh();
    } else {
      items.add(CartItemModel(product: product));
    }
    Get.snackbar('Carrito', '${product.name} añadido');
  }

  void removeFromCart(ProductModel product) {
    items.removeWhere(
          (item) => item.product.id == product.id,
    );
    items.refresh();
  }

  double get total =>
      items.fold(0, (sum, item) => sum + (item.product.price * item.quantity));

  Future<void> checkout() async {
    if (items.isEmpty) {
      Get.snackbar('Carrito', 'El carrito está vacío');
      return;
    }

    try {
      Get.dialog(
        const Center(child: CircularProgressIndicator()),
        barrierDismissible: false,
      );

      // Simplemente creamos la orden directamente sin Stripe
      await _orderService.createOrder(
        items.map((e) => e.toMap()).toList(),
        total,
      );

      Get.back(); // Cerrar loading
      items.clear();
      Get.snackbar('Éxito', 'Orden creada correctamente');
      Get.back(); // Regresar
      
    } catch (e) {
      Get.back();
      Get.snackbar('Error', 'No se pudo procesar la orden');
      print("Error en checkout: $e");
    }
  }
}
