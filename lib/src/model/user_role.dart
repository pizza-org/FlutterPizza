import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserRole {

  String uid;
  String name;
  bool deleteFlag;

  UserRole({this.uid, this.name, this.deleteFlag});

  factory UserRole.fromMap(Map data) {
    data = data ?? {};
    return UserRole(
      uid: data["uid"],
      name: data["name"],
      deleteFlag: data["deleteFlag"]
    );
  }

  factory UserRole.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data;
    return UserRole(
        uid: data["uid"],
        name: data["name"],
        deleteFlag: data["deleteFlag"]
    );
  }

  UserRole.newUser(String name) {
    this.name = name;
    this.deleteFlag = false;
  }


}