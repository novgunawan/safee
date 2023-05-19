import 'dart:convert';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safee/base/bloc/base_event.dart';
import 'package:safee/base/bloc/base_state.dart';
import 'package:safee/base/error/error_code.dart';
import 'package:safee/base/error/error_message.dart';
import 'package:safee/bloc/authentication/states/get_user_states.dart';
import 'package:safee/bloc/authentication/states/login_check_states.dart';
import 'package:safee/data/authentication/authentication_repository.dart';
import 'package:safee/data/authentication/model/firebase_user_response.dart';

import 'states/login_states.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository _authenticationRepository;
  AuthenticationBloc(this._authenticationRepository)
      : super(AuthenticationInitial()) {
    on<LoginEvent>(_onLogin, transformer: sequential());
    on<LogoutEvent>(_onLogout, transformer: sequential());
    on<LoginCheckEvent>(_onCheckLogin, transformer: sequential());
    on<GetUserEvent>(_onGetCurrentUser, transformer: sequential());
  }

  Future<void> _onLogin(
      AuthenticationEvent event, Emitter<AuthenticationState> emit) async {
    emit(const LoginLoadingState());

    try {
      User? user = await _authenticationRepository.login();

      if (user == null) {
        emit(const LoginErrorState(LOGIN_ERROR_MESSAGE));
      } else {
        emit(LoginSuccessState(user));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == DOUBLE_CREDENTIAL) {
        emit(const LoginErrorState(DOUBLE_CREDENTIAL_MESSAGE));
      } else if (e.code == INVALID_CREDENTIAL) {
        emit(const LoginErrorState(INVALID_CREDENTIAL_MESSAGE));
      }
    } catch (e) {
      emit(const LoginErrorState(AUTHENTICATION_ERROR_MESSAGE));
    }
  }

  Future<void> _onLogout(
      LogoutEvent event, Emitter<AuthenticationState> emit) async {
    await _authenticationRepository.logout();
  }

  Future<void> _onCheckLogin(
      LoginCheckEvent event, Emitter<AuthenticationState> emit) async {
    String? currentUser = await _authenticationRepository.getCurrentUser();

    bool isLogin = currentUser != null;
    emit(LoginCheckState(status: isLogin));
  }

  Future<void> _onGetCurrentUser(
      GetUserEvent event, Emitter<AuthenticationState> emit) async {
    emit(GetUserLoadingState());
    String? currentUser = await _authenticationRepository.getCurrentUser();
    if (currentUser != null) {
      FirebaseUserResponse objectUser =
          FirebaseUserResponse.fromJson(jsonDecode(currentUser));

      emit(GetUserSuccessState(objectUser));
    } else {
      emit(const GetUserFailedState(GET_USER_ERROR_MESSAGE));
    }
  }
}
