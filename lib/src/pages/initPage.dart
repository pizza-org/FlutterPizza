
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:pizza_app/src/pages/loginPage.dart';
import 'package:pizza_app/src/pages/signUpPage.dart';
import 'package:pizza_app/src/widgets/logoContainer.dart';

class InitPage extends StatefulWidget {

  @override
  _InitPageState createState() => _InitPageState();

}

class _InitPageState extends State<InitPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(30.0),
          child: Column(
            children: <Widget>[
              LogoContainer(),

              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
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
                          side:
                          BorderSide(color: Theme.of(context).accentColor)),
                        color: Theme.of(context).accentColor,
                        onPressed: _moveToLogin,
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
                ),
              )
            ],
          ),
        )
      )
    );
  }

  void _moveToLogin() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  void _moveToRegister() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignUpPage()),
    );
  }

}
