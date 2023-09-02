import 'package:fire_base_tutorial/models/Users.dart';
import 'package:fire_base_tutorial/screens/authenticate/authenticate.dart';
import 'package:fire_base_tutorial/screens/home/Home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {


    final user = Provider.of<Users?>(context);
    print(user);
    //return either home or authenticate widget

    return  Authenticate();
  }
}
