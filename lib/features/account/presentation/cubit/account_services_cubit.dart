import 'package:amazon_clone/base/base_state.dart';
import 'package:amazon_clone/features/account/domain/usecase/logout_usecase.dart';
import 'package:amazon_clone/features/admin/domain/entity/order_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/usecases/usecase.dart';
import '../../domain/usecase/fetch_orders_usecase.dart';

class AccountServicesCubit extends Cubit<BaseState> {
  final FetchOrdersUseCase fetchOrdersUseCase;
  final LogoutUseCase logoutUseCase;

  AccountServicesCubit({required this.logoutUseCase, required this.fetchOrdersUseCase})
      : super(StateInitial());

  fetchOrders(String token) {
    fetchOrdersUseCase.call(Params10(token: token))!.then((value) => value!
        .fold((l) => emit(StateErrorGeneral(l.message ?? '')),
            (r) => emit(StateOnSuccess<List<OrderEntity>>(r))));
  }
  logout() {
    logoutUseCase.call(NoParams())!.then((value) => value!
        .fold((l) => emit(StateErrorGeneral(l.message ?? '')),
            (r) => emit(StateOnLogoutSuccess(r))));
  }
}
