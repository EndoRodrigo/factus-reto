import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controller.dart';


class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(controller.title.value)),
      ),
      body: const Center(
        child: Text(
          'Bienvenido al E-commerce',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
