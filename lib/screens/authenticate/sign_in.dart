import 'package:fire_base_tutorial/services/auth.dart';
import 'package:fire_base_tutorial/shared/constants.dart';
import 'package:fire_base_tutorial/shared/loading.dart';
import 'package:flutter/material.dart';

class Sign_In extends StatefulWidget {

  final Function toggleView;

  Sign_In({required this.toggleView});

  @override
  State<Sign_In> createState() => _Sign_InState();
}

class _Sign_InState extends State<Sign_In> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  //text field state

  String email = '';
  String password = '';
  String error = '';


  @override
  Widget build(BuildContext context) {
    return loading? Loading(): Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        title: Text('Sign in to Brew Crew'),
        backgroundColor: Colors.brown[400],
        elevation: 0,
        actions: <Widget>[TextButton.icon(onPressed: () {widget.toggleView();}, icon: Icon(Icons.person_4),  label: Text('Register'))],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20 , horizontal: 20),
        child: Form(
         key: _formKey,
          child: Column(
            children: <Widget>[

              SizedBox(height : 20),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Email'),
                validator: (val) => val!.isEmpty ? 'Enter an email' : null,
                onChanged: (val) {
                  setState(() {
                    email = val;
                  });
                },
              ),

              SizedBox(height : 20),

              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Password'),
                validator: (val) => val!.length < 6 ? 'Enter a password 6+ characters long ' : null,
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
                  onPressed: () async {

                    if(_formKey.currentState!.validate()) {
                      setState(() {
                        loading = true;
                      });
                      dynamic result = await _auth.signInWithEmailorPassword(email, password);

                      if(result ==  null) {
                        setState(() {
                          error = 'could not sign in with those credentials';
                          loading = false;
                        });
                      }

                    }

                  },
                  child: Text('Sign in', style: TextStyle(color: Colors.white),)),
              SizedBox(height: 12,),

              Text(
                error,
                style: TextStyle(color : Colors.red , fontSize: 14),
              )

            ],
          )


          ,),
        ),

    );
  }
}
