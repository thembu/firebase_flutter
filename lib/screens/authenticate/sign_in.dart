import 'package:fire_base_tutorial/services/auth.dart';
import 'package:flutter/material.dart';

class Sign_In extends StatefulWidget {
  const Sign_In({super.key});

  @override
  State<Sign_In> createState() => _Sign_InState();
}

class _Sign_InState extends State<Sign_In> {

  final AuthService _auth = AuthService();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(title: Text('Sign in to Brew Crew'), backgroundColor: Colors.brown[400], elevation: 0,),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20 , horizontal: 20),
        child: ElevatedButton(
          child: Text('Sign in anon'),
          onPressed: () async {
           dynamic result =   await _auth.signInAnon();
           if (result == null) {
             print('error signing in');
           }
           else {
             print('signed in');
             print(result.uid);
           }

          },
        ),
      ),
    );
  }
}
