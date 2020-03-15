import 'package:flutter/material.dart';
import 'package:pizza_app/src/model/company.dart';
import 'package:pizza_app/src/providers/cloudFirestoreApi.dart';

class CompaniesPage extends StatelessWidget {

  final db = CloudFirestoreAPI();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pizzerias',
          style: TextStyle(color: Color.fromRGBO(239, 112, 112, 1)),
        ),
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      ),
      body: Center(
        child: StreamBuilder(
          stream: db.streamCompanies(),
          builder: (context, AsyncSnapshot<List<Company>> snapshot) {
            return 
              ListView(
                padding: const EdgeInsets.all(0),
                children: snapshot.data.map((item) =>
                  new CompanyWidget(name: item.name, bannerUrl: item.bannerUrl)).toList()
              );
          },
        ),
      )
    );
  }
}

class CompanyWidget extends StatelessWidget {

  final String name;
  final String bannerUrl;

  const CompanyWidget({
    Key key,
    this.name,
    this.bannerUrl
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
        // side: BorderSide(color: Colors.white70, width: 1),
      ),
      elevation: 10,
      // margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
      margin: EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 10
      ),
      clipBehavior: Clip.hardEdge,
      child: Container(
        child: Stack(
          overflow: Overflow.clip,
          children: <Widget>[
            Positioned.fill(
              child: Image.network(
                bannerUrl,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: 200,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        name,
                        style: TextStyle(
                          height: 1,
                          fontSize: 40,
                          color: Color.fromRGBO(255, 255, 255, 1),
                          shadows: <Shadow>[
                            Shadow(
                              offset: Offset(5.0, 5.0),
                              blurRadius: 10.0,
                              color: Color.fromARGB(180, 0, 0, 0),
                            ),
                          ],
                        )
                      ),
                    )
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
