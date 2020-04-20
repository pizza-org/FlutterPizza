import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

class LogoContainer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SvgPicture.asset('assets/svg/logo.svg'),

          Text('PIZZA-APP',
            style: TextStyle(
              color: Theme.of(context).accentColor,
              fontSize: 50.0
            )
          ),
        ],
      )
    );
  }

}
