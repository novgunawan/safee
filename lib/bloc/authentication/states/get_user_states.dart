import 'package:safee/bloc/authentication/authentication_bloc.dart';
import 'package:safee/data/authentication/model/firebase_user_response.dart';

class GetUserLoadingState extends AuthenticationState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class GetUserSuccessState extends AuthenticationState {
  final FirebaseUserResponse user;

  const GetUserSuccessState(this.user);

  @override
  // TODO: implement props
  List<Object?> get props => [user];
}

class GetUserFailedState extends AuthenticationState {
  final String message;

  const GetUserFailedState(this.message);
  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
