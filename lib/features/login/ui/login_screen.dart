import 'package:flutter/material.dart';
import 'package:flutter_application_practice/core/helpers/spacing.dart';
import 'package:flutter_application_practice/core/theme/styles.dart';
import 'package:flutter_application_practice/core/widgets/elevated_button.dart';
import 'package:flutter_application_practice/core/widgets/text_form_field.dart';
import 'package:flutter_application_practice/features/login/ui/views/not_have_account.dart';
import 'package:flutter_application_practice/features/login/ui/views/terms_and_conditions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final ValueNotifier _passwordValueNotifier = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                      const CustomTextFormField(
                        hintText: 'Email',
                      ),
                      vSpacing(18),
                      ValueListenableBuilder(
                        valueListenable: _passwordValueNotifier,
                        builder: (_, __, ___) => CustomTextFormField(
                          hintText: 'Password',
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
                      CustomElevatedButton(
                        label: "Login",
                        minimumSize: Size(311.w, 52.h),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            //Navigator.pushNamed(context, Routes.homeScreen);
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
      ),
    );
  }
}
