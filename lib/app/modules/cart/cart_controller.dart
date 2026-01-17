import 'package:get/get.dart';
import '../../../core/utils/stripe_service.dart';
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
    if (items.isEmpty) return;

    Get.showOverlay(
      asyncFunction: () async {
        // 1. Procesar Pago con Stripe
        bool paymentSuccessful = await StripeService.instance.makePayment(
          total,
          'USD',
        );

        if (paymentSuccessful) {
          // 2. Si el pago es exitoso, crear la orden en Firebase
          await _orderService.createOrder(
            items.map((e) => e.toMap()).toList(),
            total,
          );

          items.clear();
          Get.snackbar('Éxito', 'Pago realizado y orden creada correctamente');
        } else {
          Get.snackbar('Error', 'El pago no pudo completarse');
        }
      },
      loadingWidget: const Center(child: CircularProgressIndicator()),
    );
  }
}
