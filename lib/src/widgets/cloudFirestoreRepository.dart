
import 'package:pizza_app/src/model/user.dart';
import 'package:pizza_app/src/providers/cloudFirestoreApi.dart';

class CloudFirestoreRepository {

  final _cloudFirestoreAPI = CloudFirestoreAPI();

  void uploadUserUserDataFirestore(User user) => _cloudFirestoreAPI.uploadUserData(user);

}