class Ingredient {
  String uid;
  String name;
  bool deleteFlag;

  Ingredient({this.uid, this.name, this.deleteFlag});

  factory Ingredient.fromMap(Map data) {
    data = data ?? {};
    return Ingredient(
      uid: data["uid"],
      name: data["name"],
      deleteFlag: data["deleteFlag"]
    );
  }

}