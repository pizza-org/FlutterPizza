import 'package:flutter/material.dart';
import 'package:pizza_app/src/pages/AccountPage.dart';
import 'package:pizza_app/src/pages/OrdersPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      // la ruta de tu pagina
      // en mi caso account
      initialRoute: 'orders',
      routes: {
        'account': (context) => AccountPage(),
        'orders': (context) => OrdersPage()
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
