import 'package:amazon_clone/features/admin/domain/entity/order_entity.dart';

class OrderData{
 final OrderEntity? orderEntity;
 final int? currentStep;

  OrderData({ this.orderEntity,  this.currentStep =0});

}