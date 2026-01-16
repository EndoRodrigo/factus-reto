import 'package:get/get.dart';
import '../../data/services/auth_service.dart';

class ProfileController extends GetxController {
  final AuthService _authService = AuthService();

  void logout() async {
    await _authService.logout();
    Get.offAllNamed('/login');
  }
}
