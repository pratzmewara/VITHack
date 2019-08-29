import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'dart:convert';
import 'dart:async';

class ContactUsPage extends StatefulWidget {
  ContactUsPage({Key key,this.restaurantID,this.workerID}) : super(key: key);
  final String restaurantID, workerID;

  @override
  _ContactUsPageState createState() => _ContactUsPageState();
}
class _ContactUsPageState extends State<ContactUsPage> {

  @override
  void initState() {
    super.initState(); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text('Contact Us',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
        backgroundColor : Colors.white,
        //shape: BeveledRectangleBorder( borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.0) , bottomRight: Radius.circular(10.0)),),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child : Text('Contact Us')
));
}
}

