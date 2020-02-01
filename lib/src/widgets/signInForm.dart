
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';
import 'package:validate/validate.dart';

import 'package:pizza_app/src/pages/signUpPage.dart';

import 'package:pizza_app/src/providers/authProvider.dart';

class SignInForm extends StatefulWidget {

  @override
  _SignInFormState createState() => _SignInFormState();

}

class _SignInData {
  String email = '';
  String password = '';
}

class _SignInFormState extends State<SignInForm> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  _SignInData _formData = new _SignInData();

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

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
            ),

            Container(
              child: RaisedButton(
                child: Text(
                  'SignIn',
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
                color: Colors.blue,
                onPressed: _signIn,
              ),
            ),

            FlatButton(
              child: Text(
                  'Sign Up for PizzaApp',
                  style: TextStyle(fontSize: 20.0)
              ),
              onPressed: moveToRegister,
            ),
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

  void _signIn() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false );

    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text('Processing Data')));

      dynamic result = await authProvider.signIn(_formData.email, _formData.password);

      if (result) {
        Navigator.pushReplacementNamed(context, 'home');
      }
    }
  }

  void moveToRegister() {
    _formKey.currentState.reset();

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignUpPage()),
    );
  }

}
