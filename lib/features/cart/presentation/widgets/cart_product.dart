import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/admin/domain/entity/product_entity.dart';
import 'package:amazon_clone/features/cart/presentation/cubit/cart_services_cubit.dart';
import 'package:amazon_clone/features/product_details/presentation/cubit/product_details_services_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../base/base_state.dart';
import '../../../../constants/utils.dart';
import '../../../auth/domain/entity/user_entity.dart';
import '../../../auth/presentation/cubit/user_detail_cubit.dart';

class CartProduct extends StatelessWidget {
  final int index;

  const CartProduct({
    Key? key,
    required this.index,
  }) : super(key: key);

  void increaseQuantity(ProductEntity product, BuildContext context) {
    BlocProvider.of<ProductDetailsServicesCubit>(context).addToCart(
        (context.read<UserDetailCubit>().state as Authenticated).userEntity,
        product.id!);
  }

  void decreaseQuantity(ProductEntity product, BuildContext context) {
    BlocProvider.of<CartServicesCubit>(context).removeFromCart(
        (context.read<UserDetailCubit>().state as Authenticated).userEntity,
        product.id!);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<ProductDetailsServicesCubit, BaseState>(
            listener: (context, state) {
          if (state is StateOnCartSuccess) {
            BlocProvider.of<UserDetailCubit>(context)
                .setData(state.response as UserEntity);
            BlocProvider.of<CartServicesCubit>(context)
                .calculateSum(state.response);
          } else if (state is StateOnSuccess) {
            showSnackBar(context, state.response);
          } else if (state is StateErrorGeneral) {
            showSnackBar(context, state.errorMessage);
          }
        }),
        BlocListener<CartServicesCubit, BaseState>(listener: (context, state) {
          if (state is StateOnCartSuccess) {
            BlocProvider.of<UserDetailCubit>(context)
                .setData(state.response as UserEntity);
            //  BlocProvider.of<CartServicesCubit>(context).calculateSum(state.response);
          } else if (state is StateErrorGeneral) {
            showSnackBar(context, state.errorMessage);
          }
        }),
      ],
      child: BlocBuilder<UserDetailCubit, BaseState>(
        builder: (context, state) {
          if (state is Authenticated) {
            if (state.userEntity.cart!.isNotEmpty) {
              return Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Row(
                      children: [
                        Image.network(
                          state.userEntity.cart![index].productEntity!
                              .images![0],
                          fit: BoxFit.contain,
                          height: 135,
                          width: 135,
                        ),
                        Column(
                          children: [
                            Container(
                              width: 235,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                state
                                    .userEntity.cart![index].productEntity!.name
                                    .toString(),
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                                maxLines: 2,
                              ),
                            ),
                            Container(
                              width: 235,
                              padding: const EdgeInsets.only(left: 10, top: 5),
                              child: Text(
                                '\$${state.userEntity.cart![index].productEntity!.price}',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 2,
                              ),
                            ),
                            Container(
                              width: 235,
                              padding: const EdgeInsets.only(left: 10),
                              child: const Text(GlobalVariables.freeShipping),
                            ),
                            Container(
                              width: 235,
                              padding: const EdgeInsets.only(left: 10, top: 5),
                              child: const Text(
                                GlobalVariables.inStock,
                                style: TextStyle(
                                  color: Colors.teal,
                                ),
                                maxLines: 2,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black12,
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.black12,
                          ),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () => decreaseQuantity(
                                    state
                                        .userEntity.cart![index].productEntity!,
                                    context),
                                child: Container(
                                  width: 35,
                                  height: 32,
                                  alignment: Alignment.center,
                                  child: const Icon(
                                    Icons.remove,
                                    size: 18,
                                  ),
                                ),
                              ),
                              DecoratedBox(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black12, width: 1.5),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(0),
                                ),
                                child: Container(
                                  width: 35,
                                  height: 32,
                                  alignment: Alignment.center,
                                  child: Text(
                                    state.userEntity.cart![index].quantity
                                        .toString(),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () => increaseQuantity(
                                    state
                                        .userEntity.cart![index].productEntity!,
                                    context),
                                child: Container(
                                  width: 35,
                                  height: 32,
                                  alignment: Alignment.center,
                                  child: const Icon(
                                    Icons.add,
                                    size: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              const SizedBox();
            }
          }
          return const SizedBox();
        },
      ),
    );
  }
}
