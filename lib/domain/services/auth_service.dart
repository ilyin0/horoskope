import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthService {
  Stream<User?> get authUserStream;

  Future<String?> signUpWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<String?> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<String?> signInAnonymously();

  void signOut();
}
