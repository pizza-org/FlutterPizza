import 'package:flutter/material.dart';
import 'package:pizza_app/src/theme/Theme.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {

  ThemeData customTheme = ThemeData(
    brightness:     Brightness.light,
    primaryColor:   Colors.red,
    accentColor:    Colors.redAccent,
  );

  @override
  Widget build(BuildContext context) {
    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Container(
        padding: EdgeInsets.all(5),
        child: Column(
          children: <Widget>[
            FlatButton(
                onPressed: () => _themeChanger.setTheme(ThemeData.dark()),
                child: Text('Dark Theme')),
            FlatButton(
                onPressed: () => _themeChanger.setTheme(ThemeData.light()),
                child: Text('Light Theme')),
            FlatButton(
                onPressed: () => _themeChanger.setTheme(customTheme),
                child: Text('Custom Theme'))
          ],
        ),
      ),
    );
  }
}
