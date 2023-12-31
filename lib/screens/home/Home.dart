import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_base_tutorial/models/brew.dart';
import 'package:fire_base_tutorial/screens/home/brew_list.dart';
import 'package:fire_base_tutorial/screens/home/settings_form.dart';
import 'package:fire_base_tutorial/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:fire_base_tutorial/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
class Home extends StatelessWidget {


  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {

    void _showSettingsPanel() {
      showModalBottomSheet(context: context, builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20 , horizontal: 60),
          child: SettingsForm(),
        );
      });
    }


    return StreamProvider<List<Brew?>>.value(
      value: DatabaseService(uid: '').brews,
      initialData: [],
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
              label: Text('log out'),),

            TextButton.icon(onPressed: () => _showSettingsPanel(), icon: Icon(Icons.settings), label: Text('settings'))

          ],
        ),

        body: BrewList(),

      ),
    );
  }
}
