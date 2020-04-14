import 'package:flutter/material.dart';
import 'package:login_page/services/auth.dart';

class RegisterClass extends StatefulWidget {

  final Function toggle;
  RegisterClass({this.toggle});

  @override
  _RegisterClassState createState() => _RegisterClassState();
}

class _RegisterClassState extends State<RegisterClass> {

  final authService _auth = authService();

  String email_phone = '';
  String pwd = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Sign In Page'),
          backgroundColor: Colors.amber[100],
          actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.keyboard), 
            label: Text('Login'),
            onPressed: () {
              widget.toggle();
            },
            )
        ],
        ),
      body: Container(
        child: Form(
          child: Column(
            children: <Widget>[
                SizedBox(height: 20),
                TextFormField(
                  onChanged: (val_user) {
                    setState(() => email_phone = val_user);               
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  obscureText: true,
                  onChanged: (val_pwd) {
                      setState(() => pwd = val_pwd );
                  },          
                ),
                SizedBox(height:20),
                RaisedButton(
                  color: Colors.black54,
                  child: Text('Sign In', style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {

                  },
                ),
              ],
          ),
        ),
      ),
      ),
      
    );
  }
}