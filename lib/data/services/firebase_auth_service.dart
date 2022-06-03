import 'package:firebase_auth/firebase_auth.dart';
import 'package:horoskope/domain/services/auth_service.dart';

class FirebaseAuthService implements AuthService {
  @override
  Stream<User?> get authUserStream => FirebaseAuth.instance.authStateChanges();

  @override
  User? get currentUser => FirebaseAuth.instance.currentUser;

  @override
  Future<String?> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }

  @override
  Future<String?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user.';
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }

  @override
  Future<String?> signInAnonymously() async {
    try {
      await FirebaseAuth.instance.signInAnonymously();
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "operation-not-allowed":
          return "Anonymous auth hasn't been enabled for this project.";
        default:
          rethrow;
      }
    }
    return null;
  }

  @override
  void signOut() => FirebaseAuth.instance.signOut();
}
