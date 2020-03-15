
import 'package:flutter/material.dart';

class ProgressDialog {

  bool _showing;
  BuildContext _context;
  BuildContext _dismissingContext;

  String _dialogMessage;
  Color _backgroundColor;

  ProgressDialog(BuildContext context) {
    _context = context;

    _showing = false;
    _dialogMessage = "Loading...";
    _backgroundColor = Colors.white;
  }

  bool get showing => _showing;

  Future<bool> hide() {
    if (_showing) {
      _showing = false;

      Navigator.of(_dismissingContext).pop(true);
      return Future.value(true);
    } else {
      return Future.value(false);
    }
  }

  Future<bool> show() async {
    if (!_showing) {
      showDialog<dynamic>(
          context: _context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            _dismissingContext = context;

            return WillPopScope(
                onWillPop: () async => true,
                child: Dialog(
                    backgroundColor: _backgroundColor,
                    insetAnimationCurve: Curves.easeInOut,
                    insetAnimationDuration: Duration(milliseconds: 100),
                    elevation: 8.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    child: _ContentDialog(
                        message: _dialogMessage
                    )
                )
            );
          });

      await Future.delayed(Duration(milliseconds: 200));

      _showing = true;
      return true;
    } else {
      return false;
    }
  }
}

// ignore: must_be_immutable
class _ContentDialog extends StatelessWidget {

  String _message;

  _ContentDialog({message: String}) {
    this._message = message;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.0,
      child: Row(children: <Widget>[
        const SizedBox(width: 10.0),

        SizedBox(
          width: 65.0,
          height: 65.0,
          child: Image.asset('assets/gifs/pizza-loader.gif'),
        ),

        const SizedBox(width: 15.0),

        Expanded(
            child: Text(_message,
                textAlign: TextAlign.justify,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 19.0,
                    fontWeight: FontWeight.w600
                )
            )
        ),

        const SizedBox(width: 10.0)
      ]),
    );
  }

}
