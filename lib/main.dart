import 'package:flutter/material.dart';
import 'package:login_page/models/userId.dart';
import 'package:login_page/screens/divider.dart';
import 'package:login_page/services/auth.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application
  //SreamProvider is a provider widget which helps us in making the stream available
  //in all the modules/widgets used after Material app

  @override
  Widget build(BuildContext context) {
    return StreamProvider<userClass>.value(
      value: authService().uid,
      child: MaterialApp(
        home: divider(),
      ),
    );
  }
}