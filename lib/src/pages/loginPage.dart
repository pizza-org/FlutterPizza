
import 'package:flutter/material.dart';

import 'package:pizza_app/src/widgets/logoContainer.dart';
import 'package:pizza_app/src/widgets/signInForm.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
                LogoContainer(),

                SignInForm()
            ],
          ),
        )
      )
    );
  }
}
