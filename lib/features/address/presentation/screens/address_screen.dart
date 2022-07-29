import 'package:amazon_clone/constants/utils.dart';
import 'package:amazon_clone/features/address/presentation/cubit/address_services_cubit.dart';
import 'package:amazon_clone/features/auth/presentation/cubit/user_detail_cubit.dart';
import 'package:amazon_clone/features/cart/presentation/cubit/cart_services_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pay/pay.dart';

import '../../../../base/base_state.dart';
import '../../../../common/presentation/widgets/custom_textfield.dart';
import '../../../../constants/global_variables.dart';
import '../../../auth/domain/entity/user_entity.dart';

class AddressScreen extends StatelessWidget {
  AddressScreen({
    Key? key,
  }) : super(key: key);

  final _addressFormKey = GlobalKey<FormState>();

  void onApplePayResult(res, BuildContext context) {
    if ((context.read<UserDetailCubit>().state as Authenticated)
        .userEntity
        .address!
        .isEmpty) {
      BlocProvider.of<AddressServicesCubit>(context).saveUserAddress(
          (context.read<UserDetailCubit>().state as Authenticated).userEntity);
    }
    BlocProvider.of<AddressServicesCubit>(context).placeOrder(
        (context.read<UserDetailCubit>().state as Authenticated).userEntity);
  }

  void onGooglePayResult(res, BuildContext context) {
    if ((context.read<UserDetailCubit>().state as Authenticated)
        .userEntity
        .address!
        .isEmpty) {
      BlocProvider.of<AddressServicesCubit>(context).saveUserAddress(
          (context.read<UserDetailCubit>().state as Authenticated).userEntity);
    }
    BlocProvider.of<AddressServicesCubit>(context).placeOrder(
        (context.read<UserDetailCubit>().state as Authenticated).userEntity);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
        ),
      ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<AddressServicesCubit, BaseState>(
            listener: (context, state) {
              if (state is StateOnOrderSuccess) {
                BlocProvider.of<UserDetailCubit>(context)
                    .setData(state.response as UserEntity);
              } else if (state is StateErrorGeneral) {
                showSnackBar(context, state.errorMessage);
              } else if (state is StateOnSuccess) {
                showSnackBar(context, state.response);
              }
            },
          ),
        ],
        child: BlocBuilder<UserDetailCubit, BaseState>(
          builder: (context, state2) {
            return BlocBuilder<CartServicesCubit, BaseState>(
              builder: (context, state) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        if ((context.read<UserDetailCubit>().state
                                as Authenticated)
                            .userEntity
                            .address!
                            .isNotEmpty)
                          Column(
                            children: [
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black12,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    (context.read<UserDetailCubit>().state
                                            as Authenticated)
                                        .userEntity
                                        .address
                                        .toString(),
                                    style: const TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              const Text(
                                GlobalVariables.or,
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(height: 20),
                            ],
                          ),
                        Form(
                          key: _addressFormKey,
                          child: Column(
                            children: [
                              CustomTextField(
                                textEditingController: context
                                    .read<AddressServicesCubit>()
                                    .flatBuildingController,
                                hintText: GlobalVariables.addressLoc,
                              ),
                              const SizedBox(height: 10),
                              CustomTextField(
                                textEditingController: context
                                    .read<AddressServicesCubit>()
                                    .areaController,
                                hintText: GlobalVariables.street,
                              ),
                              const SizedBox(height: 10),
                              CustomTextField(
                                textEditingController: context
                                    .read<AddressServicesCubit>()
                                    .pincodeController,
                                hintText: GlobalVariables.pinCode,
                              ),
                              const SizedBox(height: 10),
                              CustomTextField(
                                textEditingController: context
                                    .read<AddressServicesCubit>()
                                    .cityController,
                                hintText: GlobalVariables.city,
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ),
                        ApplePayButton(
                          width: double.infinity,
                          style: ApplePayButtonStyle.whiteOutline,
                          type: ApplePayButtonType.buy,
                          paymentConfigurationAsset: 'applepay.json',
                          onPaymentResult: (res) =>
                              onApplePayResult(res, context),
                          paymentItems:
                              context.read<AddressServicesCubit>().paymentItems,
                          margin: const EdgeInsets.only(top: 15),
                          height: 50,
                          onPressed: () =>
                              BlocProvider.of<AddressServicesCubit>(context)
                                  .payPressed(
                                      (context.read<UserDetailCubit>().state
                                              as Authenticated)
                                          .userEntity
                                          .address
                                          .toString(),
                                      _addressFormKey),
                        ),
                        const SizedBox(height: 10),
                        GooglePayButton(
                          onPressed: () =>
                              BlocProvider.of<AddressServicesCubit>(context)
                                  .payPressed(
                                      (context.read<UserDetailCubit>().state
                                              as Authenticated)
                                          .userEntity
                                          .address
                                          .toString(),
                                      _addressFormKey),
                          paymentConfigurationAsset: 'gpay.json',
                          onPaymentResult: (res) =>
                              onGooglePayResult(res, context),
                          paymentItems:
                              context.read<AddressServicesCubit>().paymentItems,
                          height: 50,
                          width: double.infinity,
                          style: GooglePayButtonStyle.black,
                          type: GooglePayButtonType.buy,
                          margin: const EdgeInsets.only(top: 15),
                          loadingIndicator: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
