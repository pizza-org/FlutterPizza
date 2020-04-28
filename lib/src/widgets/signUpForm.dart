
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pizza_app/src/pages/loginPage.dart';

import 'package:provider/provider.dart';
import 'package:validate/validate.dart';

import 'package:pizza_app/src/widgets/customAlertDialog.dart';
import 'package:pizza_app/src/widgets/progressDialog.dart';
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
    return Container(
      padding: EdgeInsets.all(30.0),
      child: Form(
        autovalidate: _autovalidate,
        key: _formKey,
        child: Column(
          children: <Widget> [
            TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
              keyboardType: TextInputType.emailAddress,
              validator: _emailValidation,
              onSaved: (value) => _formData.email = value.trim()
            ),

            SizedBox(height: 22.0),

            TextFormField(
              decoration: InputDecoration(
                labelText: 'Contraseña',
              ),
              keyboardType: TextInputType.text,
              obscureText: true,
              validator: _passwordValidation,
              onChanged: (value) => _formData.password = value.trim(),
              onSaved: (value) => _formData.password = value.trim()
            ),

            SizedBox(height: 22.0),

            TextFormField(
              decoration: InputDecoration(
                labelText: 'Confirmar contraseña',
              ),
              keyboardType: TextInputType.text,
              obscureText: true,
              validator: (value) => _passwordConfirmValidation(value, this._formData.password),
            ),

            SizedBox(height: 22.0),

            SizedBox(
              width: 200.0,
              height: 45.0,
              child: RaisedButton(
                child: Text(
                  'Registrar',
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0),
                    side:
                    BorderSide(color: Theme.of(context).accentColor)),
                color: Theme.of(context).accentColor,
                onPressed: _signUp,
              )
            ),

            SizedBox(height: 12.0),

            FlatButton(
              child: Text(
                'Ya tengo cuenta',
                style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontSize: 16.0
                )
              ),
              onPressed: _moveToLogin,
            ),
          ],
        )
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

  void _moveToLogin() {
    _formKey.currentState.reset();

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

}
