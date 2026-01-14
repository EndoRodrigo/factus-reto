import 'package:factus_retos/app/routes/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SplashController extends GetxController{
  @override
  void onInit() {
    super.onInit();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(seconds: 3));

      final user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        Get.offAllNamed(AppRoutes.HOME);
      } else {
        Get.offAllNamed(AppRoutes.LOGIN);
      }
    });

    /*Future.delayed(const Duration(seconds: 10),(){
      Get.offAllNamed(AppRoutes.HOME);
    });*/
  }
}
