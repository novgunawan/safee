import 'package:firebase_auth/firebase_auth.dart';
import 'package:safee/data/authentication/authentication_repository.dart';
import 'package:safee/service/authentication_service.dart';

class AuthenticationDataProvider implements AuthenticationRepository {
  // TODO: inject this using Dependency Injection
  final FirebaseService _firebaseService = FirebaseService();
  @override
  Future<User?> login() {
    return _firebaseService.signInWithGoogle().then((user) => user).catchError(
        (error) => throw FirebaseAuthException(
            code: error.code, message: error.message));
  }

  @override
  Future<void> logout() {
    return _firebaseService.logout();
  }

  @override
  Future<User?> getCurrentUser() {
    return _firebaseService.getCurrentUser();
  }
}
