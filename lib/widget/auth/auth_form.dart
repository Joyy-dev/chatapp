import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({super.key});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Form(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email Address'
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Username'
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Password'
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 10,),
                  ElevatedButton(
                    onPressed: () {}, 
                    child: Text('Login')
                  ),
                  TextButton(
                    onPressed: () {}, 
                    child: Text('Create New Account')
                  )
                ],
              ), 
            )
          ),
        ),
      ),
    );
  }
}