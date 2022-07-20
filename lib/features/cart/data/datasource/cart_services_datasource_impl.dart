import 'dart:convert';

import 'package:amazon_clone/base/error/failures.dart';
import 'package:http/http.dart' as http;
import 'package:amazon_clone/features/auth/data/model/user_model.dart';

import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import '../../../../base/error/error_handaling.dart';
import '../../../../constants/global_variables.dart';
import '../model/cart_model.dart';
import 'cart_services_datasource.dart';

class CartServicesDataSourceImpl extends CartServicesDataSource {
  @override
  Future<Either<Failure, UserModel>> removeFromCart(
      String productId, UserModel userModel) async {
    try {
      http.Response response = await http.delete(
        Uri.parse('${GlobalVariables.uri}/api/remove-from-cart/$productId'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userModel.token!,
        },
      );
      if (response.statusCode == 200) {
        List<CartModel> list = List<CartModel>.from(
            jsonDecode(response.body)['cart'].map((x) => CartModel.fromMap(x)));
        debugPrint(response.statusCode.toString());
        UserModel userModel2 = userModel.copyWith(cart: list);
        return Right(userModel2);
      } else {
        debugPrint(response.statusCode.toString());
        return Left(ServerFailure(message: getError(response)));
      }
    } catch (e) {
      debugPrint(e.toString());
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
