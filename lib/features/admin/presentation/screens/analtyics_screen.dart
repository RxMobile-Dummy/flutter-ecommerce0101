import 'package:amazon_clone/features/admin/presentation/cubit/admin_services_cubit.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../base/base_state.dart';
import '../../../../common/presentation/widgets/loader.dart';
import '../../../auth/presentation/cubit/user_detail_cubit.dart';
import '../../data/model/sales.dart';
import '../widgets/category_products_chart.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({Key? key}) : super(key: key);

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  @override
  void initState() {
    BlocProvider.of<AdminServicesCubit>(context).getEarnings(
        (context.read<UserDetailCubit>().state as Authenticated)
            .userEntity
            .token
            .toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdminServicesCubit,BaseState>(
      builder: (context, state) {
        debugPrint(state.toString());
        if (state is StateOnEarningSuccess) {
          return Column(
            children: [
              Text(
                '\$${state.response.totalEarning}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 250,
                child: CategoryProductsChart(seriesList: [
                  charts.Series(
                    id: 'Sales',
                    data: state.response.sales!,
                    domainFn: (Sales sales, _) => sales.label,
                    measureFn: (Sales sales, _) => sales.earning,
                  ),
                ]),
              )
            ],
          );
        }
        return const Loader();
      },
    );
  }
}
