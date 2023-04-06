import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vacci_kids/model/User/user.dart';
import 'package:vacci_kids/model/User/child_user.dart';

class FireStoreServices {
  final CollectionReference _parentCollectionReference =
      FirebaseFirestore.instance.collection("parent_profiles");

  Future createParentUser(Users user) async {
    try {
      await _parentCollectionReference.doc(user.id).set(user.toJson());
    } catch (e) {
      return e.toString();
    }
  }

  Future createChildUser(ChildUsers childUser, Users user) async {
    final CollectionReference _childCollectionReference =
    FirebaseFirestore.instance.collection("child_profiles");
    try {
      await _childCollectionReference.add(childUser.toJson());
    } catch (e) {
      return e.toString();
    }
  }

  Future<Object> getParentUser(String? uid) async {
    try {
      var userData = await _parentCollectionReference.doc(uid).get();
      return Users.fromData(userData.data() as Map<String, dynamic>);
    } catch (e) {
      return e.toString();
    }
  }

  Future<Object> getChildUser(String? uid) async {
    final CollectionReference _childCollectionReference =
    FirebaseFirestore.instance.collection("child_profiles").doc(uid).collection("children");
    try {
      var userData = await _childCollectionReference.get();
      return ChildUsers.fromData(userData as Map<String, dynamic>);
    } catch (e) {
      return e.toString();
    }
  }

  Map<String, dynamic> convertToJson(Map<String, dynamic> data) {
    return {
      'Name': data['Name'],
      'City': data['City'],
      'Children': data['Children'],
    };
  }
}
