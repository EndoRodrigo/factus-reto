import '../entities/user_entity.dart';

abstract class AuthRepository {
  Future<void> logout();
  Future<String> getUserRole(String uid);
  UserEntity? get currentUser;
}
