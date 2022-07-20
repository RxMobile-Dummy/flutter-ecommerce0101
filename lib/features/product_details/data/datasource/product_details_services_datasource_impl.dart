import 'dart:convert';

import 'package:amazon_clone/base/error/failures.dart';
import 'package:amazon_clone/features/auth/data/model/user_model.dart';
import 'package:amazon_clone/features/product_details/data/datasource/product_details_services_datasource.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../../../../base/error/error_handaling.dart';
import '../../../../constants/global_variables.dart';
import '../../../cart/data/model/cart_model.dart';

class ProductDetailsServicesDataSourceImpl
    extends ProductDetailsServicesDataSource {
  @override
  Future<Either<Failure, UserModel>> addToCart(
      String productId, UserModel userModel) async {
    try {
      http.Response response = await http.post(
        Uri.parse('${GlobalVariables.uri}/api/add-to-cart'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userModel.token!,
        },
        body: jsonEncode({
          'id': productId,
        }),
      );
      if (response.statusCode == 200) {
        debugPrint(response.statusCode.toString());
        List<CartModel> list = List<CartModel>.from(
            jsonDecode(response.body)['cart'].map((x) => CartModel.fromMap(x)));
        UserModel userModel2 = userModel.copyWith(cart: list);
        return Right(userModel2);
      } else {
        debugPrint(response.statusCode.toString());
        return Left(ServerFailure(message: getError(response)));
      }

      /* httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          User user =
              userProvider.user.copyWith(cart: jsonDecode(res.body)['cart']);
          userProvider.setUserFromModel(user);
        },
      );*/
    } catch (e) {
      debugPrint(e.toString());
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> rateProduct(
      String productId, double rating, String token) async {
    try {
      http.Response response = await http.post(
        Uri.parse('${GlobalVariables.uri}/api/rate-product'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token,
        },
        body: jsonEncode({
          'id': productId,
          'rating': rating,
        }),
      );
      if (response.statusCode == 200) {
        debugPrint(response.statusCode.toString());
        return const Right(GlobalVariables.ratingSuccess);
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
