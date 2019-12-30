
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