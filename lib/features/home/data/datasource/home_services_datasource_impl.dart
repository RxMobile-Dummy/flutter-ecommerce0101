import 'dart:convert';

import 'package:amazon_clone/base/error/failures.dart';
import 'package:amazon_clone/features/admin/data/model/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';

import '../../../../base/error/error_handaling.dart';
import '../../../../constants/global_variables.dart';
import 'home_services_datasource.dart';

class HomeServicesDataSourceImpl extends HomeServicesDataSource {
  @override
  Future<Either<Failure, List<ProductModel>>> fetchCategoryProducts(
      String category, String token) async {
    List<ProductModel> productList = [];
    try {
      http.Response response = await http.get(
          Uri.parse('${GlobalVariables.uri}/api/products?category=$category'),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': token,
          });
      if (response.statusCode == 200) {
        debugPrint(response.statusCode.toString());
        for (int i = 0; i < jsonDecode(response.body).length; i++) {
          productList.add(
            ProductModel.fromJson(
              jsonEncode(
                jsonDecode(response.body)[i],
              ),
            ),
          );
        }
        return Right(productList);
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
  Future<Either<Failure, ProductModel>> fetchDealOfDay(String token) async {
    // ProductModel product = const ProductModel(
    //   name: '',
    //   description: '',
    //   quantity: 0,
    //   images: [],
    //   category: '',
    //   price: 0,
    // );
    try {
      http.Response response = await http
          .get(Uri.parse('${GlobalVariables.uri}/api/deal-of-day'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': token,
      });
      if (response.statusCode == 200) {
        debugPrint(response.statusCode.toString());
        return Right(ProductModel.fromJson(response.body));
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
