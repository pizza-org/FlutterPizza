
import 'package:flutter/material.dart';

import 'package:pizza_app/src/widgets/signInForm.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: SignInForm()
        )
    );
  }
}
