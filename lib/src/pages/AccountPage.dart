import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _fondoApp(),
          Column(
            children: <Widget>[
              Text(
                'Cuenta',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _fondoApp() {
    return Container(
      width: double.infinity,
      height: double.infinity,
    );
  }
}
