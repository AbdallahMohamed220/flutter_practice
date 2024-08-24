import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_practice/core/theme/styles.dart';

class NotHaveAccountText extends StatelessWidget {
  const NotHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Don\'t have an account?',
            style: TextStyles.lightBlackRegular13,
          ),
          TextSpan(
            text: ' Sign Up',
            style: TextStyles.blueSemiBold13,
            recognizer: TapGestureRecognizer()..onTap = () {},
          ),
        ],
      ),
    );
  }
}
