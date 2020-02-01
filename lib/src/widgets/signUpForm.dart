
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';
import 'package:validate/validate.dart';

import 'package:pizza_app/src/providers/authProvider.dart';

class SignUpForm extends StatefulWidget {

  @override
  _SignUpFormState createState() => _SignUpFormState();

}

class _SignUpData {
  String email = '';
  String password = '';
}

class _SignUpFormState extends State<SignUpForm> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  _SignUpData _formData = new _SignUpData();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: <Widget> [
            TextFormField(
              autofocus: true,
              decoration: InputDecoration(
                icon: Icon(Icons.email),
                labelText: 'Email'
              ),
              keyboardType: TextInputType.emailAddress,
              validator: _emailValidation,
              onSaved: (value) => _formData.email = value.toString().trim()
            ),

            TextFormField(
              autofocus: true,
              decoration: InputDecoration(
                  icon: Icon(Icons.lock),
                  labelText: 'Password'
              ),
              keyboardType: TextInputType.text,
              obscureText: true,
              validator: _isNotEmptyValidation,
              onSaved: (value) => _formData.password = value
            ),

            TextFormField(
              autofocus: true,
              decoration: InputDecoration(
                  icon: Icon(Icons.lock),
                  labelText: 'Confirm password'
              ),
              keyboardType: TextInputType.text,
              obscureText: true,
              validator: _isNotEmptyValidation,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
            ),

            Container(
              child: RaisedButton(
                child: Text(
                  'SignUp',
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
                color: Colors.blue,
                onPressed: _signUp,
              ),
            )
          ],
        )
    );
  }

  String _emailValidation(String value) {
    try {
    } catch (e) {
      return 'The E-mail Address must be a valid email address.';
    }

    return null;
  }

  String _isNotEmptyValidation(String value) {
    try {
      Validate.notEmpty(value);
    } catch (e) {
      return 'The Field is required.';
    }

    return null;
  }

  void _signUp() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text('Processing Data')));

      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      dynamic result = await authProvider.signUp(_formData.email, _formData.password);

      if (result) {
        Navigator.pushReplacementNamed(context, 'home');
      }
    }
  }

}
