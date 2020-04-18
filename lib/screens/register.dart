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
  final _registerFormKey = GlobalKey<FormState>();

  String phone = '';
  String pwd = '';
  String name = '';
  String address = '';
  String pwdConf = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Sign In Page'),
          backgroundColor: Colors.amber[100 ],
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
        alignment: Alignment(0,0),
        child: Form(
          key: _registerFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                SizedBox(height: 20),
                Container(
                  width: 300,
                  child: TextFormField(
                  validator: (val_userName) => val_userName.isEmpty ? 'Enter your Name' : null,
                  decoration: InputDecoration(hintText: 'Enter Name'),
                  onChanged: (val_userName) {
                    setState(() => name = val_userName);               
                  },
                ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 300,
                  child: TextFormField(
                  validator: (val_userPhone) => val_userPhone.length < 10 ? 'Enter 10 digit number' : null,
                  decoration: InputDecoration(hintText: 'Enter Phone number'),
                  onChanged: (val_userPhone) {
                    setState(() => phone = val_userPhone);               
                  },
                ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 300,
                  child: TextFormField(
                  validator: (val_userAddress) => val_userAddress.isEmpty ? 'Enter your full address' : null,
                  decoration: InputDecoration(hintText: 'Enter Full Address'),
                  onChanged: (val_userAddress) {
                    setState(() => address = val_userAddress);               
                  },
                ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 300,
                  child: TextFormField(
                  validator: (val_pwd) => (val_pwd.length < 8 && val_pwd.length > 12) ? 'Password length should be between 8 and 12' : null,
                  decoration: InputDecoration(hintText: 'Enter preferred Password'),
                  obscureText: true,
                  onChanged: (val_pwd) {
                      setState(() => pwd = val_pwd );
                  },          
                ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 300,
                  child: TextFormField(
                  validator: (val_pwdConf) => (val_pwdConf.length < 8 && val_pwdConf.length > 12) ? 'Passowrd should match' : null,
                  decoration: InputDecoration(hintText: 'Confirm Password'),
                  obscureText: true,
                  onChanged: (val_pwdConf) {
                      setState(() => pwdConf = val_pwdConf );
                  },          
                ),
                ),
                SizedBox(height:20),
                RaisedButton(
                  color: Colors.black54,
                  child: Text('Sign In', style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                      if (_registerFormKey.currentState.validate()){
                        print(phone);
                      }
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