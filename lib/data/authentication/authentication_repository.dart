import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationRepository {
  Future<User?> login();
  Future<void> logout();
  Future<String?> getCurrentUser();
  Future<void> saveLoginStatus();
}
