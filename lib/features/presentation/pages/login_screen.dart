import 'package:auto_route/auto_route.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registration_test/config/router/app_router.dart';
import 'package:registration_test/config/themes/theme_colors.dart';
import 'package:registration_test/core/core_bloc/core_blocs.dart';
import 'package:registration_test/features/presentation/blocs/login_bloc/login_bloc.dart';
import 'package:registration_test/features/presentation/widgets/appbars.dart';
import 'package:registration_test/features/presentation/widgets/buttons.dart';
import 'package:registration_test/features/presentation/widgets/text_fields.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController loginController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    loginController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CoreBlocs.login,
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginFailure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errorMessage)));
          } else if (state is LoginLoaded) {
            AutoRouter.of(context).popAndPush(MainShellRoute(
              userData: state.data,
            ));
          }
        },
        builder: (context, state) {
          bool isLoading = false;
          if (state is LoginLoading) {
            isLoading = true;
          } else {
            isLoading = false;
          }
          return WillPopScope(
            onWillPop: () async {
              return false;
            },
            child: Scaffold(
              backgroundColor: ThemeColors.formBg,
              appBar: const CommonAppBar(
                appTitleText: "Авторизация",
              ),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (!isLoading)
                    Column(
                      children: [
                        Form(
                          key: _formKey,
                          child: CupertinoFormSection(
                            children: [
                              CommonCupertinoTextField(
                                hintText: "Логин или почта",
                                controller: loginController,
                                withBorder: true,
                                validator: (value) {
                                  if (value != null && !EmailValidator.validate(value)) {
                                    return "Enter valid email";
                                  }
                                  return null;
                                },
                              ),
                              CommonCupertinoTextField(
                                obscureText: true,
                                hintText: "Пароль",
                                controller: passwordController,
                                withBorder: false,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Enter valid email password";
                                  } else if (value.length < 8) {
                                    return "Password length lower 8 digits";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                        // Form(
                        //   key: _formKey,
                        //   autovalidateMode: AutovalidateMode.always,
                        //   child: Column(
                        //     children: [
                        //       Container(
                        //         color: ThemeColors.white,
                        //         padding: const EdgeInsets.symmetric(
                        //           horizontal: 16,
                        //           vertical: 10,
                        //         ),
                        //         child: Column(
                        //           children: [
                        //             CommonCupertinoTextField(
                        //               hintText: "Логин или почта",
                        //               controller: loginController,
                        //               withBorder: true,
                        //             ),
                        //             const Divider(
                        //               color: ThemeColors.stroke,
                        //             ),
                        //             CommonCupertinoTextField(
                        //               obscureText: true,
                        //               hintText: "Пароль",
                        //               controller: passwordController,
                        //               withBorder: false,
                        //               validator: (value) {
                        //                 if (value != null) {
                        //                   if (value.isEmpty) {
                        //                     return "Password is empty";
                        //                   } else if (value.length < 8) {
                        //                     return "Password length lower 8 digits";
                        //                   } else {
                        //                     return null;
                        //                   }
                        //                 }
                        //                 return null;
                        //               },
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        const SizedBox(
                          height: 32,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: CommonCupertinoButton(
                                      buttonText: "Войти",
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          CoreBlocs.login.add(LoginGetLogin(
                                              password: passwordController.text, login: loginController.text));
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 19,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: CommonCupertinoButton(
                                      buttonText: "Зарегистрироваться",
                                      onPressed: () {},
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  else
                    const Center(child: CupertinoActivityIndicator())
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
