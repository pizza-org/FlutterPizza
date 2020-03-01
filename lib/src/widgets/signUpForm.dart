
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:pizza_app/src/widgets/customAlertDialog.dart';
import 'package:pizza_app/src/widgets/progressDialog.dart';

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
  bool _autovalidate = false;

  @override
  Widget build(BuildContext context) {
    return Form(
        autovalidate: _autovalidate,
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
              onSaved: (value) => _formData.email = value.trim()
            ),

            TextFormField(
              decoration: InputDecoration(
                  icon: Icon(Icons.lock),
                  labelText: 'Password'
              ),
              keyboardType: TextInputType.text,
              obscureText: true,
              validator: _passwordValidation,
              onChanged: (value) => _formData.password = value.trim(),
              onSaved: (value) => _formData.password = value.trim()
            ),

            TextFormField(
              decoration: InputDecoration(
                  icon: Icon(Icons.lock),
                  labelText: 'Confirm password'
              ),
              keyboardType: TextInputType.text,
              obscureText: true,
              validator: (value) => _passwordConfirmValidation(value, this._formData.password),
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
      Validate.isEmail(value.trim(), 'The E-mail Address must be a valid email address.');
    } catch (e) {
      return e.message;
    }

    return null;
  }

  String _passwordValidation(String value) {
    try {
      Validate.isPassword(value, 'Must contain uppercase, @#\$%? and must have a size of 8 to 15');
    } catch (e) {
      return e.message;
    }

    return null;
  }

  String _passwordConfirmValidation(String value, String password) {
    if (value != password) {
      return 'The passwords don\'t match, try again';
    }

    return null;
  }

  void _signUp() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      ProgressDialog progressDialog = new ProgressDialog(context);
      progressDialog.show();

      try {
        final authProvider = Provider.of<AuthProvider>(context, listen: false);
        await authProvider.signUp(_formData.email, _formData.password);

        progressDialog.hide();

        Navigator.pushReplacementNamed(context, 'home');
      } catch(e) {
        progressDialog.hide();

        CustomAlertDialog.show(context, 'Ups', e.message);
      }

    } else {
      setState(() {
        _autovalidate = true;
      });
    }
  }

}
