import 'package:flutter/material.dart';
import 'package:flutter_application_practice/core/theme/colors.dart';
import 'package:flutter_application_practice/core/theme/images.dart';
import 'package:flutter_application_practice/core/theme/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DoctorImageAndText extends StatelessWidget {
  const DoctorImageAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset(
          AppImages.logoLowOpacity,
        ),
        Positioned(
          top: 0,
          bottom: 0,
          child: Container(
            foregroundDecoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.white,
                  AppColors.white.withOpacity(0.0),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: const [0.14, 0.4],
              ),
            ),
            child: Image.asset(
              AppImages.onboardingDoctor,
            ),
          ),
        ),
        Positioned(
          bottom: 21.h,
          left: 0,
          right: 0,
          child: Text(
            "Best Doctor \nAppointment App",
            textAlign: TextAlign.center,
            style: TextStyles.blueBold32.copyWith(
              height: 1.4.h,
            ),
          ),
        ),
      ],
    );
  }
}
