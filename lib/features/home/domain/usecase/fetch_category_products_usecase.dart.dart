import 'package:amazon_clone/base/error/failures.dart';
import 'package:amazon_clone/core/usecases/usecase.dart';
import 'package:amazon_clone/features/admin/domain/entity/product_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../repository/home_services_repository.dart';

class FetchCategoryProductsUseCase
    extends UseCase<List<ProductEntity>, Params6> {
  final HomeServicesRepository homeServicesRepository;

  FetchCategoryProductsUseCase({required this.homeServicesRepository});

  @override
  Future<Either<Failure, List<ProductEntity>>?>? call(params) async =>
      await homeServicesRepository.fetchCategoryProducts(
          params.category, params.token);
}

class Params6 extends Equatable {
  final String token;
  final String category;
  const Params6({required this.token, required this.category});

  @override
  List<Object?> get props => [token, category];
}
