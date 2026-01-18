import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Carrito')),
      body: Column(
        children: [
          // 🟦 LISTA DE PRODUCTOS
          Expanded(
            child: Obx(() {
              if (controller.items.isEmpty) {
                return const Center(
                  child: Text('Tu carrito está vacío'),
                );
              }

              return ListView.builder(
                itemCount: controller.items.length,
                itemBuilder: (_, index) {
                  final item = controller.items[index];
                  return ListTile(
                    title: Text(item.product.name),
                    subtitle: Text('Cantidad: ${item.quantity}'),
                    trailing: Text('\$${item.product.price * item.quantity}'),
                  );
                },
              );
            }),
          ),

          // 🟨 TOTAL + BOTÓN PAGAR
          Obx(() => Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  'Total: \$${controller.total}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),

                // 👉 AQUÍ VA EL BOTÓN
                ElevatedButton(
                  onPressed: () async {
                    await controller.checkout();
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 48),
                  ),
                  child: const Text('Pagar ahora'),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
