import 'package:fire_base_tutorial/screens/authenticate/authenticate.dart';
import 'package:fire_base_tutorial/screens/home/Home.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {

    //return either home or authenticate widget

    return  Authenticate();
  }
}
