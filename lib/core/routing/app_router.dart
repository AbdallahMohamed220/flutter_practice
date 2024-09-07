import 'package:flutter/material.dart';
import 'package:flutter_application_practice/core/routing/routes.dart';
import 'package:flutter_application_practice/features/home/ui/home.dart';
import 'package:flutter_application_practice/features/login/ui/login_screen.dart';
import 'package:flutter_application_practice/features/onboarding/onboarding_screen.dart';

class AppRouter {
  Route generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBardingScreen:
        return MaterialPageRoute(
          builder: (context) => const OnboardingScreen(),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          ),
        );
    }
  }
}
