import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:safee/data/authentication/authentication_repository.dart';
import 'package:safee/data/authentication/model/firebase_user_response.dart';
import 'package:safee/data/const/strings.dart';
import 'package:safee/service/authentication_service.dart';
import 'package:safee/service/secure_storage_service.dart';

class AuthenticationDataProvider implements AuthenticationRepository {
  // TODO: inject this using Dependency Injection
  final FirebaseService _firebaseService = FirebaseService();
  final SecureStorageService _secureStorageService;

  AuthenticationDataProvider(this._secureStorageService);
  @override
  Future<User?> login() async {
    return _firebaseService.signInWithGoogle().then((user) async {
      var currentUser = FirebaseUserResponse(
          user?.displayName ?? '', user?.email ?? '', user?.photoURL ?? '');
      await _secureStorageService.saveString(
          key: USER_INFO_KEY, value: jsonEncode(currentUser));
      return user;
    }).catchError((error) =>
        throw FirebaseAuthException(code: error.code, message: error.message));
  }

  @override
  Future<void> logout() async {
    await _secureStorageService.saveBool(key: LOGIN_STATUS_KEY, value: false);

    return _firebaseService.logout();
  }

  @override
  Future<String?> getCurrentUser() async {
    return _secureStorageService.getString(key: USER_INFO_KEY);
  }

  @override
  Future<void> saveLoginStatus() async {
    await _secureStorageService.saveBool(key: LOGIN_STATUS_KEY, value: true);
  }
}
