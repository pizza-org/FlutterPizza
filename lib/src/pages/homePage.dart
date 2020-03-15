import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:pizza_app/src/pages/AccountPage.dart';
import 'package:pizza_app/src/pages/orderPage.dart';
import 'package:pizza_app/src/providers/authProvider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedPage = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      Container(
        child: Center(
          child: Text('Home Page'),
        ),
      ),
      OrderPage(),
      AccountPage(),
      Container(
        child: Center(
          child: Text('Favorites Page'),
        ),
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: <Widget>[
          RaisedButton(
            child: Text('Logout'),
            onPressed: () => _logout(context),
          )
        ],
      ),
      body: SafeArea(
        child: Container(child: pages[_selectedPage]),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        // backgroundColor: Color.fromRGBO(230, 78, 78, 1),
        backgroundColor: Colors.white,
        color: Color.fromRGBO(230, 78, 78, 1),
        items: <Widget>[
          Icon(Icons.directions_bike, size: 30, color: Colors.white),
          Icon(Icons.local_pizza, size: 30, color: Colors.white),
          Icon(Icons.account_circle, size: 30, color: Colors.white),
          Icon(Icons.favorite, size: 30, color: Colors.white),
        ],
        index: 0,
        onTap: (int index) {
          setState(() {
            _selectedPage = index;
          });
        },
      ),
    );
  }

  void _logout(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    authProvider.signOut();

    Navigator.pushReplacementNamed(context, 'login');
  }
}
