import 'package:amazon_clone/base/base_state.dart';
import 'package:amazon_clone/features/admin/domain/entity/product_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsServicesCubit extends Cubit<BaseState> {
  double avgRating = 0;
  double myRating = 0;
  double totalRating = 0;
  ProductDetailsServicesCubit() : super(StateInitial());

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
}
