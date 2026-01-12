import 'package:factus_retos/app/routes/app_routes.dart';
import 'package:get/get.dart';

class SplashController extends GetxController{
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 10),(){
      Get.offAllNamed(AppRoutes.HOME);
    });
  }
}
