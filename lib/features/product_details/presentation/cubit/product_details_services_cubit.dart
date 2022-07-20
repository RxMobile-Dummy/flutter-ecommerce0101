import 'package:amazon_clone/base/base_state.dart';
import 'package:amazon_clone/features/admin/domain/entity/product_entity.dart';
import 'package:amazon_clone/features/auth/domain/entity/user_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecase/add_to_cart_usecase.dart';
import '../../domain/usecase/rate_product_usecase.dart';

class ProductDetailsServicesCubit extends Cubit<BaseState> {
  final AddToCartUseCase addToCartUseCase;
  final RateToProductUseCase rateToProductUseCase;
  double avgRating = 0;
  double myRating = 0;
  double totalRating = 0;

  ProductDetailsServicesCubit(
      {required this.addToCartUseCase, required this.rateToProductUseCase})
      : super(StateInitial());

  calculateProduct(ProductEntity product, String uid) {
    for (int i = 0; i < product.rating!.length; i++) {
      totalRating += product.rating![i].rating!;
      if (product.rating![i].userId == uid) {
        myRating = product.rating![i].rating!;
      }
    }
    if (totalRating != 0) {
      avgRating = totalRating / product.rating!.length;
    }
  }

  rateToProduct(UserEntity userEntity, String productId, double rating) {
    rateToProductUseCase
        .call(Params8(
            userEntity: userEntity, productId: productId, rating: rating))!
        .then((value) => value!.fold(
            (l) => emit(StateErrorGeneral(l.message ?? '')),
            (r) => emit(StateOnSuccess(r))));
  }

  addToCart(UserEntity userEntity, String productId) {
    addToCartUseCase
        .call(Params8(userEntity: userEntity, productId: productId))!
        .then((value) => value!.fold(
            (l) => emit(StateErrorGeneral(l.message ?? '')),
            (r) => emit(StateOnCartSuccess(r))));
  }
}
