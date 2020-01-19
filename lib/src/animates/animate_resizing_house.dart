import 'dart:async';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:pizza_app/src/controllers/house_controller.dart';

class AnimateResizingHouse extends StatefulWidget {
  @override
  _AnimateResizingHouseState createState() => _AnimateResizingHouseState();
}

class _AnimateResizingHouseState extends State<AnimateResizingHouse> {

  String animatedType = "idle";
  HouseController _houseController;

  @override
  void initState() {
    _houseController = HouseController(demoUpdated: _update);
    super.initState();
  }

  _update() => setState((){});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimateResizingHouse'),
      ),
      body: Container(
        child: Listener(
          onPointerUp: (onPointerUp) {},
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              FlareActor(
                "assets/resizing_house.flr",
                controller: _houseController,
                fit: BoxFit.cover,
              ),
              Container(
                margin: EdgeInsets.only(left: 40, right: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(_houseController.rooms.toString() + " ROOMS",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Roboto",
                            fontSize: 14,
                            fontWeight: FontWeight.w700)),
                    Slider(
                        min: 0,
                        max: 3,
                        divisions: 3,
                        value: _houseController.rooms.toDouble() - 3,
                        onChanged: (double value) {
                          setState(() {
                            _houseController.rooms = value.toInt() + 3;
                          });
                        }),
                    Text("DRAG TO CHANGE ROOMS",
                        style: TextStyle(
                            color: Colors.white.withAlpha(228),
                            fontFamily: "Roboto",
                            fontSize: 14,
                            fontWeight: FontWeight.w700))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
