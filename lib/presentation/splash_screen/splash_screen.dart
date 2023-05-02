import 'package:flutter/material.dart';
import 'package:safee/extension/widget_extension.dart';
import 'package:safee/presentation/login/onboarding/onboarding_screen.dart';
import 'package:safee/styles/asset.dart';
import 'package:safee/styles/style.dart';
import 'package:safee/util/util.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String routeName = '/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    showLoading();
    navigateToLogin();
  }

  void navigateToLogin() {
    Future.delayed(const Duration(seconds: 2), () {
      hideLoading();
      Navigator.of(context).pushNamed(OnboardingScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [lightGradient, heavyGradient])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(WALLET),
              10.0.height,
              Text(
                'Safee',
                style: heading1StyleWhite,
              ),
              7.0.height,
              Text(
                'do transactions easily.',
                style: bodyRegularStyleWhite,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
