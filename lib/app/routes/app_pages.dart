import 'package:get/get.dart';
import '../modules/auth/login_view.dart';
import '../modules/auth/register_view.dart';
import '../modules/product_detail/product_detail_view.dart';
import '../modules/splash/splash_view.dart';
import '../modules/home/home_view.dart';
import 'app_routes.dart';

class AppPages {
  static const INITIAL = AppRoutes.SPLASH;

  static final routes = [
    GetPage(
      name: AppRoutes.SPLASH,
      page: () => const SplashView(),
    ),
    GetPage(
      name: AppRoutes.HOME,
      page: () => const HomeView(),
    ),
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => const LoginView(),
    ),
    GetPage(
      name: AppRoutes.REGISTER,
      page: () => const RegisterView(),
    ),
    GetPage(
      name: AppRoutes.PRODUCT_DETAIL,
      page: () => const ProductDetailView(),
    ),

  ];
}
