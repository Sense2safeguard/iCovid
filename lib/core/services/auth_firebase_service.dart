import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:iCovid/core/services/auth_service.dart';

class AuthFirebaseService extends ChangeNotifier implements AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;
  User user;

  // Stream<User> get authStateChanges => _auth.authStateChanges();

  @override
  Future signInAnon() async {
    try {
      UserCredential userCredential = await _auth.signInAnonymously();
      user = userCredential.user;
      return user;
    } on FirebaseAuthException catch (e) {
      throw Exception(e);
    }
  }
}
