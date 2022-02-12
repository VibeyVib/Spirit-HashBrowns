import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:spirit/feature/home/home.dart';

class SignInBloc{
  void signIn(BuildContext context, String emailAddress, String password) async {
    String message;
    try {
      UserCredential userCredential =
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
    } on FirebaseException catch (e) {
      String message ='';

      if (e.code == 'user-not-found') {
        message = 'No user found for that email';
      } else if (e.code == 'wrong-password') {
        message = 'Wrong password provided for that user';
      }
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Invalid credentials'),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
  void signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).popUntil((route) => route.isFirst);
  }
}