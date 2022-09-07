import 'dart:io';

import 'package:amazon_clone/base/base_state.dart';
import 'package:amazon_clone/features/admin/data/model/earning_model.dart';
import 'package:amazon_clone/features/admin/domain/entity/order_entity.dart';
import 'package:amazon_clone/features/admin/domain/entity/product_entity.dart';
import 'package:amazon_clone/features/admin/domain/usecase/change_order_status_usecase.dart';
import 'package:amazon_clone/features/admin/domain/usecase/fetch_all_orders_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecase/delete_product_usecase.dart';
import '../../domain/usecase/fetch_all_products_usecase.dart';
import '../../domain/usecase/get_earnings_usecase.dart';
import '../../domain/usecase/sell_product_usecase.dart';

class AdminServicesCubit extends Cubit<BaseState> {
  final SellProductUseCase sellProductUseCase;
  final FetchAllProducts fetchAllProducts;
  final FetchAllOrdersUseCase fetchAllOrdersUseCase;
  final DeleteProductUseCase deleteProductUseCase;
  final ChangeOrderStatusUseCase changeOrderStatusUseCase;
  final GetEarningsUseCase getEarningsUseCase;
  late List<ProductEntity> _list;

  AdminServicesCubit({required this.getEarningsUseCase,
      required this.changeOrderStatusUseCase,
      required this.fetchAllOrdersUseCase,
      required this.deleteProductUseCase,
      required this.fetchAllProducts,
      required this.sellProductUseCase})
      : super(StateInitial());


  changeOrderStatus(String token, OrderEntity orderEntity, int status) {
    emit(StateLoading());
    changeOrderStatusUseCase
        .call(Params11(orderEntity: orderEntity, token: token, status: status))!
        .then((value) => value!.fold(
            (l) => emit(StateErrorGeneral(l.message ?? '')),
            (r) => emit(StateOnOrderSuccess<String>(r))));
  }

  getEarnings(String token){
    getEarningsUseCase.call(Params5(token: token))!.then((value) =>
        value!.fold((l) => emit(StateErrorGeneral(l.message ?? "")), (r) {
          emit(StateOnEarningSuccess<Earning>(r));
        }));
  }

  sellProduct(String token, String name, String description, double price,
      double quantity, List<File> images, String category) {
    sellProductUseCase
        .call(Params4(
            token: token,
            name: name,
            description: description,
            price: price,
            quantity: quantity,
            category: category,
            images: images))!
        .then((value) => value!.fold(
            (l) => emit(StateErrorGeneral(l.message ?? '')),
            (r) => emit(StateOnAddSuccess<String>(r))));
  }

  fetchAllProduct(String token) {

    fetchAllProducts.call(Params5(token: token))!.then((value) =>
        value!.fold((l) => emit(StateErrorGeneral(l.message ?? "")), (r) {
          _list = r;
          emit(StateOnSuccess<List<ProductEntity>>(_list));
        }));
  }

  deleteProduct(String token, ProductEntity productEntity, int index) {
    deleteProductUseCase
        .call(Params6(token: token, productEntity: productEntity))!
        .then((value) =>
            value!.fold((l) => emit(StateErrorGeneral(l.message ?? "")), (r) {
              emit(StateInitial());
              _list.removeAt(index);
              emit(StateOnSuccess(_list));
            }));
  }

  fetchAllOrder(String token) {
    fetchAllOrdersUseCase.call(Params5(token: token))!.then((value) =>
        value!.fold((l) => emit(StateErrorGeneral(l.message ?? "")), (r) {
          emit(StateOnAllOrderSuccess<List<OrderEntity>>(r));
        }));
  }
}
