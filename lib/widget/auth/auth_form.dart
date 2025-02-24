import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  const AuthForm(this.submitFn, {super.key});

  final void Function (
    String email,
    String password,
    String username,
    bool isLogin,
    BuildContext ctx
  ) submitFn;

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  var _email = '';
  var _username = '';
  var _password = '';
  var _isLogin = true;

  void _trySubmit() {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState!.save();
    }
    widget.submitFn(
      _email,
      _password,
      _username,
      _isLogin,
      context
    );
  }


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    key: ValueKey('emaIL'),
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email Address'
                    ),
                    validator: (value) {
                      if (value == null || !value.contains('@')) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _email = value ?? '';
                    },
                  ),
                  if (!_isLogin)
                  TextFormField(
                    key: ValueKey('username'),
                    decoration: InputDecoration(
                      labelText: 'Username'
                    ),
                    validator: (value) {
                      if (value == null || value.length < 4) {
                        return 'Please enter a valid username (at least 4 characters)';
                      }
                      return null;
                    },
                    onSaved: (Value) {
                      _username = Value ?? '';
                    },
                  ),
                  TextFormField(
                    key: ValueKey('password'),
                    decoration: InputDecoration(
                      labelText: 'Password'
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.length < 8) {
                        return 'Password must be at least 8 characters long';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _password = value ?? '';
                    },
                  ),
                  const SizedBox(height: 10,),
                  ElevatedButton(
                    onPressed: _trySubmit, 
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