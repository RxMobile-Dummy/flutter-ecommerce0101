import 'package:amazon_clone/base/base_state.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants/global_variables.dart';
import '../../../features/account/presentation/screens/account_screen.dart';

import '../../../features/auth/presentation/cubit/user_detail_cubit.dart';
import '../../../features/cart/presentation/screens/cart_screen.dart';
import '../../../features/home/presentation/screens/home_screen.dart';
import '../cubit/bottom_nav_cubit.dart';

class BottomBar extends StatelessWidget {
  BottomBar({Key? key}) : super(key: key);

  List<Widget> pages = [
    const HomeScreen(),
    const AccountScreen(),
    const CartScreen(),
  ];

  void updatePage(int page, BuildContext context) {
    BlocProvider.of<BottomNavCubit>(context).setPage(page);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit, BaseState>(
      builder: (context, state) {
        if (state is StateOnSuccess) {
          return Scaffold(
            body: pages[state.response],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: state.response,
              selectedItemColor: GlobalVariables.selectedNavBarColor,
              unselectedItemColor: GlobalVariables.unselectedNavBarColor,
              backgroundColor: GlobalVariables.backgroundColor,
              iconSize: 28,
              onTap: (value) => updatePage(value, context),
              items: [
                // HOME
                BottomNavigationBarItem(
                  icon: Container(
                    width: GlobalVariables.bottomBarWidth,
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: state.response == 0
                              ? GlobalVariables.selectedNavBarColor
                              : GlobalVariables.backgroundColor,
                          width: GlobalVariables.bottomBarBorderWidth,
                        ),
                      ),
                    ),
                    child: const Icon(
                      Icons.home_outlined,
                    ),
                  ),
                  label: '',
                ),
                // ACCOUNT
                BottomNavigationBarItem(
                  icon: Container(
                    width: GlobalVariables.bottomBarWidth,
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: state.response == 1
                              ? GlobalVariables.selectedNavBarColor
                              : GlobalVariables.backgroundColor,
                          width: GlobalVariables.bottomBarBorderWidth,
                        ),
                      ),
                    ),
                    child: const Icon(
                      Icons.person_outline_outlined,
                    ),
                  ),
                  label: '',
                ),
                // CART
                BottomNavigationBarItem(
                  icon: Container(
                    width: GlobalVariables.bottomBarWidth,
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: state.response == 2
                              ? GlobalVariables.selectedNavBarColor
                              : GlobalVariables.backgroundColor,
                          width: GlobalVariables.bottomBarBorderWidth,
                        ),
                      ),
                    ),
                    child: BlocBuilder<UserDetailCubit, BaseState>(
                      builder: (context, state) {
                        return Badge(
                          elevation: 0,
                          badgeContent: (context.read<UserDetailCubit>().state
                                      as Authenticated)
                                  .userEntity
                                  .cart!
                                  .isEmpty
                              ? null
                              : Text((context.read<UserDetailCubit>().state
                                      as Authenticated)
                                  .userEntity
                                  .cart!
                                  .length
                                  .toString()),
                          badgeColor: Colors.white,
                          child: const Icon(
                            Icons.shopping_cart_outlined,
                          ),
                        );
                      },
                    ),
                  ),
                  label: '',
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
