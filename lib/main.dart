
import 'package:fire_base_tutorial/models/Users.dart';
import 'package:fire_base_tutorial/screens/wrapper.dart';
import 'package:fire_base_tutorial/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<Users?>.value( //we are now listening to the user stream
      value: AuthService().user,
      catchError: (_, err) =>  null,
      initialData: null,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
