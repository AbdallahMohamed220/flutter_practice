import 'package:flutter/material.dart';
import 'package:flutter_application_practice/core/routing/routes.dart';
import 'package:flutter_application_practice/core/theme/styles.dart';
import 'package:flutter_application_practice/core/widgets/elevated_button.dart';
import 'package:flutter_application_practice/features/onboarding/views/doc_logo_and_name.dart';
import 'package:flutter_application_practice/features/onboarding/views/doctor_image_and_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              top: 30.h,
              bottom: 30.h,
            ),
            child: Column(
              children: [
                const DocLogoAndName(),
                SizedBox(height: 30.h),
                const DoctorImageAndText(),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 32.w,
                  ),
                  child: Text(
                    "Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.s",
                    textAlign: TextAlign.center,
                    style: TextStyles.grayRegular10,
                  ),
                ),
                SizedBox(height: 30.h),
                CustomElevatedButton(
                  label: "Get Started",
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.loginScreen);
                  },
                  textStyle: TextStyles.whiteSemiBold18,
                  elevation: 0,
                  borderRadius: 16,
                  padding: EdgeInsets.symmetric(
                    vertical: 16.h,
                  ),
                  minimumSize: Size(311.w, 52.h),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
