import 'package:flutter/material.dart';
import 'package:flutter_application_practice/core/di/dependency_injection.dart';
import 'package:flutter_application_practice/core/helpers/extensions.dart';
import 'package:flutter_application_practice/core/helpers/spacing.dart';
import 'package:flutter_application_practice/core/routing/routes.dart';
import 'package:flutter_application_practice/core/theme/styles.dart';
import 'package:flutter_application_practice/core/widgets/elevated_button.dart';
import 'package:flutter_application_practice/core/widgets/text_form_field.dart';
import 'package:flutter_application_practice/features/login/data/models/login_request_body.dart';
import 'package:flutter_application_practice/features/login/logic/cubit/login_cubit.dart';
import 'package:flutter_application_practice/features/login/logic/cubit/login_state.dart';
import 'package:flutter_application_practice/features/login/ui/views/not_have_account.dart';
import 'package:flutter_application_practice/features/login/ui/views/terms_and_conditions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoginCubit>(),
      child: const Scaffold(
        body: Content(),
      ),
    );
  }
}

class Content extends StatefulWidget {
  const Content({super.key});

  @override
  State<Content> createState() => _ContentState();
}

class _ContentState extends State<Content> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final ValueNotifier _passwordValueNotifier = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 30.w,
          vertical: 30.h,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome Back",
                style: TextStyles.blueBold24,
              ),
              vSpacing(8.h),
              Text(
                "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
                style: TextStyles.greyRegular14,
              ),
              vSpacing(36),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextFormField(
                      hintText: 'Email',
                      controller: _emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                    ),
                    vSpacing(18),
                    ValueListenableBuilder(
                      valueListenable: _passwordValueNotifier,
                      builder: (_, __, ___) => CustomTextFormField(
                        hintText: 'Password',
                        controller: _passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                        obscureText: _passwordValueNotifier.value,
                        suffixIcon: _passwordValueNotifier.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                        onSuffixIconTap: () {
                          _passwordValueNotifier.value =
                              !_passwordValueNotifier.value;
                        },
                      ),
                    ),
                    vSpacing(24),
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Text(
                        "Forgot Password?",
                        style: TextStyles.blueRegular13,
                      ),
                    ),
                    vSpacing(24),
                    BlocListener<LoginCubit, LoginState>(
                      listener: (stateContext, state) {
                        state.whenOrNull(
                          success: (response) {
                            Navigator.pushNamed(
                                stateContext, Routes.homeScreen);
                          },
                          error: (message) {
                            context.pop();
                            return showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  icon: const Icon(
                                    Icons.error,
                                    color: Colors.red,
                                  ),
                                  content: Text(message),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('Ok'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          loading: () {
                            return showDialog(
                              context: context,
                              builder: (context) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              },
                            );
                          },
                        );
                      },
                      child: const SizedBox.shrink(),
                    ),
                    CustomElevatedButton(
                      label: "Login",
                      minimumSize: Size(311.w, 52.h),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<LoginCubit>().login(
                                LoginRequestBody(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                ),
                              );
                        }
                      },
                    ),
                    vSpacing(24),
                    const TermsAndConditionsText(),
                    vSpacing(35),
                    const NotHaveAccountText(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
