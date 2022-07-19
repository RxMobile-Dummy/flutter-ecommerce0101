import 'package:amazon_clone/constants/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../base/base_state.dart';
import '../../../../common/presentation/widgets/loader.dart';
import '../../../../routes_name.dart';
import '../../../account/presentation/widgets/single_product.dart';
import '../../../auth/presentation/cubit/user_detail_cubit.dart';
import '../../domain/entity/product_entity.dart';
import '../cubit/admin_services_cubit.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  @override
  void initState() {
    BlocProvider.of<AdminServicesCubit>(context).fetchAllProduct(
        (context.read<UserDetailCubit>().state as Authenticated)
            .userEntity
            .token
            .toString());
    super.initState();
  }

  void deleteProduct(ProductEntity product, int index, BuildContext context) {
    BlocProvider.of<AdminServicesCubit>(context).deleteProduct(
        (context.read<UserDetailCubit>().state as Authenticated)
            .userEntity
            .token
            .toString(),
        product,
        index);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdminServicesCubit, BaseState>(
      builder: (context, state) {
        if (state is StateOnSuccess) {
          return Scaffold(
            body: GridView.builder(
              itemCount: state.response.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, index) {
                final productData = state.response[index];
                return Column(
                  children: [
                    SizedBox(
                      height: 140,
                      child: SingleProduct(
                        image: productData.images[0],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Text(
                            productData.name,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                        IconButton(
                          onPressed: () =>
                              deleteProduct(productData, index, context),
                          icon: const Icon(
                            Icons.delete_outline,
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () =>
                  Navigator.pushNamed(context, RoutesName.addProduct),
              tooltip: GlobalVariables.addProduct,
              child: const Icon(Icons.add),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
        } else if (state is StateErrorGeneral) {
          return const Loader();
        }
        return const Loader();
      },
    );
  }
}
