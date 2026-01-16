import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  final DateTime createdAt;

  UserModel({
    required super.uid,
    required super.email,
    required super.role,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'role': role,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      role: map['role'],
      createdAt: DateTime.parse(map['createdAt']),
    );
  }
}
