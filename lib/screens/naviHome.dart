import 'package:flutter/material.dart';
import 'package:login_page/screens/home.dart';
import 'package:login_page/screens/prayerRequest.dart';
import 'package:login_page/screens/serviceTimings.dart';
import 'package:login_page/services/auth.dart';

class naviHome  extends StatefulWidget {
  @override
  _naviHomeState createState() => _naviHomeState();
}

class _naviHomeState extends State< naviHome > {

  final authService _authInst = authService();
  int index=0;
  List <Widget> naviList = [
    home(),
    prayerRequest(),
    serviceTimings(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.orange[400],
        appBar: AppBar(
          title: Text('ACA PNM'),
          backgroundColor: Colors.blueGrey[900],
          // actions: <Widget>[
          //   FlatButton.icon(
          //     icon: Icon(Icons.person), 
          //     label: Text('Logout'),
          //     onPressed: () async {
          //       await _authInst.logOutClass();
          //     },
          //     )
          // ],
        ) ,
    body: naviList[index],
    drawer: naviDrawer(onTouch: (ctx,i){
      setState(() {
        index=i;
        Navigator.pop(ctx);
      });
    }),
    ),);
  }
}

class naviDrawer extends StatelessWidget {

  final Function onTouch;
  final authService _authInst = authService();

  naviDrawer({
    this.onTouch
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width*0.8,
      child: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
           DrawerHeader(
             decoration: BoxDecoration(color: Colors.blue),
             child: Padding(
                padding: EdgeInsets.all(7),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children:  <Widget>[
                    
                  ],
                ),
             ),
             ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () => onTouch(context,0),
            ),
            ListTile(
              leading: Icon(Icons.forum),
              title: Text('Prayer Request'),
              onTap: () => onTouch(context,1),
            ),
            ListTile(
              leading: Icon(Icons.timer),
              title: Text('Service Timings'),
              onTap: () => onTouch(context,2),
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logoff'),
              onTap: () async {await _authInst.logOutClass();},
            ),
          ],
        ),
      ),
    );
  }
}