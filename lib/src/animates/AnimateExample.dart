import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class AnimateExample extends StatefulWidget {
  @override
  _AnimateExampleState createState() => _AnimateExampleState();
}

class _AnimateExampleState extends State<AnimateExample> {

  String typeAnimate = "Untitled";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimateExample'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              color: Colors.black26,
              child: FlareActor(
                "assets/pizza_animated_test.flr",
                animation: typeAnimate,
                alignment: Alignment.center,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            RaisedButton(
              onPressed: () {
                setState(() {
                  typeAnimate = "Untitled";
                });
              },
              child: Text(
                'Start ANIMATION',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
            ),
            SizedBox(
              height: 10.0,
            ),
            RaisedButton(
              onPressed: () {
                setState(() {
                  typeAnimate = "test";
                });
              },
              child: Text(
                'Restart Animation',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}
