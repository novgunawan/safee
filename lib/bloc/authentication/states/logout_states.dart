import '../authentication_bloc.dart';

class LogoutLoadingState extends AuthenticationState {
  const LogoutLoadingState();
  @override
  List<Object> get props => [];
}

class LogoutSuccessState extends AuthenticationState {
  const LogoutSuccessState();
  @override
  List<Object> get props => [];
}

class LogoutErrorState extends AuthenticationState {
  final String message;

  const LogoutErrorState(this.message) : super();
  @override
  List<Object> get props => [message];
}
