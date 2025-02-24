import 'package:chatapp/widget/auth/auth_form.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _auth = FirebaseAuth.instance;

  void _submitAuthForm(
    String email, 
    String password, 
    String username, 
    bool isLogin,
    BuildContext ctx
  ) async {
    UserCredential authresult;
    try {
      if (isLogin) {
       authresult = await _auth.signInWithEmailAndPassword(email: email, password: password);
      } else{
       authresult = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      }
    } on FirebaseException catch(error) {
      var message = 'An error occurred, please check your credentials!';
      if (error.message != null) {
        message = error.message!;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Colors.red,
        )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: AuthForm(_submitAuthForm),
    );
  }
}