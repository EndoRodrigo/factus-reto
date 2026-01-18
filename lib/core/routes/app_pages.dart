import 'package:get/get.dart';
import '../../presentation/controllers/admin_binding.dart';
import '../../presentation/controllers/order_detail_binding.dart';
import '../../presentation/controllers/product_form_binding.dart';
import '../../presentation/controllers/profile_binding.dart';
import '../../presentation/views/admin_view.dart';
import '../../presentation/views/cart_view.dart';
import '../../presentation/views/home_view.dart';
import '../../presentation/views/login_view.dart';
import '../../presentation/views/order_detail_view.dart';
import '../../presentation/views/product_detail_view.dart';
import '../../presentation/views/product_form_view.dart';
import '../../presentation/views/profile_view.dart';
import '../../presentation/views/register_view.dart';
import '../../presentation/views/splash_view.dart';
import '../middlewares/admin_middleware.dart';
import '../middlewares/auth_middleware.dart';
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
      page: () => const ProfileView(),
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
      name: AppRoutes.ADMIN_PRODUCTS,
      page: () => ProductFormView(),
      binding: ProductFormBinding(),
      middlewares: [AdminMiddleware()],
    ),
  ];
}
