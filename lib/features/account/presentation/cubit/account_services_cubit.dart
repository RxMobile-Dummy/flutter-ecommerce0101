import 'package:amazon_clone/base/base_state.dart';
import 'package:amazon_clone/features/admin/domain/entity/order_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecase/fetch_orders_usecase.dart';

class AccountServicesCubit extends Cubit<BaseState> {
  final FetchOrdersUseCase fetchOrdersUseCase;

  AccountServicesCubit({required this.fetchOrdersUseCase})
      : super(StateInitial());

  fetchOrders(String token) {
    fetchOrdersUseCase.call(Params10(token: token))!.then((value) => value!
        .fold((l) => emit(StateErrorGeneral(l.message ?? '')),
            (r) => emit(StateOnSuccess<List<OrderEntity>>(r))));
  }
}
