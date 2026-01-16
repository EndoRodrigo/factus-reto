import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AdminMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      return const RouteSettings(name: '/login');
    }

    // Aquí solo validamos sesión
    // El rol admin se valida dentro del controller
    return null;
  }
}
