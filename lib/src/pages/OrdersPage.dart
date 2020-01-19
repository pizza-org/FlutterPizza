import 'package:flutter/material.dart';

class OrdersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            _fondoApp(),
            SingleChildScrollView(
              child: Column(
                children: <Widget>[..._titulo()],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 140),
              width: double.infinity,
              child: ListView(
                children: <Widget>[
                  ListTile(
                    title: Text(
                      'Pizza Grande - Anchoas y otros',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                  Divider(
                    color: Colors.white,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _fondoApp() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(-1.5, -1),
          end: Alignment(1.5, 0.8),
          colors: [
            Color.fromRGBO(94, 252, 232, 1),
            Color.fromRGBO(115, 110, 254, 1)
          ],
          stops: [
            0.0,
            1.0,
          ],
        ),
      ),
    );
  }

  List<Container> _titulo() {
    return [
      Container(
        width: double.infinity,
        padding: EdgeInsets.only(left: 20, top: 10),
        child: Text(
          'Tus',
          style: TextStyle(fontSize: 50, color: Colors.white),
          textAlign: TextAlign.start,
        ),
      ),
      Container(
        width: double.infinity,
        padding: EdgeInsets.only(left: 20),
        child: Text(
          'pedidos',
          style: TextStyle(fontSize: 50, color: Colors.white),
          textAlign: TextAlign.start,
        ),
      )
    ];
  }
}
