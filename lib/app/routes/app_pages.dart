import 'package:get/get.dart';
import '../middlewares/admin_middleware.dart';
import '../middlewares/auth_middleware.dart';
import '../modules/admin/admin_binding.dart';
import '../modules/admin/admin_view.dart';
import '../modules/auth/login_view.dart';
import '../modules/auth/register_view.dart';
import '../modules/cart/cart_view.dart';
import '../modules/order_detail/order_detail_binding.dart';
import '../modules/order_detail/order_detail_view.dart';
import '../modules/product_detail/product_detail_view.dart';
import '../modules/profile/profile_binding.dart';
import '../modules/profile/profile_view.dart';
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
    GetPage(
      name: AppRoutes.CART,
      page: () => const CartView(),
    ),
    GetPage(
      name: AppRoutes.ORDER_DETAIL,
      page: () => OrderDetailView(),
      binding: OrderDetailBinding(),
    ),
    GetPage(
      name: AppRoutes.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
      middlewares: [AuthMiddleware()],
    ),

    GetPage(
      name: AppRoutes.ADMIN,
      page: () => AdminView(),
      binding: AdminBinding(),
      middlewares: [AdminMiddleware()],
    ),
    GetPage(
      name: AppRoutes.ADMIN,
      page: () => const AdminDashboardView(),
      binding: AdminBinding(),
      middlewares: [AdminMiddleware()],
    ),
  ];
}
