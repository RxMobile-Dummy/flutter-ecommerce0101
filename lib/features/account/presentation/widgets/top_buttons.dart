import 'package:amazon_clone/base/base_state.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/constants/utils.dart';
import 'package:amazon_clone/features/account/presentation/cubit/account_services_cubit.dart';
import 'package:amazon_clone/features/account/presentation/widgets/account_button.dart';
import 'package:amazon_clone/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopButtons extends StatelessWidget {
  const TopButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AccountServicesCubit, BaseState>(
      listener: (context, state) {
        if (state is StateOnLogoutSuccess) {
          showSnackBar(context, state.message);
          Navigator.pushNamedAndRemoveUntil(
            context,
            RoutesName.authScreen,
            (route) => false,
          );
        }
      },
      child: Column(
        children: [
          Row(
            children: [
              AccountButton(
                text: GlobalVariables.yourOrders,
                onTap: () {},
              ),
              AccountButton(
                text: GlobalVariables.turnSeller,
                onTap: () {},
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              AccountButton(
                  text: GlobalVariables.logOut,
                  onTap: () {
                    debugPrint("tap");
                    BlocProvider.of<AccountServicesCubit>(context).logout();
                  }),
              AccountButton(
                text: GlobalVariables.wishList,
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
