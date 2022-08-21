import 'package:bookjuice/services/auth.dart';
import 'package:flutter/material.dart';

class AuthController with ChangeNotifier {
  final AuthBase auth;
  String email;
  String password;

  AuthController({required this.auth, this.email = "", this.password = ""});

  Future<void> submitLogin() async {

      auth.loginWithEmailAndPassword(email, password);
   
  }

  Future<void> submitRegister() async {

      auth.registerWithEmailAndPassword(email, password);
   
  }

  void updateEmail(String email) => copyWith(email: email);

  void updatePassword(String password) => copyWith(password: password);
  void copyWith({
    String? email,
    String? password,
  }) {
    this.email = email ?? this.email;
    this.password = password ?? this.password;
    notifyListeners();
  }
    Future<void> logout() async {
    try {
      await auth.logOut();
    } catch (e) {
      rethrow;
    }
  }
}
