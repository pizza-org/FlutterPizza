
import 'package:flutter/material.dart';

class OrderPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Page'),
      ),
        body: Container(
          alignment: AlignmentDirectional.center,
          child: _buildPizzaSizeList(context)
        )
      );
  }

  Widget _buildPizzaSizeList(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: <Widget>[
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, 'animate-test'),
          child: Container(
            width: 350,
            height: 350,
            decoration: BoxDecoration(color: Colors.red, shape: BoxShape.circle),
          ),
        ),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, 'animate-teddy'),
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(color: Colors.green, shape: BoxShape.circle),
          ),
        ),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, 'animate-resizing-house'),
          child: Container(
            width: 250,
            height: 250,
            decoration: BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
          ),
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
