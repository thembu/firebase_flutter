import 'package:fire_base_tutorial/services/auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();

  String password = '';
  String email = '';


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(title: Text('Sign in to Brew Crew'), backgroundColor: Colors.brown[400], elevation: 0,),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20 , horizontal: 20),
        child: Form(

          child: Column(
            children: <Widget>[

              SizedBox(height : 20),
              TextFormField(
                onChanged: (val) {
                  setState(() {
                    email = val;
                  });
                },
              ),

              SizedBox(height : 20),

              TextFormField(
                obscureText: true,
                onChanged: (val) {
                  setState(() {
                    password = val;
                  });
                },
              ),

              SizedBox(height : 20),

              ElevatedButton(style:
              ElevatedButton.styleFrom( backgroundColor: Colors.pink[400] ),
                  onPressed: () async { print(email); print(password); },
                  child: Text('Sign up for Brew crew', style: TextStyle(color: Colors.white),))

            ],
          )


          ,),
      ),

    );


  }
}
