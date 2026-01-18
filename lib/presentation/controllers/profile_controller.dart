import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../core/utils/firestore_service.dart';
import '../../../data/models/user_model.dart';
import '../../core/routes/app_routes.dart'; // Apuntando a la nueva ubicación

class ProfileController extends GetxController {
  final FirestoreService _firestoreService = FirestoreService();
  final _auth = FirebaseAuth.instance;

  var userModel = Rxn<UserModel>();
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadUserData();
  }

  void loadUserData() async {
    try {
      isLoading.value = true;
      final user = _auth.currentUser;
      if (user != null) {
        userModel.value = await _firestoreService.getUser(user.uid);
      }
    } catch (e) {
      print("Error profile: $e");
      Get.snackbar('Error', 'No se pudo cargar la información del usuario');
    } finally {
      isLoading.value = false;
    }
  }

  void logout() async {
    await _auth.signOut();
    Get.offAllNamed(AppRoutes.LOGIN);
  }
}
