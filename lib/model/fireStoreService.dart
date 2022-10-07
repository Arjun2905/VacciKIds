import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vacci_kids/model/User/user.dart';

class FireStoreServices {
  final CollectionReference _usersCollectionReference =
      FirebaseFirestore.instance.collection("users");

  Future createUser(Users user) async {
    try {
      await _usersCollectionReference.doc(user.id).set({user.toJson()});
    } catch (e) {
      return e.toString();
    }
  }

  Future<Object> getUser(String uid) async {
    try {
      var userData = await _usersCollectionReference.doc(uid).get();
      return Users.fromData(userData.data() as Map<String, dynamic>);
    } catch (e) {
      return e.toString();
    }
  }

  Map<String, dynamic> convertToJson(Map<String, dynamic> data) {
    return {
      'contestName': data['contestName'],
      'site': data['site'],
      'start': data['start'],
      'time': data['time'],
      'duration': data['duration'],
    };
  }
}
