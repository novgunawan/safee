import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safee/bloc/authentication/authentication_bloc.dart';
import 'package:safee/bloc/authentication/states/login_states.dart';
import 'package:safee/extension/widget_extension.dart';
import 'package:safee/presentation/home/home_screen.dart';
import 'package:safee/presentation/reusable_widgets/button/button.dart';
import 'package:safee/styles/asset.dart';
import 'package:safee/styles/style.dart';
import 'package:safee/styles/text_style.dart';
import 'package:safee/util/toast_utils.dart';
import 'package:safee/util/util.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const String routeName = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthenticationBloc, AuthenticationState>(
        listenWhen: (previous, state) {
          return state is LoginLoadingState ||
              state is LoginSuccessState ||
              state is LoginErrorState;
        },
        listener: (context, state) {
          if (state is LoginLoadingState) {
            showLoading();
          } else if (state is LoginSuccessState) {
            hideLoading();
            Navigator.of(context).pushNamed(HomeScreen.routeName);
          } else if (state is LoginErrorState) {
            hideLoading();
            showToast(state.message);
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              60.0.height,
              Text(
                'Welcome Back!',
                style: heading1StyleBlack,
              ),
              const Spacer(),
              Center(
                child: Image.asset(LOGIN_IMAGE),
              ),
              const Spacer(),
              PrimaryButtonWithImage(
                  title: 'Sign in with Google',
                  isPurple: true,
                  callback: login,
                  image: GOOGLE_IMAGE)
            ],
          ),
        ),
      ),
    );
  }

  void login() async {
    context.read<AuthenticationBloc>().add(const LoginEvent());
  }
}
