import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:remed_sem5/home_page.dart';

class AuthHelper {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future loginEmail(
    BuildContext context, {
    required String email,
    required String password,
  }) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
        builder: (context) {
          return HomePage();
        },
      ), (route) => false);
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print("Not Found");
      } else if (e.code == "wrong-password") {
        print("Wrong Password");
      } else {
        print(e.code);
      }
    }
  }

  Future signOut() async {
    await auth.signOut();
  }
}
