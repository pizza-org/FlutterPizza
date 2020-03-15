import 'package:flutter/material.dart';
import 'package:pizza_app/src/animates/AnimateExample.dart';
import 'package:pizza_app/src/animates/AnimateResizingHouse.dart';
import 'package:pizza_app/src/animates/AnimateTeddy.dart';
import 'package:pizza_app/src/pages/AccountPage.dart';
import 'package:pizza_app/src/pages/CompaniesPage.dart';
import 'package:pizza_app/src/pages/homePage.dart';
import 'package:pizza_app/src/pages/loginPage.dart';
import 'package:pizza_app/src/pages/orderPage.dart';
import 'package:pizza_app/src/pages/signUpPage.dart';

import 'package:provider/provider.dart';
import 'package:pizza_app/src/providers/authProvider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
            create: (_) => AuthProvider.instance())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        initialRoute: 'login',
        routes: {
          'login': (BuildContext context) => LoginPage(),
          'signUp': (BuildContext context) => SignUpPage(),
          'home': (BuildContext context) => HomePage(),
          'order': (BuildContext context) => OrderPage(),
          'companies': (BuildContext context) => CompaniesPage(),
          'animate-test': (BuildContext context) => AnimateExample(),
          'animate-teddy': (BuildContext context) => AnimatedTeddy(),
          'animate-resizing-house': (BuildContext context) =>
              AnimateResizingHouse(),
          'account': (context) => AccountPage(),
        },
      ),
    );
  }
}
