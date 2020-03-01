
import 'package:flutter/material.dart';

import 'package:pizza_app/src/widgets/signUpForm.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SignUpForm(),
        ),
      ),
    );
  }
}
