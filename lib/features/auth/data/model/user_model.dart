import 'package:amazon_clone/features/auth/domain/entity/user_entity.dart';

class UserModel extends UserEntity {
  UserModel(
      {required super.name,
      required super.email,
      required super.password,
      super.id,
      super.address,
      super.type,
      super.token});

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        name: map['name'] ?? '',
        email: map['email'] ?? '',
        password: map['password'] ?? '',
        id: map['id'] ?? '',
        address: map['address'] ?? '',
        type: map['type'] ?? '',
        token: map['token'] ?? '');
  }
}
