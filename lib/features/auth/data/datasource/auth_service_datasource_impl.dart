import 'dart:convert';

import 'package:amazon_clone/base/error/error_handaling.dart';
import 'package:amazon_clone/base/error/failures.dart';
import 'package:amazon_clone/constants/global_variables.dart';

import 'package:amazon_clone/features/auth/data/model/user_model.dart';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'auth_service_datasource.dart';

import 'package:http/http.dart' as http;

class AuthServiceDataSourceImpl extends AuthServiceDataSource {
  @override
  Future<Either<Failure, String>> signUpUser(
      String email, String password, String name,String userType) async {
    try {
      UserModel userModel = UserModel(
          name: name,
          email: email,
          password: password,
          id: '',
          type: userType,
          token: '',
          address: '',cart: []);
      http.Response response = await http.post(
        Uri.parse("${GlobalVariables.uri}/api/signup"),
        body: userModel.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (response.statusCode == 200) {
        debugPrint(response.statusCode.toString());
        return const Right(GlobalVariables.accountSuccess);
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
  Future<Either<Failure, UserModel>> signInUser(
      String email, String password,String userType) async {
    try {
      http.Response response = await http.post(
        Uri.parse("${GlobalVariables.uri}/api/signin"),
        body: jsonEncode({
          'email': email,
          'password': password,
          'type' : userType
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (response.statusCode == 200) {
        debugPrint(response.statusCode.toString());
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString(
            'x-auth-token', jsonDecode(response.body)['token']);
        return Right(UserModel.fromJson(response.body));
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
  Future<Either<Failure, UserModel>> getUserData() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');
      if (token == null) {
        prefs.setString('x-auth-token', '');
        return const Left(ServerFailure(message: "token null"));
      } else {
        var tokenRes = await http.post(
          Uri.parse('${GlobalVariables.uri}/tokenIsValid'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': token
          },
        );
        var response = jsonDecode(tokenRes.body);

        if (response == true) {
          http.Response userRes = await http.get(
            Uri.parse('${GlobalVariables.uri}/'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'x-auth-token': token
            },
          );
          return Right(UserModel.fromJson(userRes.body));
        } else {
          debugPrint(response.toString());
          return Left(ServerFailure(message: response.toString()));
        }
      }
    } catch (e) {
      debugPrint(e.toString());
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
