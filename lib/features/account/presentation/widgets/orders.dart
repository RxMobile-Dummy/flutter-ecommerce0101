import 'package:amazon_clone/base/base_state.dart';
import 'package:amazon_clone/common/presentation/widgets/loader.dart';
import 'package:amazon_clone/features/account/presentation/cubit/account_services_cubit.dart';
import 'package:amazon_clone/features/account/presentation/widgets/single_product.dart';
import 'package:amazon_clone/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constants/global_variables.dart';

class Orders extends StatelessWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountServicesCubit, BaseState>(
      builder: (context, state) {
        if (state is StateOnSuccess) {
          if (state.response.isNotEmpty) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                        left: 15,
                      ),
                      child: const Text(
                        GlobalVariables.yourOrders,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                        right: 15,
                      ),
                      child: Text(
                        GlobalVariables.seeAll,
                        style: TextStyle(
                          color: GlobalVariables.selectedNavBarColor,
                        ),
                      ),
                    ),
                  ],
                ),
                // display orders
                Container(
                  height: 170,
                  padding: const EdgeInsets.only(
                    left: 10,
                    top: 20,
                    right: 0,
                  ),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount:  state.response.length,
                    itemBuilder: (context, index) {
                      debugPrint(state.response![index].toString());
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            RoutesName.orderDetails,
                            arguments: state.response![index],
                          );
                        },
                        child: SingleProduct(
                          image: state.response![index].products[0].images[0],
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          } else {
            return const Center(
              child: Text(GlobalVariables.orderEmpty),
            );
          }
        }
        return const Loader();
      },
    );
  }
}
