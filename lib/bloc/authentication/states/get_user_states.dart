import 'package:firebase_auth/firebase_auth.dart';
import 'package:safee/bloc/authentication/authentication_bloc.dart';

class GetUserLoadingState extends AuthenticationState {
  const GetUserLoadingState();

  @override
  List<Object?> get props => [];
}

class GetUserSuccessState extends AuthenticationState {
  final User? user;

  const GetUserSuccessState(this.user) : super();
  @override
  List<Object?> get props => [];
}

class GetUserFailedState extends AuthenticationState {
  final String message;

  const GetUserFailedState(this.message) : super();
  @override
  List<Object?> get props => [];
}
