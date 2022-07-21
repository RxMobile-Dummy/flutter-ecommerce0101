import 'package:amazon_clone/base/base_state.dart';
import 'package:amazon_clone/constants/global_variables.dart';
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
  double totalAmount = 0.0;
  AddressServicesCubit(
      {required this.deleteProductUseCase,
      required this.placeOrderUseCase,
      required this.saveUserAddressUseCase})
      : super(StateInitial());

  paymentInit(String totalAmounts) {
    totalAmount = double.parse(totalAmounts);
    paymentItems.add(
      PaymentItem(
        amount: totalAmounts,
        label: GlobalVariables.totalAmount,
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

  placeOrder(UserEntity userEntity) {
    placeOrderUseCase
        .call(Params9(
            userEntity: userEntity,
            totalSum: totalAmount,
            address: addressToBeUsed))!
        .then((value) => value!.fold(
            (l) => emit(StateErrorGeneral(l.message ?? '')),
            (r) => emit(StateOnOrderSuccess<UserEntity>(r))));
  }

  payPressed(String addressFromProvider, GlobalKey<FormState> key) {
    addressToBeUsed = "";
    bool isForm = flatBuildingController.text.isNotEmpty ||
        areaController.text.isNotEmpty ||
        pincodeController.text.isNotEmpty ||
        cityController.text.isNotEmpty;
    if (isForm) {
      if (key.currentState!.validate()) {
        addressToBeUsed =
            '${flatBuildingController.text}, ${areaController.text}, ${cityController.text} - ${pincodeController.text}';
      } else {
        throw Exception(GlobalVariables.pleaseEnter);
      }
    } else if (addressFromProvider.isNotEmpty) {
      addressToBeUsed = addressFromProvider;
    } else {
      //snack bar

    }
  }

  saveUserAddress(UserEntity userEntity) {
    saveUserAddressUseCase
        .call(Params9(userEntity: userEntity, address: addressToBeUsed))!
        .then((value) => value!.fold(
            (l) => emit(StateErrorGeneral(l.message ?? '')),
            (r) => emit(StateOnOrderSuccess<UserEntity>(r))));
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
