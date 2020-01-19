import 'package:flutter/material.dart';  

class CompanyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                _title(),
                Text(
                  'Restaurantes',
                  style: TextStyle(color: Colors.black, fontSize: 25),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _title() {
    return Center(
      child: Text(
        'Cuenta',
        style: TextStyle(
          fontSize: 50,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

}