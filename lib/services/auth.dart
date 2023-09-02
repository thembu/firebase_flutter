import 'package:firebase_auth/firebase_auth.dart';
import 'package:fire_base_tutorial/models/Users.dart';
class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;
 //create user object base don firebase user

  Users? _userFromFirebaseUser(User user) {

    return user != null ? Users(uid : user.uid) : null;

  }

  //auth change user stream

  Stream<Users?> get user {
    return _auth.authStateChanges().map((User? user) =>_userFromFirebaseUser(user!));
  }

  Future signInAnon() async {
    try {
     UserCredential result =  await _auth.signInAnonymously();
     User? user = result.user;
     return _userFromFirebaseUser(user!);

    } catch (e) {

    print(e.toString());
    return null;

    }
  }

}