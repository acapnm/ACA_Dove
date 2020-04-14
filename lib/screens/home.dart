import 'package:flutter/material.dart';
import 'package:login_page/services/auth.dart';

class home  extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State< home > {

  final authService _authInst = authService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[400],
      appBar: AppBar(
        title: Text('ACA PNM'),
        backgroundColor: Colors.orange[200],
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person), 
            label: Text('Logout'),
            onPressed: () async {
              await _authInst.logOutClass();
            },
            )
        ],
      ),
    );
  }
}