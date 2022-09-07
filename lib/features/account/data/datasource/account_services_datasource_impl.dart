import 'dart:convert';

import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/admin/data/model/order_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../base/error/error_handaling.dart';
import '../../../../base/error/failures.dart';
import 'account_services_datasource.dart';
import 'package:http/http.dart' as http;

class AccountServicesDataSourceImpl extends AccountServicesDataSource {
  @override
  Future<Either<Failure, List<OrderModel>>> fetchMyOrders(String token) async {
    List<OrderModel> orderList = [];
    try {
      http.Response response = await http
          .get(Uri.parse('${GlobalVariables.uri}/api/orders/me'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': token,
      });
      if (response.statusCode == 200) {
        debugPrint(response.statusCode.toString());
        for (int i = 0; i < jsonDecode(response.body).length; i++) {
          orderList.add(OrderModel.fromJson(
            jsonEncode(
              jsonDecode(response.body)[i],
            ),
          ));
        }
        return Right(orderList);
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
  Future<Either<Failure, String>> logOut() async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      await sharedPreferences.setString('x-auth-token', '');
      return Future.value(const Right(GlobalVariables.logOutSuccess));
    } catch (e) {
      debugPrint(e.toString());
      return Future.value(Left(FailureMessage(message: e.toString())));
    }
  }
}
