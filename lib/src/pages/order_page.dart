
import 'package:flutter/material.dart';

class OrderPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          alignment: AlignmentDirectional.center,
          child: _buildPizzaSizeList()
        )
      );
  }

  Widget _buildPizzaSizeList() {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: <Widget>[
        Container(
          width: 350,
          height: 350,
          decoration: BoxDecoration(color: Colors.red, shape: BoxShape.circle),
        ),
        Container(
          width: 300,
          height: 300,
          decoration: BoxDecoration(color: Colors.green, shape: BoxShape.circle),
        ),
        Container(
          width: 250,
          height: 250,
          decoration: BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
        ),
        Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(color: Colors.yellow, shape: BoxShape.circle),
        ),
      ],
      overflow: Overflow.visible,
    );
  }

}
