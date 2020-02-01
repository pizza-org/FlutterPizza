import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class AnimatedTeddy extends StatefulWidget {
  @override
  _AnimatedTeddyState createState() => _AnimatedTeddyState();
}

class _AnimatedTeddyState extends State<AnimatedTeddy> {

  String animatedType = "idle";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedTeddy'),
      ),
      body: Container(
        color: Colors.blueGrey,
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                height: 350,
                width: 350,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: FlareActor(
                    "assets/Teddy.flr",
                    animation: animatedType,
                    alignment: Alignment.center,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              RaisedButton(
                onPressed: () {
                  setState(() {
                    animatedType = "success";
                  });
                },
                child: Text('Succes', style: TextStyle(color: Colors.white),),
                color: Colors.blue,
              ),
              SizedBox(
                height: 5.0,
              ),
              RaisedButton(
                onPressed: () {
                  setState(() {
                    animatedType = "fail";
                  });
                },
                child: Text('Fail', style: TextStyle(color: Colors.white),),
                color: Colors.blue,
              ),
              SizedBox(
                height: 5.0,
              ),
              RaisedButton(
                onPressed: () {
                  setState(() {
                    animatedType = "idle";
                  });
                },
                child: Text('Idle', style: TextStyle(color: Colors.white),),
                color: Colors.blue,
              ),
              SizedBox(
                height: 5.0,
              ),
              RaisedButton(
                onPressed: () {
                  setState(() {
                    animatedType = "test";
                  });
                },
                child: Text('Test', style: TextStyle(color: Colors.white),),
                color: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
