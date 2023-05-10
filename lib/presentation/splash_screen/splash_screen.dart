import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safee/bloc/authentication/authentication_bloc.dart';
import 'package:safee/bloc/authentication/states/get_user_states.dart';
import 'package:safee/extension/widget_extension.dart';
import 'package:safee/presentation/login/onboarding/onboarding_screen.dart';
import 'package:safee/presentation/navigation_bar/navigation_bar.dart';
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
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listenWhen: (previous, state) {
        return state is GetUserSuccessState ||
            state is GetUserFailedState ||
            state is GetUserLoadingState;
      },
      listener: (context, state) {
        if (state is GetUserLoadingState) {
          showLoading();
        } else if (state is GetUserSuccessState) {
          navigateToHome();
        } else if (state is GetUserFailedState) {
          // navigateToLogin();
          navigateToHome();
        }
      },
      child: Container(
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
                Image.asset(WALLET_IMAGE),
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
      ),
    );
  }

  void getCurrentUser() async {
    context.read<AuthenticationBloc>().add(const GetUserEvent());
  }

  void navigateToLogin() {
    Future.delayed(const Duration(seconds: 1), () {
      hideLoading();
      Navigator.of(context).pushNamed(OnboardingScreen.routeName);
    });
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 1), () {
      hideLoading();
      Navigator.of(context).pushNamed(Tabbar.routeName);
    });
  }
}
