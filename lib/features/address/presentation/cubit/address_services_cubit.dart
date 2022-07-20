import 'package:amazon_clone/base/base_state.dart';
import 'package:amazon_clone/features/address/domain/usecase/delete_product_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pay/pay.dart';
import '../../../auth/domain/entity/user_entity.dart';
import '../../domain/usecase/place_order_usecase.dart';
import '../../domain/usecase/save_user_address_usecase.dart';

class AddressServicesCubit extends Cubit<BaseState> {
  final DeleteProductUseCase deleteProductUseCase;
  final PlaceOrderUseCase placeOrderUseCase;
  final SaveUserAddressUseCase saveUserAddressUseCase;

  final TextEditingController flatBuildingController = TextEditingController();
  final TextEditingController areaController = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  String addressToBeUsed = "";
  List<PaymentItem> paymentItems = [];
  AddressServicesCubit(
      {required this.deleteProductUseCase,
      required this.placeOrderUseCase,
      required this.saveUserAddressUseCase})
      : super(StateInitial());
  paymentInit(String totalAmount) {
    paymentItems.add(
      PaymentItem(
        amount: totalAmount,
        label: 'Total Amount',
        status: PaymentItemStatus.final_price,
      ),
    );
  }

  deleteProduct(UserEntity userEntity, String productId) {
    deleteProductUseCase
        .call(Params9(userEntity: userEntity, productId: productId))!
        .then((value) => value!.fold(
            (l) => emit(StateErrorGeneral(l.message ?? '')),
            (r) => emit(StateOnSuccess(r))));
  }

  placeOrder(UserEntity userEntity, double totalSum, String address) {
    placeOrderUseCase
        .call(Params9(
            userEntity: userEntity, totalSum: totalSum, address: address))!
        .then((value) => value!.fold(
            (l) => emit(StateErrorGeneral(l.message ?? '')),
            (r) => emit(StateOnSuccess<UserEntity>(r))));
  }

  saveUserAddress(UserEntity userEntity, String address) {
    saveUserAddressUseCase
        .call(Params9(userEntity: userEntity, address: address))!
        .then((value) => value!.fold(
            (l) => emit(StateErrorGeneral(l.message ?? '')),
            (r) => emit(StateOnSuccess<UserEntity>(r))));
  }

  @override
  Future<void> close() {
    flatBuildingController.dispose();
    areaController.dispose();
    pincodeController.dispose();
    cityController.dispose();
    return super.close();
  }
}
