import 'package:amazon_clone/base/base_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../admin/domain/entity/order_entity.dart';
import '../model/order_data.dart';

class OrderDetailsCubit extends Cubit<BaseState> {
  int currentStep = 0;
  OrderEntity? order;

  OrderDetailsCubit() : super(StateInitial());

  initStep(OrderEntity orderEntity) {
    currentStep = orderEntity.status!;
    order = orderEntity;
    emit(StateOnSuccess(
        OrderData(currentStep: currentStep, orderEntity: order!)));
  }

  update() {
    debugPrint("update before $currentStep");
    if(currentStep <= 3){
      currentStep++;
    }
    debugPrint("update after $currentStep");
    emit(StateOnSuccess(
        OrderData(currentStep: currentStep, orderEntity: order!)));
  }
}
