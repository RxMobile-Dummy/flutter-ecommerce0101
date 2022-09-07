import 'package:amazon_clone/base/base_state.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/auth/presentation/cubit/auth_manage_cubit.dart';
import 'package:amazon_clone/features/auth/presentation/cubit/auth_service_cubit.dart';
import 'package:amazon_clone/features/auth/presentation/cubit/user_detail_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../common/presentation/widgets/custom_button.dart';
import '../../../../common/presentation/widgets/custom_textfield.dart';
import '../../../../constants/utils.dart';
import '../../../../routes_name.dart';
import '../../domain/entity/auth_manage.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    // _emailController.dispose();
    // _passwordController.dispose();
    // _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: GlobalVariables.greyBackgroundColor,
        body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: MultiBlocListener(
                listeners: [
                  BlocListener<AuthServiceCubit, BaseState>(
                      listener: (context, state) {
                    if (state is StateOnSuccess) {
                      debugPrint("StateOnSuccess");
                      showSnackBar(context, state.response);
                    } else if (state is StateErrorGeneral) {
                      debugPrint("StateErrorGeneral");
                      debugPrint(state.errorMessage);
                      showSnackBar(context, state.errorMessage);
                    } else if (state is Authenticated) {
                      BlocProvider.of<UserDetailCubit>(context)
                          .setData(state.userEntity);
                    } else {
                      debugPrint("problem");
                    }
                  }),
                  BlocListener<UserDetailCubit, BaseState>(
                      listener: (context, state) {
                    if (state is StateErrorGeneral) {
                      debugPrint("StateErrorGeneral");
                      debugPrint(state.errorMessage);
                      showSnackBar(context, state.errorMessage);
                    } else if (state is Authenticated) {
                      if (state.userEntity.token!.isNotEmpty) {
                        if (state.userEntity.type == "user") {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            RoutesName.actualHome,
                            (route) => false,
                          );
                        } else {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            RoutesName.adminScreen,
                            (route) => false,
                          );
                        }
                      } else {
                        debugPrint(
                            "token is ::${state.userEntity.token.toString()}");
                      }
                    } else {
                      debugPrint("problem");
                    }
                  })
                ],
                child: BlocBuilder<AuthManageCubit, BaseState>(
                  builder: (context, state) {
                    if (state is StateOnSuccess) {
                      return SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              GlobalVariables.welcome,
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.w500),
                            ),
                            ListTile(
                              tileColor: state.response.auth == Auth.signup
                                  ? GlobalVariables.backgroundColor
                                  : GlobalVariables.greyBackgroundColor,
                              title: const Text(
                                GlobalVariables.createAccount,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              leading: Radio(
                                activeColor: GlobalVariables.secondaryColor,
                                value: Auth.signup,
                                onChanged: (dynamic value) {
                                  BlocProvider.of<AuthManageCubit>(context)
                                      .changeAuth(value as Auth);
                                },
                                groupValue: state.response.auth,
                              ),
                            ),
                            if (state.response.auth == Auth.signup)
                              Container(
                                padding: const EdgeInsets.all(8),
                                color: GlobalVariables.backgroundColor,
                                child: Form(
                                  key: _signUpFormKey,
                                  child: Column(
                                    children: [
                                      CustomTextField(
                                        textEditingController: _nameController,
                                        hintText: GlobalVariables.name,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      CustomTextField(
                                        textEditingController: _emailController,
                                        hintText: GlobalVariables.email,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      CustomTextField(
                                        isObscure: state.response.isObscure,
                                        textEditingController:
                                            _passwordController,
                                        hintText: GlobalVariables.password,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Expanded(
                                            child: ListTile(
                                              tileColor:
                                                  state.response.userType ==
                                                          UserType.user
                                                      ? GlobalVariables
                                                          .backgroundColor
                                                      : GlobalVariables
                                                          .greyBackgroundColor,
                                              title: const Text(
                                                GlobalVariables.user,
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              leading: Radio(
                                                activeColor: GlobalVariables
                                                    .secondaryColor,
                                                value: UserType.user,
                                                onChanged: (dynamic value) {
                                                  BlocProvider.of<
                                                              AuthManageCubit>(
                                                          context)
                                                      .changeUserType(
                                                          value as UserType);
                                                },
                                                groupValue:
                                                    state.response.userType,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: ListTile(
                                              tileColor:
                                                  state.response.userType ==
                                                          UserType.admin
                                                      ? GlobalVariables
                                                          .backgroundColor
                                                      : GlobalVariables
                                                          .greyBackgroundColor,
                                              title: const Text(
                                                GlobalVariables.admin,
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              leading: Radio(
                                                activeColor: GlobalVariables
                                                    .secondaryColor,
                                                value: UserType.admin,
                                                onChanged: (dynamic value) {
                                                  BlocProvider.of<
                                                              AuthManageCubit>(
                                                          context)
                                                      .changeUserType(
                                                          value as UserType);
                                                },
                                                groupValue:
                                                    state.response.userType,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      CustomButton(
                                        text: GlobalVariables.signUp,
                                        onTap: () {
                                          if (_signUpFormKey.currentState!
                                              .validate()) {
                                            BlocProvider.of<AuthServiceCubit>(
                                                    context)
                                                .signUp(
                                                    state.response.userType,
                                                    _emailController.text,
                                                    _nameController.text,
                                                    _passwordController.text);
                                          } else {
                                            debugPrint("else");
                                          }
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ListTile(
                              tileColor: state.response == Auth.signin
                                  ? GlobalVariables.backgroundColor
                                  : GlobalVariables.greyBackgroundColor,
                              title: const Text(
                                GlobalVariables.signIn,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              leading: Radio(
                                activeColor: GlobalVariables.secondaryColor,
                                value: Auth.signin,
                                onChanged: (dynamic value) {
                                  BlocProvider.of<AuthManageCubit>(context)
                                      .changeAuth(value as Auth);
                                },
                                groupValue: state.response.auth,
                              ),
                            ),
                            if (state.response.auth == Auth.signin)
                              Container(
                                padding: const EdgeInsets.all(8),
                                color: GlobalVariables.backgroundColor,
                                child: Form(
                                  key: _signInFormKey,
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      CustomTextField(
                                        textEditingController: _emailController,
                                        hintText: GlobalVariables.email,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      CustomTextField(
                                        isObscure: state.response.isObscure,
                                        textEditingController:
                                            _passwordController,
                                        hintText: GlobalVariables.password,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Expanded(
                                            child: ListTile(
                                              tileColor:
                                                  state.response.userType ==
                                                          UserType.user
                                                      ? GlobalVariables
                                                          .backgroundColor
                                                      : GlobalVariables
                                                          .greyBackgroundColor,
                                              title: const Text(
                                                GlobalVariables.user,
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              leading: Radio(
                                                activeColor: GlobalVariables
                                                    .secondaryColor,
                                                value: UserType.user,
                                                onChanged: (dynamic value) {
                                                  BlocProvider.of<
                                                              AuthManageCubit>(
                                                          context)
                                                      .changeUserType(
                                                          value as UserType);
                                                },
                                                groupValue:
                                                    state.response.userType,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: ListTile(
                                              tileColor:
                                                  state.response.userType ==
                                                          UserType.user
                                                      ? GlobalVariables
                                                          .backgroundColor
                                                      : GlobalVariables
                                                          .greyBackgroundColor,
                                              title: const Text(
                                                GlobalVariables.admin,
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              leading: Radio(
                                                activeColor: GlobalVariables
                                                    .secondaryColor,
                                                value: UserType.admin,
                                                onChanged: (dynamic value) {
                                                  BlocProvider.of<
                                                              AuthManageCubit>(
                                                          context)
                                                      .changeUserType(
                                                          value as UserType);
                                                },
                                                groupValue:
                                                    state.response.userType,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      CustomButton(
                                        text: GlobalVariables.signInButton,
                                        onTap: () {
                                          if (_signInFormKey.currentState!
                                              .validate()) {
                                            BlocProvider.of<AuthServiceCubit>(
                                                    context)
                                                .signIn(
                                                    state.response.userType,
                                                    _emailController.text
                                                        .trim(),
                                                    _passwordController.text
                                                        .trim());
                                          } else {
                                            debugPrint("else");
                                          }
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                          ],
                        ),
                      );
                    }
                    return const SizedBox();
                  },
                ),
              )),
        ));
  }
}
