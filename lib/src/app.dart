import 'package:flutter/material.dart';
import 'package:pizza_app/src/animates/AnimateExample.dart';
import 'package:pizza_app/src/animates/AnimateResizingHouse.dart';
import 'package:pizza_app/src/animates/AnimateTeddy.dart';
import 'package:pizza_app/src/pages/AccountPage.dart';
import 'package:pizza_app/src/pages/CompaniesPage.dart';
import 'package:pizza_app/src/pages/SettingsPage.dart';
import 'package:pizza_app/src/pages/homePage.dart';
import 'package:pizza_app/src/pages/loginPage.dart';
import 'package:pizza_app/src/pages/orderPage.dart';
import 'package:pizza_app/src/pages/signUpPage.dart';
import 'package:pizza_app/src/theme/Theme.dart';

import 'package:provider/provider.dart';
import 'package:pizza_app/src/providers/authProvider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider.instance()),
        ChangeNotifierProvider<ThemeChanger>(
            create: (_) => ThemeChanger(ThemeData.dark())),
      ],
      child: new MaterialAppWithTheme(),
    );
  }
}

class MaterialAppWithTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme.getTheme(),
      title: 'Flutter Demo',
      initialRoute: 'setting',
      routes: {
        'login': (BuildContext context) => LoginPage(),
        'signUp': (BuildContext context) => SignUpPage(),
        'home': (BuildContext context) => HomePage(),
        'order': (BuildContext context) => OrderPage(),
        'animate-test': (BuildContext context) => AnimateExample(),
        'animate-teddy': (BuildContext context) => AnimatedTeddy(),
        'animate-resizing-house': (BuildContext context) =>
            AnimateResizingHouse(),
        'account': (context) => AccountPage(),
        'setting': (BuildContext context) => SettingsPage()
      },
    );
  }
}