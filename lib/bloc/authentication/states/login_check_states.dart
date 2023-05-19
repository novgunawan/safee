import 'package:safee/bloc/authentication/authentication_bloc.dart';

class LoginCheckState extends AuthenticationState {
  final bool status;

  LoginCheckState({required this.status});
  @override
  // TODO: implement props
  List<Object?> get props => [status];
}
