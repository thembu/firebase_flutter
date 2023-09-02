import 'package:fire_base_tutorial/services/auth.dart';
import 'package:flutter/material.dart';

class Sign_In extends StatefulWidget {
  const Sign_In({super.key});

  @override
  State<Sign_In> createState() => _Sign_InState();
}

class _Sign_InState extends State<Sign_In> {

  final AuthService _auth = AuthService();
  //text field state

  String email = '';
  String password = '';




  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  onPressed: () async { },
                  child: Text('Sign in', style: TextStyle(color: Colors.white),))

            ],
          )


          ,),
        ),

    );
  }
}
