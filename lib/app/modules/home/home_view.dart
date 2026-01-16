import 'package:factus_retos/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return Scaffold(
      appBar: AppBar(title: const Text('Productos'),actions: [
        IconButton(
          icon: const Icon(Icons.shopping_cart),
          onPressed: () {
            Get.toNamed(AppRoutes.CART);
          },
        ),
      ],),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.products.isEmpty) {
          return const Center(child: Text('No hay productos'));
        }

        return ListView.builder(
          itemCount: controller.products.length,
          itemBuilder: (_, index) {
            final product = controller.products[index];

            return ListTile(
              leading: Image.asset(
                product.imageUrl,
                //width: double.maxFinite,
                height: 250,
                fit: BoxFit.cover,
              ),
              title: Text(product.name),
              subtitle: Text('\$${product.price}'),
              onTap: () {
                Get.toNamed(
                  AppRoutes.PRODUCT_DETAIL,
                  arguments: product,
                );
              },
            );
          },
        );
      }),
    );
  }
}
