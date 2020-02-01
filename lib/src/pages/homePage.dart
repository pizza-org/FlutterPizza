
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:pizza_app/src/providers/authProvider.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: <Widget>[
          RaisedButton(
            child: Text('Logout'),
            onPressed: () => _logout(context),
          )
        ],
      ),
      body: Container(
        child: Center(
          child: Text('Home Page'),
        ),
      ),
    );
  }

  void _logout(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    authProvider.signOut();

    Navigator.pushReplacementNamed(context, 'login');
  }

}
