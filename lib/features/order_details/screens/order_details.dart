import 'package:amazon_clone/common/presentation/widgets/loader.dart';
import 'package:amazon_clone/features/admin/domain/entity/order_entity.dart';
import 'package:amazon_clone/features/admin/presentation/cubit/admin_services_cubit.dart';
import 'package:amazon_clone/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../base/base_state.dart';
import '../../../common/presentation/widgets/custom_button.dart';
import '../../../constants/global_variables.dart';
import '../../auth/presentation/cubit/user_detail_cubit.dart';
import '../cubit/order_details_cubit.dart';

class OrderDetailScreen extends StatelessWidget {
  const OrderDetailScreen({
    Key? key,
  }) : super(key: key);

  void navigateToSearchScreen(String query, BuildContext context) {
    Navigator.pushNamed(context, RoutesName.searchScreen, arguments: query);
  }

  // !!! ONLY FOR ADMIN!!!
  Future<void> changeOrderStatus(
      int status, BuildContext context, OrderEntity orderEntity) async {
    debugPrint("status before: $status");
    if(status < 3){
      status++;
    }
    debugPrint("status after: $status");
    await BlocProvider.of<AdminServicesCubit>(context).changeOrderStatus(
        (context.read<UserDetailCubit>().state as Authenticated)
            .userEntity
            .token
            .toString(),
        orderEntity,
        status);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AdminServicesCubit, BaseState>(
  listener: (context, state) {
    if(state is StateOnOrderSuccess){
      BlocProvider.of<OrderDetailsCubit>(context).update();
    }
  },
  child: Scaffold(
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
                      onFieldSubmitted: (query) =>
                          navigateToSearchScreen(query, context),
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
                        hintText: GlobalVariables.searchInAmazon,
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
      body: BlocBuilder<OrderDetailsCubit, BaseState>(
        builder: (context, state) {
          if (state is StateOnSuccess) {
          OrderEntity? orderEntity =  context.read<OrderDetailsCubit>().order;
          int currentStep =  context.read<OrderDetailsCubit>().currentStep;
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      GlobalVariables.viewOrderDetails,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black12,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Order Date:      ${DateFormat().format(
                            DateTime.fromMillisecondsSinceEpoch(
                                orderEntity!.orderedAt!),
                          )}'),
                          Text(
                              'Order ID:          ${orderEntity.id}'),
                          Text(
                              'Order Total:      \$${orderEntity.totalPrice}'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      GlobalVariables.purchaseDetails,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black12,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          for (int i = 0;
                              i < orderEntity.products!.length;
                              i++)
                            Row(
                              children: [
                                Image.network(
                                  orderEntity.products![i]!
                                      .images![0],
                                  height: 120,
                                  width: 120,
                                ),
                                const SizedBox(width: 5),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        orderEntity.products![i]!
                                            .name
                                            .toString(),
                                        style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        'Qty: ${orderEntity.quantity![i]}',
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      GlobalVariables.tracking,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black12,
                        ),
                      ),
                      child: Stepper(
                        currentStep: currentStep,
                        controlsBuilder: (context, details) {
                          if ((context.read<UserDetailCubit>().state
                                      as Authenticated)
                                  .userEntity
                                  .type ==
                              'admin' && details.currentStep <= 2) {
                            debugPrint(details.currentStep.toString());
                            return CustomButton(
                              text: GlobalVariables.done,
                              onTap: () => changeOrderStatus(
                                  details.currentStep,
                                  context,
                                  orderEntity),
                            );
                          }
                          return const SizedBox();
                        },
                        steps: [
                          Step(
                            title: const Text(GlobalVariables.pending),
                            content: const Text(
                              GlobalVariables.yetDelivered,
                            ),
                            isActive: currentStep > 0,
                            state: currentStep > 0
                                ? StepState.complete
                                : StepState.indexed,
                          ),
                          Step(
                            title: const Text(GlobalVariables.completed),
                            content: const Text(
                              GlobalVariables.yetToSign,
                            ),
                            isActive: currentStep > 1,
                            state: currentStep > 1
                                ? StepState.complete
                                : StepState.indexed,
                          ),
                          Step(
                            title: const Text(GlobalVariables.received),
                            content: const Text(
                              GlobalVariables.signedByYou,
                            ),
                            isActive: currentStep > 2,
                            state: currentStep > 2
                                ? StepState.complete
                                : StepState.indexed,
                          ),
                          Step(
                            title: const Text(GlobalVariables.delivered),
                            content: const Text(
                              GlobalVariables.signedByYou,
                            ),
                            isActive: currentStep >= 3,
                            state: currentStep >= 3
                                ? StepState.complete
                                : StepState.indexed,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return const Loader();
        },
      ),
    ),
);
  }
}
