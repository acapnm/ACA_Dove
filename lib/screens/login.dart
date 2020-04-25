import 'package:flutter/material.dart';
import 'package:login_page/services/auth.dart';
import 'package:login_page/shared/loading.dart';

class login extends StatefulWidget {

  final Function toggle;
  login({this.toggle});

  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {

  final authService _anonTest = authService();
  final _loginFormKey = GlobalKey<FormState>();

  String email = '';
  String pwd = ''; 
  String error = '';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading ? loadingWidget() : MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.transparent, 
        appBar: AppBar(
        title: Text('Login to ACA'),
        backgroundColor: Colors.blue[200],
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.keyboard), 
            label: Text('Sign In'),
            textColor: Colors.white,
            onPressed: () => widget.toggle(),
            )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/BG_Template1.jpg"),
            fit: BoxFit.fill,
          )
        ),
        child: Column(
          key: _loginFormKey,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
        Row (
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 250,  
              //padding: EdgeInsets.all(100),   
              child: TextField(
                //validator: (val_userEmail) => val_userEmail.isEmpty ? 'Enter your Email address' : null,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  border: OutlineInputBorder(),
                    labelText: 'Enter Email Here',
                    labelStyle: TextStyle(color: Colors.white),
                    hintText: 'Enter Email Here',
                    hintStyle: TextStyle(color: Colors.white),
                ),
                autofocus: false,
                onChanged: (val_userEmail) {
                  setState(() => email = val_userEmail);               
                },
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
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  border: OutlineInputBorder(),
                    labelText: 'Enter Password Here',
                    labelStyle: TextStyle(color: Colors.white),
                    hintText: 'Enter Password Here',
                    hintStyle: TextStyle(color: Colors.white),
                ),
                autofocus: false,
                obscureText: true,
                onChanged: (val_password) {
                  setState(() => pwd = val_password);               
                },
              ),
            ),
        ],),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: RaisedButton(
                child: Text('Login'),
                textColor: Colors.white,
                color: Colors.transparent,
    
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                  side: BorderSide(color: Colors.white),
                ),
                onPressed: () async{
                    // dynamic anonUser = await _anonTest.login_anon();
                    // if (anonUser == null){
                    //   print('error logging in');
                    // }else{
                    //   print('logged in sucessfully');
                    //   print(anonUser.userID);
                    // }
                  setState(() {
                    loading = true;
                  });
                  dynamic signResult = await _anonTest.loginEmailID(email, pwd);
                  if (signResult == null){
                      setState(() {
                        error = 'Email or Password not valid';
                        loading = false;
                      });
                  }
                },
              ),
              
            ),
          ],
        ),
        SizedBox(height: 20),
          Text(
              error,
              style: TextStyle(color: Colors.red, fontSize: 11),
          ),
          ],),
      ),
        ),
    );
  }
}