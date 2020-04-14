import 'package:flutter/material.dart';
import 'package:login_page/screens/login.dart';
import 'package:login_page/screens/register.dart';


class subDividerClass extends StatefulWidget {
  @override
  _subDividerClassState createState() => _subDividerClassState();
}

class _subDividerClassState extends State<subDividerClass> {
  bool signSwitch = true;

  void toggleFunction() {
    setState(() => signSwitch = !signSwitch);
  }

  @override
  Widget build(BuildContext context) {
    if (signSwitch) {
      return login(toggle: toggleFunction);
    }else{
      return RegisterClass(toggle: toggleFunction);
    }
  }
}