import 'package:amazon_clone/base/base_state.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/cart_services_cubit.dart';

class CartSubtotal extends StatelessWidget {
  const CartSubtotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartServicesCubit, BaseState>(
      builder: (context, state) {
        if (state is StateOnCartSuccess) {
          return Container(
            margin: const EdgeInsets.all(10),
            child: Row(
              children: [
                const Text(
                  GlobalVariables.subtotal,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Text(
                  '\$${context.read<CartServicesCubit>().sum}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
