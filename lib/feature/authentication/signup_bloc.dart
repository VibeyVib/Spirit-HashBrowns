import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:spirit/feature/home/home.dart';

class SignUpBloc{
FirebaseAuth auth=FirebaseAuth.instance;

Future<void> signUp(BuildContext context, String emailAddress, String password)  async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailAddress,
      password: password,
    );
    String uid=userCredential.user!.uid;
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      Widget okButton = TextButton(
        child: Text("OK"),
        onPressed: () { },
      );

      // set up the AlertDialog
      AlertDialog alert = AlertDialog(
        title: Text("Oh no! Try again"),
        content: Text("The passport provided is too weak"),
        actions: [
          okButton,
        ],
      );

      // show the dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
      //print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      Widget okButton = TextButton(
        child: Text("OK"),
        onPressed: () { },
      );

      // set up the AlertDialog
      AlertDialog alert = AlertDialog(
        title: Text("Oh no! Try again"),
        content: Text("The account already exists for that Email ID"),
        actions: [
          okButton,
        ],
      );

      // show the dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
      //print('The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }
}
}