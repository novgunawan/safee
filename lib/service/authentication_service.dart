import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:safee/base/error/error.dart';

class FirebaseService {
  var auth = FirebaseAuth.instance;
  User? user;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  Future<User?> signInWithGoogle() async {
    // *Try Signing In
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      // *Authentication Google Account
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
            await auth.signInWithCredential(credential);
        user = userCredential.user;
      } on FirebaseAuthException catch (e) {
        if (e.code == DOUBLE_CREDENTIAL) {
          throw FirebaseAuthException(
              message: DOUBLE_CREDENTIAL_MESSAGE, code: DOUBLE_CREDENTIAL);
        } else if (e.code == INVALID_CREDENTIAL) {
          throw FirebaseAuthException(
              message: INVALID_CREDENTIAL_MESSAGE, code: INVALID_CREDENTIAL);
        }
      } catch (e) {
        throw (const AppException(message: AUTHENTICATION_ERROR_MESSAGE));
      }
    }
    return user;
  }

  Future<User?> getCurrentUser() async {
    User? currentUser;
    auth.authStateChanges().map((User? user) {
      currentUser = user;
    });
    return currentUser;
  }

  Future<void> logout() async {
    await auth.signOut();
  }
}
