part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends BaseEvent {
  const AuthenticationEvent();
}

class LoginEvent extends AuthenticationEvent {
  const LoginEvent();
  @override
  List<Object?> get props => [];
}

class LogoutEvent extends AuthenticationEvent {
  const LogoutEvent();
  @override
  List<Object?> get props => [];
}

class LoginCheckEvent extends AuthenticationEvent {
  const LoginCheckEvent();
  @override
  List<Object?> get props => [];
}

class GetUserEvent extends AuthenticationEvent {
  const GetUserEvent();
  @override
  List<Object?> get props => [];
}
