import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            _fondoApp(),
            Column(
              children: <Widget>[
                _title(),
                _photo(img: 'https://randomuser.me/api/portraits/men/96.jpg'),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Nombre: Jhon Doe',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                Text(
                  'Usuario: noobmaster69',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                SizedBox(height: height * 0.25),
                ButtonTheme(
                  minWidth: width * 0.8,
                  height: 42,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7)),
                    elevation: 0,
                    onPressed: () {},
                    color: Color.fromRGBO(255, 255, 255, 0.29),
                    child: Text(
                      'Cambiar Contraseña',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
                ButtonTheme(
                  minWidth: width * 0.8,
                  height: 42,
                  child: RaisedButton(
                    elevation: 0,
                    onPressed: () {},
                    color: Color.fromRGBO(255, 255, 255, 0.29),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7)),
                    child: Text(
                      'Cerrar Sesion',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _fondoApp() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(-1.5, -1),
          end: Alignment(1.5, 0.8),
          colors: [
            Color.fromRGBO(94, 252, 232, 1),
            Color.fromRGBO(115, 110, 254, 1)
          ],
          stops: [
            0.0,
            1.0,
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

  Widget _photo({String img}) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.6),
              offset: Offset(0, 4),
              blurRadius: 5,
            )
          ]),
      padding: EdgeInsets.all(2.75),
      child: CircleAvatar(
        backgroundImage: NetworkImage(img),
        radius: 60,
      ),
    );
  }
}
