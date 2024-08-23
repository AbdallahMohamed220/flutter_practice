import 'package:flutter/material.dart';
import 'package:flutter_application_practice/core/theme/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles {
  static TextStyle blackBold24 = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.blackColor,
  );

  static TextStyle blueBold32 = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.blueColor,
  );

  static TextStyle grayRegular10 = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.greyColor,
  );

  static TextStyle whiteSemiBold18 = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor,
  );
}
