import 'package:flutter/cupertino.dart';
import 'package:safee/presentation/home/home_screen.dart';
import 'package:safee/presentation/login/login_screen.dart';
import 'package:safee/presentation/login/onboarding/onboarding_screen.dart';
import 'package:safee/presentation/splash_screen/splash_screen.dart';
import 'package:safee/presentation/navigation_bar/navigation_bar.dart';

class AppRoute {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.routeName:
        return CupertinoPageRoute(
            builder: (_) => const SplashScreen(), settings: settings);
      case LoginScreen.routeName:
        return CupertinoPageRoute(
            builder: (_) => const LoginScreen(), settings: settings);
      case OnboardingScreen.routeName:
        return CupertinoPageRoute(
            builder: (_) => const OnboardingScreen(), settings: settings);
      case HomeScreen.routeName:
        return CupertinoPageRoute(
            builder: (_) => const HomeScreen(), settings: settings);

      case Tabbar.routeName:
        return CupertinoPageRoute(
            builder: (_) => const Tabbar(), settings: settings);
      default:
        return CupertinoPageRoute(
            builder: (_) => Container(), settings: settings);
    }
  }
}
