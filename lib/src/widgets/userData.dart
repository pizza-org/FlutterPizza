import 'package:flutter/material.dart';
import 'package:pizza_app/src/model/user.dart';
import 'package:provider/provider.dart';

class UserData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<User>(context);
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Email user:'),
          SizedBox(width: 5,),
          Text(user.name)
        ],
      ),
    );
  }
}
