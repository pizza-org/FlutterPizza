import 'package:flutter/material.dart';
import 'package:pizza_app/src/animates/AnimateExample.dart';
import 'package:pizza_app/src/animates/AnimateResizingHouse.dart';
import 'package:pizza_app/src/animates/AnimateTeddy.dart';
import 'package:pizza_app/src/pages/AccountPage.dart';
import 'package:pizza_app/src/pages/homePage.dart';

import 'package:pizza_app/src/pages/orderPage.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: 'home',
      routes: {
        'home': (BuildContext context) => HomePage(),
        'order': (BuildContext context) => OrderPage(),
        'animate-test': (BuildContext context) => AnimateExample(),
        'animate-teddy': (BuildContext context) => AnimatedTeddy(),
        'animate-resizing-house': (BuildContext context) =>
            AnimateResizingHouse(),
        'account': (context) => AccountPage(),
      },
    );
  }
}
