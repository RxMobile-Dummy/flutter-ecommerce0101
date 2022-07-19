import 'package:amazon_clone/base/error/failures.dart';
import 'package:amazon_clone/core/usecases/usecase.dart';
import 'package:amazon_clone/features/admin/domain/entity/product_entity.dart';
import 'package:amazon_clone/features/search/domain/repository/search_services_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class FetchSearchProductsUseCase extends UseCase<List<ProductEntity>, Params7> {
  final SearchServicesRepository searchServicesRepository;

  FetchSearchProductsUseCase({required this.searchServicesRepository});

  @override
  Future<Either<Failure, List<ProductEntity>>?>? call(params) async =>
      await searchServicesRepository.fetchSearchedProduct(
          params.searchQuery, params.token);
}

class Params7 extends Equatable {
  final String token;
  final String searchQuery;
  const Params7({required this.token, required this.searchQuery});

  @override
  List<Object?> get props => [token, searchQuery];
}
