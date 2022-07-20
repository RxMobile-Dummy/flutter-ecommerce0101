import 'package:amazon_clone/features/cart/domain/entity/cart_entity.dart';

class UserEntity {
  final String? name;
  final String? email;
  final String? password;
  final String? id;
  final String? address;
  final String? type;
  final String? token;
  final List<CartEntity>? cart;
  UserEntity(
      {this.name,
      this.email,
      this.password,
      this.id,
      this.address,
      this.type,
      this.token,
      this.cart});
}
