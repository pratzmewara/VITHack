import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:vit_hack/models/sharedPref.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key,}) : super(key: key);

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
}


  @override
  Widget build(BuildContext context) {

    return new Scaffold(
          backgroundColor: Color(0xFFEEEEEE),
          body : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Home', style: TextStyle(color: Colors.blue),),
              Text('Day 1',)
            ],
          )
     );
  }
}