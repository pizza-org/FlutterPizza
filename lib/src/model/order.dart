import 'flavor.dart';

class Order {
  String uid;
  String uidUser;
  String uidBranch;
  String sizePizza;
  int divisionsPizza;
  List<Flavor> flavors;
  bool deleteFlag;

  Order(
      {this.uid,
      this.uidUser,
      this.uidBranch,
      this.sizePizza,
      this.divisionsPizza,
      this.flavors,
      this.deleteFlag});

  factory Order.fromMap(Map data) {
    data = data ?? {};
    return Order(
      uid: data["uid"],
      uidUser: data["uidUser"],
      uidBranch: data["uidBranch"],
      sizePizza: data["sizePizza"],
      divisionsPizza: data["divisionsPizza"],
      flavors: data["flavors"],
      deleteFlag: data["deleteFlag"]
    );
  }

}
