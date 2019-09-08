import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'dart:convert';
import 'dart:async';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:vit_hack/models/sharedPref.dart';

class QRCodePage extends StatefulWidget {
  QRCodePage({Key key,this.restaurantID,this.workerID}) : super(key: key);
  final String restaurantID, workerID;

  @override
  _QRCodePageState createState() => _QRCodePageState();
}
class _QRCodePageState extends State<QRCodePage> {

  @override
  void initState() {
    super.initState(); 
    getEmail();
  }

  String email="";
  SharedPreferencesTest s = new SharedPreferencesTest();
  Future<String> futureEmail;
  getEmail() async{
    futureEmail=s.getEmail();
    futureEmail.then((res){
      setState(() {
        email=res; 
    });
    });
  }

  @override
  Widget build(BuildContext context) {
    print("Email is "+email);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        //titleSpacing: 50.0,
        title: Text('QR Code',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 23.0),),
        backgroundColor : Colors.white,
        //shape: BeveledRectangleBorder( borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.0) , bottomRight: Radius.circular(10.0)),),
      ),
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width,
    child : LayoutBuilder(
    builder: (BuildContext context, BoxConstraints viewportConstraints) {
    return Container(
    padding: EdgeInsets.only(bottom:20.0),
    child: ConstrainedBox(
    constraints: BoxConstraints(
    minHeight: viewportConstraints.maxHeight,
    ),
    child: Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      QrImage(
        data: email,
        //version: 3,
        size: 200.0,
      ),
      Container(
        child:Text("Email : "+email)
      )
    ],),
    )
    );
    }
    )));
}
}

