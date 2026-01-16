import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'product_form_controller.dart';

class ProductFormView extends GetView<ProductFormController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nuevo Producto')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Nombre'),
              onChanged: (v) => controller.name.value = v,
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Precio'),
              keyboardType: TextInputType.number,
              onChanged: (v) => controller.price.value = double.parse(v),
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Imagen URL'),
              onChanged: (v) => controller.imageUrl.value = v,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: controller.save,
              child: const Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }
}
