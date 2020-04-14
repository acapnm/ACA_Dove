import 'package:flutter/material.dart';
import 'package:login_page/models/userId.dart';
import 'package:login_page/screens/home.dart';
import 'package:login_page/screens/subDivider.dart';
import 'package:provider/provider.dart';


class divider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final authUser = Provider.of<userClass>(context);

    if (authUser == null){
      return subDividerClass();
    }else{
      return home();
    }

    
  }
}