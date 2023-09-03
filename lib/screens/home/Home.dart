import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_base_tutorial/screens/home/brew_list.dart';
import 'package:fire_base_tutorial/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:fire_base_tutorial/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
class Home extends StatelessWidget {


  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot?>.value(
      value: DatabaseService(uid: '').brews,
      initialData: null,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('Brew crew'),
          backgroundColor: Colors.brown[400],
          elevation: 0,
          actions: <Widget>[
            TextButton.icon(onPressed: () async {
               await _auth.signOut();
            },
              icon: Icon(Icons.person),
              label: Text('log out'),)
          ],
        ),

        body: BrewList(),

      ),
    );
  }
}
