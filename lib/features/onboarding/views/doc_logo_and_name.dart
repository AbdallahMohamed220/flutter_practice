import 'package:flutter/material.dart';
import 'package:flutter_application_practice/core/theme/images.dart';
import 'package:flutter_application_practice/core/theme/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DocLogoAndName extends StatelessWidget {
  const DocLogoAndName({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          AppImages.docdocLogo,
        ),
        SizedBox(width: 10.w),
        Text(
          "DocDoc",
          style: TextStyles.blackBold24,
        ),
      ],
    );
  }
}
