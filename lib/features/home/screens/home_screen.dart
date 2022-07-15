import 'package:amazon_clone/base/base_state.dart';
import 'package:amazon_clone/features/auth/domain/entity/user_entity.dart';
import 'package:amazon_clone/features/auth/presentation/cubit/auth_service_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text((context.read<AuthServiceCubit>().state as Authenticated)
              .userEntity
              .name!)),
    );
  }
}
