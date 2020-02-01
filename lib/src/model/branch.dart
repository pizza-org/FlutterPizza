import 'package:cloud_firestore/cloud_firestore.dart';

class Branch {
  String uid;
  String name;
  GeoPoint location;
  String uidCompany;
  String webPage;
  Timestamp startOfTheDay;
  Timestamp endToDay;
  bool deleteFlag;

  Branch({this.uid, this.name, this.location, this.uidCompany,
    this.webPage, this.startOfTheDay, this.endToDay, this.deleteFlag});

  factory Branch.fromMap(Map data) {
    data = data ?? {};
    return Branch(
      uid: data["uid"],
      name: data["name"],
      location: data["location"],
      uidCompany: data["uidCompany"],
      webPage: data["webPage"],
      startOfTheDay: data["startOfTheDay"],
      endToDay: data["endToDay"],
      deleteFlag: data["deleteFlag"]
    );
  }

  factory Branch.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data;
    return Branch(
        uid: data["uid"],
        name: data["name"],
        location: data["location"],
        uidCompany: data["uidCompany"],
        webPage: data["webPage"],
        startOfTheDay: data["startOfTheDay"],
        endToDay: data["endToDay"],
        deleteFlag: data["deleteFlag"]
    );
  }

}