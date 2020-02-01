
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:pizza_app/src/pages/homePage.dart';
import 'package:pizza_app/src/pages/loginPage.dart';
import 'package:pizza_app/src/pages/orderPage.dart';
import 'package:pizza_app/src/pages/signUpPage.dart';

import 'package:pizza_app/src/providers/authProvider.dart';

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider.instance())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        initialRoute: 'login',
        routes: {
          'login' : (BuildContext context) => LoginPage(),
          'signUp': (BuildContext context) => SignUpPage(),
          'home'  : (BuildContext context) => HomePage(),
          'order' : (BuildContext context) => OrderPage()
        },
      ),
    );
  }

}