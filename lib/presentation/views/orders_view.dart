import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/routes/app_routes.dart';
import '../controllers/orders_controller.dart';


class OrdersView extends GetView<OrdersController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mis Compras')),
      body: StreamBuilder(
        stream: controller.orders,
        builder: (_, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final orders = snapshot.data!.docs;

          if (orders.isEmpty) {
            return const Center(child: Text('No tienes compras aún'));
          }

          return ListView.builder(
            itemCount: orders.length,
            itemBuilder: (_, index) {
              final order = orders[index];

              // 👉 AQUÍ VA TU ListTile
              return ListTile(
                title: Text('Total: \$${order['total']}'),
                subtitle: Text('Estado: ${order['status']}'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  Get.toNamed(
                    AppRoutes.ORDER_DETAIL,
                    arguments: order.data(),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
