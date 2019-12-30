import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pizza_app/src/model/ingredient.dart';

class Flavor {
  String uid;
  String name;
  List<Ingredient> ingredients;
  bool deleteFlag;

  Flavor({this.uid, this.name, this.ingredients, this.deleteFlag});

  factory Flavor.fromMap(Map data) {
    data = data ?? {};
    return Flavor(
      uid: data["uid"],
      name: data["name"],
      ingredients: data["ingredients"],
      deleteFlag: data["deleteFlag"]
    );
  }

  factory Flavor.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data;
    return Flavor(
        uid: data["uid"],
        name: data["name"],
        ingredients: data["ingredients"],
        deleteFlag: data["deleteFlag"]
    );
  }

}