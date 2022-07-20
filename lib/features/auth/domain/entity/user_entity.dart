class UserEntity {
  final String? name;
  final String? email;
  final String? password;
  final String? id;
  final String? address;
  final String? type;
  final String? token;
  final List<dynamic>? cart;
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
