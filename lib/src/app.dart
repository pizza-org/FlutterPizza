
import 'package:flutter/material.dart';
import 'package:pizza_app/src/pages/homePage.dart';

import 'package:pizza_app/src/pages/orderPage.dart';

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: 'order',
      routes: {
        'home': (BuildContext context) => HomePage(),
        'order': (BuildContext context) => OrderPage()
      },
    );
  }

}