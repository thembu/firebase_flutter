import 'package:cloud_firestore/cloud_firestore.dart';


class DatabaseService {

  final String uid;

  DatabaseService({required this.uid});

  final CollectionReference brewCollection = FirebaseFirestore.instance.collection('brews');

  Future updateUserData(String sugars , String name,int strength) async{

    return await brewCollection.doc(uid).set({
      'sugars' : sugars,
      'name' : name,
      'strength' : strength
    }); //user does not exist yet so firebase will create a new user with that particular uid

  }

  Stream<QuerySnapshot> get brews {
    return brewCollection.snapshots();
  }

}