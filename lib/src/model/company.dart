import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pizza_app/src/model/flavor.dart';

class Company {

  String uid;
  String name;
  String bannerUrl;
  List<Flavor> flavors;
  bool deleteFlag;

  Company({
    this.uid,
    this.name,
    this.bannerUrl,
    this.flavors,
    this.deleteFlag
  });

  factory Company.fromMap(Map data) {
    data = data ?? {};
    return Company(
      uid: data["uid"],
      name: data["name"],
      bannerUrl: data["bannerUrl"],
      flavors: data["flavors"],
      deleteFlag: data["deleteFlag"]
    );
  }

  factory Company.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data;
    return Company(
        uid: data["uid"],
        name: data["name"],
        bannerUrl: data["bannerUrl"],
        flavors: data["flavors"],
        deleteFlag: data["deleteFlag"]
    );
  }
}