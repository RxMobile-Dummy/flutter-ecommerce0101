import 'package:amazon_clone/features/home/presentation/cubit/home_services_cubit.dart';
import 'package:amazon_clone/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:amazon_clone/features/home/home_injection_container.dart'
    as home;
import '../../../../base/base_state.dart';
import '../../../../constants/global_variables.dart';
import '../../../auth/presentation/cubit/user_detail_cubit.dart';
import '../widgets/address_box.dart';
import '../widgets/carousel_image.dart';
import '../widgets/deal_of_day.dart';
import '../widgets/top_categories.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void navigateToSearchScreen(String query) {
      Navigator.pushNamed(context, RoutesName.searchScreen, arguments: query);
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  height: 42,
                  margin: const EdgeInsets.only(left: 15),
                  child: Material(
                    borderRadius: BorderRadius.circular(7),
                    elevation: 1,
                    child: TextFormField(
                      onFieldSubmitted: navigateToSearchScreen,
                      decoration: InputDecoration(
                        prefixIcon: InkWell(
                          onTap: () {},
                          child: const Padding(
                            padding: EdgeInsets.only(
                              left: 6,
                            ),
                            child: Icon(
                              Icons.search,
                              color: Colors.black,
                              size: 23,
                            ),
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.only(top: 10),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(7),
                          ),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(7),
                          ),
                          borderSide: BorderSide(
                            color: Colors.black38,
                            width: 1,
                          ),
                        ),
                        hintText: GlobalVariables.search,
                        hintStyle: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.transparent,
                height: 42,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: const Icon(Icons.mic, color: Colors.black, size: 25),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AddressBox(),
            SizedBox(height: 10),
            TopCategories(),
            SizedBox(height: 10),
            CarouselImage(),
            //  DealOfDay(),
            BlocProvider<HomeServicesCubit>(
              create: (_) => home.home<HomeServicesCubit>()
                ..fetchDealsOfTheDay(
                    (context.read<UserDetailCubit>().state as Authenticated)
                        .userEntity
                        .token
                        .toString()),
              child: const DealOfDay(),
            ),
          ],
        ),
      ),
      /*Center(
          child: Text((context.read<UserDetailCubit>().state as Authenticated)
              .userEntity
              .name!)),*/
    );
  }
}
