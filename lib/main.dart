import 'package:flutter/material.dart';
import 'package:pizza_app/src/pages/AccountPage.dart';
import 'package:pizza_app/src/pages/CompanyPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      // la ruta de tu pagina router flutter.
      // en mi caso account
      initialRoute: 'company',
      routes: {
        'company': (context) => CompanyPage(),
        'account': (context) => AccountPage(),
        },
      debugShowCheckedModeBanner: false,
    );
  }
}
