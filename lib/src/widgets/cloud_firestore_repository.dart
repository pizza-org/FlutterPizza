import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pizza_app/src/model/user.dart';
import 'package:pizza_app/src/providers/cloud_firestore_api.dart';

class CloudFirestoreRepository {

  final _cloudFirestoreAPI = CloudFirestoreAPI();

  void uploadUserUserDataFirestore(User user) => _cloudFirestoreAPI.uploadUserData(user);

}