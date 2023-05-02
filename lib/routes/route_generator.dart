import 'package:flutter/cupertino.dart';
import 'package:safee/presentation/login/onboarding/onboarding_screen.dart';
import 'package:safee/presentation/splash_screen/splash_screen.dart';

class AppRoute {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.routeName:
        return CupertinoPageRoute(
            builder: (_) => const SplashScreen(), settings: settings);

      case OnboardingScreen.routeName:
        return CupertinoPageRoute(
            builder: (_) => const OnboardingScreen(), settings: settings);
      default:
    }
  }
}
