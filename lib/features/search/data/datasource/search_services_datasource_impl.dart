import 'dart:convert';

import 'package:amazon_clone/base/error/failures.dart';
import 'package:amazon_clone/features/admin/data/model/product_model.dart';
import 'package:amazon_clone/features/search/data/datasource/search_services_datasource.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';

import '../../../../../base/error/error_handaling.dart';
import '../../../../../constants/global_variables.dart';

class SearchServicesDataSourceImpl extends SearchServicesDataSource {
  @override
  Future<Either<Failure, List<ProductModel>>> fetchSearchedProduct(
      String searchQuery, String token) async {
    List<ProductModel> productList = [];
    try {
      http.Response response = await http.get(
        Uri.parse('${GlobalVariables.uri}/api/products/search/$searchQuery'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token,
        },
      );
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
}
