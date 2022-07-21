import 'dart:convert';
import 'dart:io';

import 'package:amazon_clone/base/error/failures.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/admin/data/model/order_model.dart';
import 'package:amazon_clone/features/admin/data/model/product_model.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';

import '../../../../base/error/error_handaling.dart';
import 'admin_services_datasource.dart';

class AdminServicesDataSourceImpl extends AdminServicesDataSource {
  @override
  Future<Either<Failure, String>> sellProduct(
      String token,
      String name,
      String description,
      double price,
      double quantity,
      String category,
      List<File> images) async {
    //cloud name : drr4vtsd5
    //upload preset: l87azg2j
    try {
      final cloudinary = CloudinaryPublic('drr4vtsd5', 'l87azg2j');
      List<String> imageUrls = [];

      for (int i = 0; i < images.length; i++) {
        CloudinaryResponse res = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(images[i].path, folder: name),
        );
        debugPrint("secureUrl : ${res.secureUrl}");
        imageUrls.add(res.secureUrl);
      }
      ProductModel product = ProductModel(
        name: name,
        description: description,
        quantity: quantity,
        images: imageUrls,
        category: category,
        price: price,
      );

      http.Response response = await http.post(
        Uri.parse('${GlobalVariables.uri}/admin/add-product'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token,
        },
        body: product.toJson(),
      );

      if (response.statusCode == 200) {
        debugPrint(response.statusCode.toString());
        return const Right(GlobalVariables.productAddSuccess);
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
  Future<Either<Failure, List<ProductModel>>> fetchAllProducts(
      String token) async {
    List<ProductModel> productList = [];
    try {
      http.Response response = await http.get(
          Uri.parse('${GlobalVariables.uri}/admin/get-products'),
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
  Future<Either<Failure, String>> deleteProduct(
      String token, ProductModel productModel) async {
    try {
      http.Response response = await http.post(
        Uri.parse('${GlobalVariables.uri}/admin/delete-product'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token,
        },
        body: jsonEncode({
          'id': productModel.id,
        }),
      );
      if (response.statusCode == 200) {
        debugPrint(response.statusCode.toString());
        return const Right(GlobalVariables.productDeleteSuccess);
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
  Future<Either<Failure, List<OrderModel>>> fetchAllOrders(String token) async {
    List<OrderModel> orderList = [];
    try {
      http.Response response = await http
          .get(Uri.parse('${GlobalVariables.uri}/admin/get-orders'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': token,
      });
      if (response.statusCode == 200) {
        debugPrint(response.statusCode.toString());
        for (int i = 0; i < jsonDecode(response.body).length; i++) {
          orderList.add(
            OrderModel.fromJson(
              jsonEncode(
                jsonDecode(response.body)[i],
              ),
            ),
          );
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
  Future<Either<Failure, String>> changeOrderStatus(
      int status, OrderModel order, String token) async {
    try {
      http.Response response = await http.post(
        Uri.parse('${GlobalVariables.uri}/admin/change-order-status'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token,
        },
        body: jsonEncode({
          'id': order.id,
          'status': status,
        }),
      );
      if (response.statusCode == 200) {
        debugPrint(response.statusCode.toString());
        return const Right(GlobalVariables.orderStatusSuccess);
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
