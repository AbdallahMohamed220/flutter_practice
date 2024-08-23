import 'package:flutter/material.dart';
import 'package:flutter_application_practice/core/routing/app_router.dart';
import 'package:flutter_application_practice/core/routing/routes.dart';
import 'package:flutter_application_practice/core/theme/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DocApp extends StatelessWidget {
  final AppRouter appRouter;
  const DocApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        title: "Doc App",
        theme: ThemeData(
          primaryColor: AppColors.blueColor,
          scaffoldBackgroundColor: AppColors.whiteColor,
        ),
        initialRoute: Routes.onBardingScreen,
        onGenerateRoute: appRouter.generateRoutes,
      ),
    );
  }
}
