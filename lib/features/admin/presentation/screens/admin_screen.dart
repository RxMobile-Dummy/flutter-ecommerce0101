import 'package:amazon_clone/base/base_state.dart';
import 'package:amazon_clone/common/presentation/cubit/bottom_nav_cubit.dart';
import 'package:amazon_clone/features/admin/presentation/screens/posts_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../constants/global_variables.dart';
import 'analtyics_screen.dart';
import 'orders_screen.dart';

class AdminScreen extends StatelessWidget {
  AdminScreen({Key? key}) : super(key: key);

  List<Widget> pages = [
    const PostsScreen(),
    const AnalyticsScreen(),
    const OrdersScreen(),
    // BlocProvider<AdminServicesCubit>(
    //   create: (context) => admin.admin<AdminServicesCubit>()
    //     ..fetchAllProduct(
    //         (context.read<UserDetailCubit>().state as Authenticated)
    //             .userEntity
    //             .token
    //             .toString()),
    //   child: const PostsScreen(),
    // ),
    // BlocProvider<AdminServicesCubit>(
    //   create: (context) => admin.admin<AdminServicesCubit>()
    //     ..getEarnings((context.read<UserDetailCubit>().state as Authenticated)
    //         .userEntity
    //         .token
    //         .toString()),
    //   child: const AnalyticsScreen(),
    // ),
    // BlocProvider<AdminServicesCubit>(
    //   create: (context) => admin.admin<AdminServicesCubit>()
    //     ..fetchAllOrder((context.read<UserDetailCubit>().state as Authenticated)
    //         .userEntity
    //         .token
    //         .toString()),
    //   child: const OrdersScreen(),
    // ),
  ];

  void updatePage(int page, BuildContext context) {
    BlocProvider.of<BottomNavCubit>(context).setPage(page);
    // if(page == 0){
    //   BlocProvider.of<AdminServicesCubit>(context).fetchAllProduct((context.read<UserDetailCubit>().state as Authenticated)
    //         .userEntity
    //         .token
    //         .toString());
    // }else if(page == 1){
    //
    // }else if(page == 2){
    //   BlocProvider.of<AdminServicesCubit>(context).fetchAllOrder((context.read<UserDetailCubit>().state as Authenticated)
    //       .userEntity
    //       .token
    //       .toString());
    // }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit, BaseState>(
      builder: (context, state) {
        if (state is StateOnSuccess) {
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
                    const Text(
                      GlobalVariables.admin,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ),
            body: pages[state.response],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: state.response,
              selectedItemColor: GlobalVariables.selectedNavBarColor,
              unselectedItemColor: GlobalVariables.unselectedNavBarColor,
              backgroundColor: GlobalVariables.backgroundColor,
              iconSize: 28,
              onTap: (value) => updatePage(value, context),
              items: [
                // POSTS
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
                // ANALYTICS
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
                      Icons.analytics_outlined,
                    ),
                  ),
                  label: '',
                ),
                // ORDERS
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
                    child: const Icon(
                      Icons.all_inbox_outlined,
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
