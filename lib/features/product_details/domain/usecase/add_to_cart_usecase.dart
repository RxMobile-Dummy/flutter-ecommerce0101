import 'package:amazon_clone/base/error/failures.dart';
import 'package:amazon_clone/core/usecases/usecase.dart';
import 'package:amazon_clone/features/product_details/domain/repository/product_repository_services_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class AddToCartUseCase extends UseCase<String, Params8> {
  final ProductDetailsServicesRepository productDetailsServicesRepository;

  AddToCartUseCase({required this.productDetailsServicesRepository});

  @override
  Future<Either<Failure, String>?>? call(Params8 params) async {
    return await productDetailsServicesRepository.addToCart(params.productId!);
  }
}

class Params8 extends Equatable {
  final String? productId;
  final double? rating;

  const Params8({this.productId, this.rating});

  @override
  List<Object?> get props => [productId, rating];
}
