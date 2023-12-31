import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_base_tutorial/models/Users.dart';
import 'package:fire_base_tutorial/models/brew.dart';
import 'package:firebase_auth/firebase_auth.dart';


class DatabaseService {

  final String uid;

  DatabaseService({required this.uid});

  final CollectionReference brewCollection = FirebaseFirestore.instance.collection('brews');

  Future updateUserData(String sugars , String name,int strength) async{

    return await brewCollection.doc(uid).set({
      'sugars' : sugars,
      'name' : name,
      'strength' : strength
    });//user does not exist yet so firebase will create a new user with that particular uid

  }

  //brew list from snapshot

  List<Brew?> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Brew(name: doc.get('name') ?? '', sugars: doc.get('sugars') ?? '0', strength: doc.get('strength')?? 0);
    }).toList();
  }

  //userdata from snapshot

UserData? _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(uid: uid, name: snapshot.get('name') , sugars: snapshot.get('sugars'), strength: snapshot.get('strength'));
}



  Stream<List<Brew?>> get brews {
    return brewCollection.snapshots().map(_brewListFromSnapshot);
  }

  Stream<UserData?> get userData {

    return brewCollection.doc(uid).snapshots().
    map(_userDataFromSnapshot);

  }



}