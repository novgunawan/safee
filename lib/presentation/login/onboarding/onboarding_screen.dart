import 'package:flutter/material.dart';
import 'package:safee/extension/widget_extension.dart';
import 'package:safee/presentation/widgets/button/button.dart';
import 'package:safee/styles/asset.dart';
import 'package:safee/styles/style.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});
  static const String routeName = '/login';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          115.0.height,
          Text('Welcome to', style: heading1StylePurple),
          Text(
            'Safee',
            style: heading1StyleBlack,
          ),
          90.0.height,
          Image.asset(ONBOARDING_0),
          PrimaryButton(
            title: 'Sign Up',
            isPurple: true,
            callback: () {
              debugPrint("button ini diklik");
            },
          ),
          PrimaryButton(
            title: 'Log in',
            isPurple: false,
            callback: () {
              debugPrint("button login ditap");
            },
          )
        ],
      ),
    ));
  }
}
