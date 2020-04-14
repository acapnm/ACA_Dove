import 'package:flutter/material.dart';
import 'package:login_page/services/auth.dart';

class login extends StatelessWidget {
  // This widget is the root of your application

  final authService _anonTest = authService();
  String val_username = '';
  String val_pwd = ''; 

  final Function toggle;
  login({this.toggle});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.green[200],
        appBar: AppBar(
        title: Text('Login Page'),
        backgroundColor: Colors.green[400],
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.keyboard), 
            label: Text('Sign In'),
            onPressed: () {
              toggle();
            },
            )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
      Row (
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 250,  
            //padding: EdgeInsets.all(100),   
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                  labelText: 'Enter Username Here',
                  hintText: 'Enter Username Here',
              ),
              autofocus: false,
            ),),
        ],),
        //Spacer(flex: 1 ),
        SizedBox(height: 7),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
        Container( 
            //alignment: Alignment(1,1),
            width: 250,       
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                  labelText: 'Enter Password Here',
                  hintText: 'Enter Password Here',
              ),
              autofocus: false,
            ),
          ),
      ],),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: RaisedButton(
              child: Text('Login Anonymously'),
              onPressed: () async{
                  dynamic anonUser = await _anonTest.login_anon();
                  if (anonUser == null){
                    print('error logging in');
                  }else{
                    print('logged in sucessfully');
                    print(anonUser.userID);
                  }
              },
            ),
          ),
        ],
      ),
        ],),
        ),
    );
  }
}
