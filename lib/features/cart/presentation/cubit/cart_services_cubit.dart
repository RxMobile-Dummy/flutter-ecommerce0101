import 'package:amazon_clone/base/base_state.dart';
import 'package:amazon_clone/features/auth/domain/entity/user_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../product_details/domain/usecase/add_to_cart_usecase.dart';
import '../../domain/usecase/remove_from_cart_usecase.dart';

class CartServicesCubit extends Cubit<BaseState> {
  final RemoveFromCartUseCase removeFromCartUseCase;

  CartServicesCubit({required this.removeFromCartUseCase})
      : super(StateInitial());
  int sum = 0;

  calculateSum(UserEntity userEntity) {
    sum = 0;
    if (userEntity.cart!.isNotEmpty) {
      userEntity.cart
          ?.map((e) => sum += e.quantity! * e.productEntity!.price!.round())
          .toList();
    }
    emit(StateOnCartSuccess(userEntity));
  }

  removeFromCart(UserEntity userEntity, String productId) {
    removeFromCartUseCase
        .call(Params8(userEntity: userEntity, productId: productId))!
        .then((value) =>
            value!.fold((l) => emit(StateErrorGeneral(l.message ?? '')), (r) {
              calculateSum(r);
            }));
  }
}
