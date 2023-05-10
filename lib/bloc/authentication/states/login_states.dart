// LOGIN
import 'package:firebase_auth/firebase_auth.dart';

import '../authentication_bloc.dart';

class LoginLoadingState extends AuthenticationState {
  const LoginLoadingState();
  @override
  List<Object> get props => [];
}

class LoginSuccessState extends AuthenticationState {
  final User user;
  const LoginSuccessState(this.user) : super();
  @override
  List<Object> get props => [user];
}

class LoginErrorState extends AuthenticationState {
  final String message;

  const LoginErrorState(this.message) : super();
  @override
  List<Object> get props => [];
}
