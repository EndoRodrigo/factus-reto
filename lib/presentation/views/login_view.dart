
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../core/routes/app_routes.dart';
import '../controllers/auth_controller.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthController());

    final emailCtrl = TextEditingController();
    final passCtrl = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text('Login'),),
      body: Column(
        children: [
          TextField(controller: emailCtrl,decoration: InputDecoration(labelText: 'Email'),),
          SizedBox(height: 16,),
          TextField(controller: passCtrl,decoration: InputDecoration(labelText: 'Password'),),
          SizedBox(height: 24,),

          Obx(() => controller.isLoading.value ? const CircularProgressIndicator()
              : ElevatedButton(onPressed: () async {
                await controller.login(
                emailCtrl.text.trim(),
                passCtrl.text.trim(),
              );
              Get.offAllNamed(AppRoutes.HOME);
            },
            child: const Text('Login'),
          ),
          ),

          TextButton(
            onPressed: () {
              Get.toNamed(AppRoutes.REGISTER);
            },
            child: const Text('Crear cuenta'),
          ),
        ],
      ),
    );
  }
}
