class User {

  String uid;
  String idRol;
  String name;
  String email;
  bool deleteFlag;

  User({this.uid, this.idRol, this.name, this.email}) {
    this.deleteFlag = false;
  }

  factory User.fromMap(Map data) {
    data = data ?? {};
    return User(
        uid: data["uid"],
        name: data["name"],
        idRol: data["idRol"],
        email: data["email"],
    );
  }

  factory User.fromJson(Map<String, dynamic> json) => new User(
    uid: json["uid"],
    name: json["name"],
    idRol: json["idRol"],
    email: json["email"]
  );

  Map<String, dynamic> toJson() => {
    "uid": uid,
    "idRol": idRol,
    "name": name,
    "email": email
  };

}