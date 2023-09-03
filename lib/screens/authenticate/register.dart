import 'package:fire_base_tutorial/services/auth.dart';
import 'package:fire_base_tutorial/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:fire_base_tutorial/shared/constants.dart';

class Register extends StatefulWidget {
  final Function toggleView;


  Register({ required this.toggleView });


  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String password = '';
  String email = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading? Loading() : Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        title: Text('Sign in to Brew Crew'),
        backgroundColor: Colors.brown[400],
        elevation: 0,
        actions: <Widget>[TextButton.icon(onPressed: () {widget.toggleView();}, icon: Icon(Icons.person_4),  label: Text('Sign in'))],
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
                      dynamic result = await _auth.registerWithEmailorPassword(email, password);
                      if(result ==  null) {
                        setState(() => error = 'please supply a valid email');
                        loading = false;
                      }

                    }
                  },
                  child: Text('Sign up for Brew crew', style: TextStyle(color: Colors.white),)),

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
