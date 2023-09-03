import 'package:firebase_auth/firebase_auth.dart';
import 'package:fire_base_tutorial/models/Users.dart';
import 'package:fire_base_tutorial/services/database.dart';
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

  //sign in with email or password


  Future signInWithEmailorPassword(String email , String password) async {

    try {
    UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      // create a new document for user with the uid


      return _userFromFirebaseUser(user!);
    }
    catch(e) {
      print(e);
      return null;
    }

  }

  //Register with email and password

  Future registerWithEmailorPassword(String email , String password) async {

    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;

      await DatabaseService(uid: user!.uid).updateUserData(
          '0',
          'new crew member',
          100
      ); // initial values of user document


      return _userFromFirebaseUser(user);
    }
    catch(e) {
       print(e);
       return null;
    }

  }


  //signing out


  Future signOut () async {
    try {
      return await _auth.signOut();
    }
    catch(e) {
     print(e.toString());
     return null;
    }
  }

}