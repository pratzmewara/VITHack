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
        titleSpacing: 50.0,
        title: Text('Contact Us',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 23.0),),
        backgroundColor : Colors.white,
        //shape: BeveledRectangleBorder( borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.0) , bottomRight: Radius.circular(10.0)),),
      ),
      backgroundColor: Colors.white,
      body: return Container(
        width: MediaQuery.of(context).size.width,
    child : LayoutBuilder(
    builder: (BuildContext context, BoxConstraints viewportConstraints) {
    return SingleChildScrollView(
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

    GestureDetector(
    onTap : (){

    },
    child : Container(
    // color: Colors.white,
    margin: EdgeInsets.all(12),
    width: (MediaQuery.of(context).size.width/2),
    height: (MediaQuery.of(context).size.width/2),
    padding: EdgeInsets.only(top: 10.0),
    decoration: BoxDecoration(
    boxShadow:<BoxShadow>[
    BoxShadow(blurRadius: 10.0,
    color:Colors.grey[400] ,
    offset: Offset(0.5,0.5))

    ],
    shape: BoxShape.rectangle,
    color: Colors.white ,
    borderRadius: BorderRadius.all(Radius.circular(10))
    ),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
    Image.asset('lib/assests/reliance.png' , width: (MediaQuery.of(context).size.width/2)-32, height: 100.0,),
    ],
    )),),
    GestureDetector(
    onTap : (){

    },
    child : Container(
    // color: Colors.white,
    margin: EdgeInsets.all(12),
    width: (MediaQuery.of(context).size.width/2),
    height: (MediaQuery.of(context).size.width/2),
    padding: EdgeInsets.only(top: 10.0),
    decoration: BoxDecoration(
    boxShadow:<BoxShadow>[
    BoxShadow(blurRadius: 10.0,
    color:Colors.grey[400] ,
    offset: Offset(0.5,0.5))

    ],
    shape: BoxShape.rectangle,
    color: Colors.white ,
    borderRadius: BorderRadius.all(Radius.circular(10))
    ),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
    Image.asset('lib/assests/tekno.png' , width: (MediaQuery.of(context).size.width/2)-32, height: 100.0,),
    ],
    )),),
    GestureDetector(
    onTap : (){

    },
    child : Container(
    // color: Colors.white,
    margin: EdgeInsets.all(12),
    width: (MediaQuery.of(context).size.width/2),
    height: (MediaQuery.of(context).size.width/2),
    padding: EdgeInsets.only(top: 10.0),
    decoration: BoxDecoration(
    boxShadow:<BoxShadow>[
    BoxShadow(blurRadius: 10.0,
    color:Colors.grey[400] ,
    offset: Offset(0.5,0.5))

    ],
    shape: BoxShape.rectangle,
    color: Colors.white ,
    borderRadius: BorderRadius.all(Radius.circular(10))
    ),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
    Image.asset('lib/assests/edtimes.png' , width: (MediaQuery.of(context).size.width/2)-32, height: 100.0,),
    ],
    )),),
    ],),
    )
    );
    }
    )););
}
}

