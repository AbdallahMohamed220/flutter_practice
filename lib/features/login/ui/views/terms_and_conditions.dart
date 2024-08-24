import 'package:flutter/material.dart';
import 'package:flutter_application_practice/core/theme/font_weight.dart';
import 'package:flutter_application_practice/core/theme/styles.dart';

class TermsAndConditionsText extends StatelessWidget {
  const TermsAndConditionsText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'By logging, you agree to our',
            style: TextStyles.grayRegular10.copyWith(
              fontSize: 13,
            ),
          ),
          TextSpan(
            text: ' Terms & Conditions',
            style: TextStyles.lightBlackRegular13.copyWith(
              fontWeight: FontWeightHelper.medium,
            ),
          ),
          TextSpan(
            text: ' and',
            style: TextStyles.greyRegular14.copyWith(
              fontSize: 13,
              height: 1.5,
            ),
          ),
          TextSpan(
            text: ' Privacy Policy',
            style: TextStyles.lightBlackRegular13.copyWith(
              fontWeight: FontWeightHelper.medium,
            ),
          ),
        ],
      ),
    );
  }
}
