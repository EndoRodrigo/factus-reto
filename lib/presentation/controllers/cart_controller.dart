import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/stripe_service.dart';
import '../../../data/models/cart_item_model.dart'; // NUEVA RUTA
import '../../../data/models/product_model.dart';   // NUEVA RUTA
import '../../../core/utils/order_service.dart';

class CartController extends GetxController {
  // Aseguramos que la lista use el modelo de la nueva arquitectura
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

      bool paymentSuccessful = await StripeService.instance.makePayment(
        total,
        'USD',
      );

      if (paymentSuccessful) {
        await _orderService.createOrder(
          items.map((e) => e.toMap()).toList(),
          total,
        );

        Get.back(); // Cerrar loading
        items.clear();
        Get.snackbar('Éxito', 'Pago procesado y orden creada');
        Get.back();
      } else {
        Get.back();
        Get.snackbar('Pago Cancelado', 'No se procesó el pago');
      }
      
    } catch (e) {
      if (Get.isDialogOpen!) Get.back();
      Get.snackbar('Error', 'Error al procesar la transacción: $e');
    }
  }
}
