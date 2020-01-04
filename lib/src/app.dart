
import 'package:flutter/material.dart';

import 'package:pizza_app/src/pages/order_page.dart';

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: 'order',
      routes: {
        'order': (context) => OrderPage()
      },
    );
  }

}