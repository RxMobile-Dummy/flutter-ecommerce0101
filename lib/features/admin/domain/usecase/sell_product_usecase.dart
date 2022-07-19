import 'dart:io';

import 'package:amazon_clone/base/error/failures.dart';
import 'package:amazon_clone/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../repository/admin_services_repository.dart';

class SellProductUseCase extends UseCase<String, Params4> {
  final AdminServicesRepository adminServicesRepository;

  SellProductUseCase({required this.adminServicesRepository});

  @override
  Future<Either<Failure, String>?>? call(params) async =>
      await adminServicesRepository.sellProduct(
          params.token,
          params.name,
          params.description,
          params.price,
          params.quantity,
          params.category,
          params.images);
}

class Params4 extends Equatable {
  final String token;
  final String name;
  final String description;
  final double price;
  final double quantity;
  final String category;
  final List<File> images;

  const Params4(
      {required this.token,
      required this.name,
      required this.description,
      required this.price,
      required this.quantity,
      required this.category,
      required this.images});

  @override
  List<Object?> get props =>
      [token, name, description, price, quantity, category, images];
}
