import 'package:get/get.dart';
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
  }

  void removeFromCart(ProductModel product) {
    items.removeWhere(
          (item) => item.product.id == product.id,
    );
  }

  double get total =>
      items.fold(0, (sum, item) => sum + item.subtotal);

  Future<void> checkout() async {
    await _orderService.createOrder(
      items.map((e) => e.toMap()).toList(), // ✅ items
      total, // ✅ total SIN .value
    );

    items.clear(); // ✅ items
    Get.snackbar('Éxito', 'Orden creada correctamente');
  }
}
