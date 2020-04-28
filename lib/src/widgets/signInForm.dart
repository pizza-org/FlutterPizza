
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';
import 'package:validate/validate.dart';

import 'package:pizza_app/src/pages/signUpPage.dart';
import 'package:pizza_app/src/providers/authProvider.dart';
import 'package:pizza_app/src/widgets/customAlertDialog.dart';
import 'package:pizza_app/src/widgets/progressDialog.dart';

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
    return Container(
      padding: EdgeInsets.all(30.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Email',
              ),
              keyboardType: TextInputType.emailAddress,
              validator: _emailValidation,
              onSaved: (value) => _formData.email = value.toString().trim()
            ),

            SizedBox(height: 22.0),

            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Contraseña',
              ),
              keyboardType: TextInputType.text,
              obscureText: true,
              validator: _passwordValidation,
              onSaved: (value) => _formData.password = value
            ),

            SizedBox(height: 22.0),

            SizedBox(
              width: 200.0,
              height: 45.0,
              child: RaisedButton(
                child: Text(
                  'Iniciar sesión',
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(20.0),
                  side: BorderSide(color: Theme.of(context).accentColor)),
                color: Theme.of(context).accentColor,
                onPressed: _signIn,
              )
            ),

            SizedBox(height: 12.0),

            FlatButton(
              child: Text(
                  'No tengo cuenta',
                  style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontSize: 16.0)
                  ),
              onPressed: _moveToRegister,
            ),
          ],
        )
      )
    );
  }

  String _emailValidation(String value) {
    try {
      Validate.isEmail(
          value.trim(), 'The E-mail Address must be a valid email address.');
    } catch (e) {
      return e.message;
    }

    return null;
  }

  String _passwordValidation(String value) {
    try {
      Validate.notEmpty(value);
    } catch (e) {
      return 'The Field is required.';
    }

    return null;
  }

  void _signIn() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      final ProgressDialog progressDialog = new ProgressDialog(context);
      progressDialog.show();

      try {
        final authProvider = Provider.of<AuthProvider>(context, listen: false);
        await authProvider.signIn(_formData.email, _formData.password);

        progressDialog.hide();

        Navigator.pushReplacementNamed(context, 'home');
      } catch (e) {
        progressDialog.hide();

        CustomAlertDialog.show(context, 'Ups', e.message);
      }
    }
  }

  void _moveToRegister() {
    _formKey.currentState.reset();

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignUpPage()),
    );
  }

}
