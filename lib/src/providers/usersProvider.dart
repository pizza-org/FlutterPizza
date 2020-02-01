import 'package:flutter/material.dart';
import 'package:pizza_app/src/model/user.dart';
import 'package:pizza_app/src/widgets/cloudFirestoreRepository.dart';

class UsersProviders with ChangeNotifier {
  User _user;
  bool _loading = false;
  final _cloudFirestoreRepository = CloudFirestoreRepository();

  get user {
    return _user;
  }

  get loading {
    return _loading;
  }

  set user(User user) {
    this._user = user;
    this._loading = false;
    notifyListeners();
  }

  void uploadUser(User user) =>
      _cloudFirestoreRepository.uploadUserUserDataFirestore(user);
}
