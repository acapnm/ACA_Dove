import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    Widget image_slider = Container(
      height: 200,
      child: Carousel(
        boxFit: BoxFit.fill,
        images: [
          ExactAssetImage("assets/Verse1.jpg"), 
          ExactAssetImage("assets/Verse2.jpg"),
          ExactAssetImage("assets/Verse3.jpg"), 
        ],
      ),
    );
    return Scaffold(
      body: ListView(
        children: <Widget>[
          image_slider,
        ],
      ),
    );
  }
}