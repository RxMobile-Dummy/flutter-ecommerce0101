import 'package:amazon_clone/base/base_state.dart';
import 'package:amazon_clone/features/admin/presentation/cubit/admin_services_cubit.dart';
import 'package:amazon_clone/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/presentation/widgets/loader.dart';
import '../../../account/presentation/widgets/single_product.dart';
import '../../../auth/presentation/cubit/user_detail_cubit.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AdminServicesCubit>(context).fetchAllOrder(
        (context.read<UserDetailCubit>().state as Authenticated)
            .userEntity
            .token
            .toString());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdminServicesCubit, BaseState>(
      builder: (context, state) {
        if (state is StateOnAllOrderSuccess) {
          return GridView.builder(
            itemCount: state.response!.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              final orderData = state.response![index];
              debugPrint("orderData : ${orderData.toString()}");
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    RoutesName.orderDetails,
                    arguments: orderData,
                  );
                },
                child: SizedBox(
                  height: 140,
                  child: SingleProduct(
                    image: orderData.products[0].images[0],
                  ),
                ),
              );
            },
          );
        } else if (state is StateErrorGeneral) {
          return Center(
            child: Text(state.errorMessage.toString()),
          );
        }
        return const Loader();
      },
    );
  }
}
