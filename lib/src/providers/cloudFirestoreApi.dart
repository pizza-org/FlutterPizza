import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pizza_app/src/model/branch.dart';
import 'package:pizza_app/src/model/company.dart';
import 'package:pizza_app/src/model/flavor.dart';
import 'package:pizza_app/src/model/ingredient.dart';
import 'package:pizza_app/src/model/order.dart';
import 'package:pizza_app/src/model/user.dart';
import 'package:pizza_app/src/model/userRole.dart';

class CloudFirestoreAPI {
  final String USERS = "users";
  final String USERROLE = "userrole";
  final String PLACE = "places";
  final String COMPANIES = "companies";
  final String BRANCHS = "branchs";
  final String FLAVORS = "flavors";
  final String INGREDIENTS = "ingredients";
  final String ORDERS = "orders";

  final Firestore _db = Firestore.instance;

  void uploadUserData(User user) async {
    DocumentReference ref = _db.collection(USERS).document(user.uid);
    return ref.setData({
      'uid': user.uid,
      'idRol': user.idRol,
      'name': user.name,
      'email': user.email
    }, merge: true);
  }

  void uploadUserRol(UserRole userRole) async {
    DocumentReference ref = _db.collection(USERROLE).document();
    userRole.uid = ref.documentID;
    return ref.setData({
      'uid': userRole.uid,
      'name': userRole.name,
      'deleteFlag': userRole.deleteFlag
    });
  }

  void uploadOrder(Order order) async {
    DocumentReference ref = _db.collection(ORDERS).document();
    order.uid = ref.documentID;
    return ref.setData({
      'uid': order.uid,
      'uidUser': order.uidUser,
      'uidBranch': order.uidBranch,
      'sizePizza': order.sizePizza,
      'divisionsPizza': order.divisionsPizza,
      'flavors': order.flavors,
      'deleteFlag': order.deleteFlag
    }, merge: true);
  }

  void uploadCompany(Company company) async {
    DocumentReference ref = _db.collection(COMPANIES).document();
    company.uid = ref.documentID;
    return ref.setData({
      'uid': company.uid,
      'name': company.name,
      'bannerUrl': company.bannerUrl,
      'flavors': company.flavors,
      'deleteFlag': company.deleteFlag
    }, merge: true);
  }

  void uploadBranch(Branch branch) async {
    DocumentReference ref = _db.collection(BRANCHS).document();
    branch.uid = ref.documentID;
    return ref.setData({
      'uid': branch.uid,
      'name': branch.name,
      'location': branch.location,
      'uidCompany': branch.uidCompany,
      'webPage': branch.webPage,
      'startOfTheDay': branch.startOfTheDay,
      'endToDay': branch.endToDay,
      'deleteFlag': branch.deleteFlag
    }, merge: true);
  }

  void uploadFlavor(Flavor flavor) async {
    DocumentReference ref = _db.collection(FLAVORS).document();
    flavor.uid = ref.documentID;
    return ref.setData({
      'uid': flavor.uid,
      'name': flavor.name,
      'ingredients': flavor.ingredients,
      'deleteFlag': flavor.deleteFlag
    }, merge: true);
  }

  void uploadIngredients(Ingredient ingredient) async {
    DocumentReference ref = _db.collection(INGREDIENTS).document();
    ingredient.uid = ref.documentID;
    return ref.setData({
      'uid': ingredient.uid,
      'name': ingredient.name,
      'deleteFlag': ingredient.deleteFlag
    });
  }

  Stream<User> streamUser(String uid) {
    return _db
        .collection(USERS)
        .document(uid)
        .snapshots()
        .map((snap) => User.fromMap(snap.data));
  }

  Stream<List<UserRole>> streamUserRole() {
    var ref = _db.collection(USERROLE);
    return ref.snapshots().map((list) =>
        list.documents.map((doc) => UserRole.fromFirestore(doc)).toList());
  }

  Stream<List<Company>> streamCompanies() {
    var ref = _db.collection(COMPANIES);
    return ref.snapshots().map((list) =>
        list.documents.map((doc) => Company.fromFirestore(doc)).toList());
  }

  Stream<List<Branch>> streamBranch(String uidCompany) {
    return _db
        .collection(BRANCHS)
        .where('uidCompany', isEqualTo: uidCompany)
        .snapshots()
        .map((list) =>
            list.documents.map((doc) => Branch.fromFirestore(doc)).toList());
  }

  Stream<List<Flavor>> streamFlavors() {
    var ref = _db.collection(FLAVORS);
    return ref.snapshots().map((list) =>
        list.documents.map((doc) => Flavor.fromFirestore(doc)).toList());
  }


  void getDocumentByCollectionAndDocument(
      String collection, String document) async {
    DocumentReference ref = _db.collection(collection).document(document);
    ref.get();
  }
}
