import 'package:amazon_clone/features/account/presentation/cubit/account_services_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../base/base_state.dart';
import '../../../../constants/global_variables.dart';
import '../../../auth/presentation/cubit/user_detail_cubit.dart';
import '../widgets/below_app_bar.dart';
import '../widgets/orders.dart';
import '../widgets/top_buttons.dart';
import 'package:amazon_clone/features/account/account_injection_container.dart'
    as account;

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  GlobalVariables.imageAmazon,
                  width: 120,
                  height: 45,
                  color: Colors.black,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(right: 15),
                      child: Icon(Icons.notifications_outlined),
                    ),
                    Icon(
                      Icons.search,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          const BelowAppBar(),
          const SizedBox(height: 10),
          const TopButtons(),
          const SizedBox(height: 20),
          BlocProvider<AccountServicesCubit>(
            create: (context) => account.account<AccountServicesCubit>()
              ..fetchOrders(
                  (context.read<UserDetailCubit>().state as Authenticated)
                      .userEntity
                      .token
                      .toString()),
            child: const Orders(),
          ),
        ],
      ),
    );
  }
}
