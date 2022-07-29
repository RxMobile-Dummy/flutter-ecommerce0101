import 'dart:convert';

import 'package:amazon_clone/base/error/failures.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../../../../base/error/error_handaling.dart';
import '../../../auth/data/model/user_model.dart';
import 'address_services_datasource.dart';

class AddressServicesDataSourceImpl extends AddressServicesDataSource {
  @override
  Future<Either<Failure, String>> deleteProduct(
      String productId, String token) async {
    try {
      http.Response response = await http.post(
        Uri.parse('${GlobalVariables.uri}/admin/delete-product'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token,
        },
        body: jsonEncode({
          'id': productId,
        }),
      );
      if (response.statusCode == 200) {
        debugPrint(response.statusCode.toString());
        return const Right(GlobalVariables.deleteProductSuccess);
      } else {
        debugPrint(response.statusCode.toString());
        return Left(ServerFailure(message: getError(response)));
      }
    } catch (e) {
      debugPrint(e.toString());
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel>> placeOrder(
      String address, double totalSum, UserModel userModel) async {
    try {
      print(userModel.toMap()['cart']);
      http.Response response =
          await http.post(Uri.parse('${GlobalVariables.uri}/api/order'),
              headers: {
                'Content-Type': 'application/json; charset=UTF-8',
                'x-auth-token': userModel.token!,
              },

              body: jsonEncode({
                'cart':userModel.toMap()['cart'],
                'address': address,
                'totalPrice': totalSum,
              }));
      if (response.statusCode == 200) {
        debugPrint(response.statusCode.toString());
        UserModel userModel2 = userModel.copyWith(cart: []);
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

  @override
  Future<Either<Failure, UserModel>> saveUserAddress(
      String address, UserModel userModel) async {
    try {
      http.Response response = await http.post(
        Uri.parse('${GlobalVariables.uri}/api/save-user-address'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userModel.token!,
        },
        body: jsonEncode({
          'address': address,
        }),
      );
      if (response.statusCode == 200) {
        debugPrint(response.statusCode.toString());
        UserModel userModel2 =
            userModel.copyWith(address: jsonDecode(response.body)['address']);
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
