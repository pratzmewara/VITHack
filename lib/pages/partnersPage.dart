import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'dart:convert';
import 'dart:async';

class PartnersPage extends StatefulWidget {
  PartnersPage({Key key,this.restaurantID,this.workerID}) : super(key: key);
  final String restaurantID, workerID;

  @override
  _PartnersPageState createState() => _PartnersPageState();
}
class _PartnersPageState extends State<PartnersPage> {

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
        title: Text('About',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
        backgroundColor : Colors.white,
        //shape: BeveledRectangleBorder( borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.0) , bottomRight: Radius.circular(10.0)),),
      ),
      backgroundColor: Colors.white,
      body: Center(
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
          margin: EdgeInsets.all(10),
          width: 150.0,
          padding: EdgeInsets.only(top: 10.0),
          decoration: BoxDecoration(
            boxShadow:<BoxShadow>[
              BoxShadow(blurRadius: 5.0,
              color:Colors.grey[600] ,
              offset: Offset(0.5,0.5))

            ],
            shape: BoxShape.rectangle,
            color: Colors.white ,
            borderRadius: BorderRadius.all(Radius.circular(10))
          ),
           child: Column(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: <Widget>[
              // Image.asset('lib/images/settingssettings.png' , width: 70.0, height: 70.0,),
               Container(
                margin: EdgeInsets.all(15.0),
                child : Text('' , style: TextStyle(fontFamily: 'Raleway'),)),
             ],
           )),),

            GestureDetector(
                onTap : (){
                 
                },
                child : Container(
          // color: Colors.white,
          margin: EdgeInsets.all(10),
          width: 150.0,
          padding: EdgeInsets.only(top: 10.0),
          decoration: BoxDecoration(
            boxShadow:<BoxShadow>[
              BoxShadow(blurRadius: 5.0,
              color:Colors.grey[600] ,
              offset: Offset(0.5,0.5))

            ],
            shape: BoxShape.rectangle,
            color: Colors.white ,
            borderRadius: BorderRadius.all(Radius.circular(10))
          ),
           child: Column(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: <Widget>[
              // Image.asset('lib/images/settingssettings.png' , width: 70.0, height: 70.0,),
               Container(
                margin: EdgeInsets.all(15.0),
                child : Text('' , style: TextStyle(fontFamily: 'Raleway'),)),
             ],
           )),),
           
               GestureDetector(
                onTap : (){
                 
                },
                child : Container(
          // color: Colors.white,
          margin: EdgeInsets.all(10),
          width: 150.0,
          padding: EdgeInsets.only(top: 10.0),
          decoration: BoxDecoration(
            boxShadow:<BoxShadow>[
              BoxShadow(blurRadius: 5.0,
              color:Colors.grey[600] ,
              offset: Offset(0.5,0.5))

            ],
            shape: BoxShape.rectangle,
            color: Colors.white ,
            borderRadius: BorderRadius.all(Radius.circular(10))
          ),
           child: Column(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: <Widget>[
              // Image.asset('lib/images/settingssettings.png' , width: 70.0, height: 70.0,),
               Container(
                margin: EdgeInsets.all(15.0),
                child : Text('' , style: TextStyle(fontFamily: 'Raleway'),)),
             ],
           )),),

            GestureDetector(
                onTap : (){
                 
                },
                child : Container(
          // color: Colors.white,
          margin: EdgeInsets.all(10),
          width: 150.0,
          padding: EdgeInsets.only(top: 10.0),
          decoration: BoxDecoration(
            boxShadow:<BoxShadow>[
              BoxShadow(blurRadius: 5.0,
              color:Colors.grey[600] ,
              offset: Offset(0.5,0.5))

            ],
            shape: BoxShape.rectangle,
            color: Colors.white ,
            borderRadius: BorderRadius.all(Radius.circular(10))
          ),
           child: Column(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: <Widget>[
              // Image.asset('lib/images/settingssettings.png' , width: 70.0, height: 70.0,),
               Container(
                margin: EdgeInsets.all(15.0),
                child : Text('' , style: TextStyle(fontFamily: 'Raleway'),)),
             ],
           )),),
          
               GestureDetector(
                onTap : (){
                 
                },
                child : Container(
          // color: Colors.white,
          margin: EdgeInsets.all(10),
          width: 150.0,
          padding: EdgeInsets.only(top: 10.0),
          decoration: BoxDecoration(
            boxShadow:<BoxShadow>[
              BoxShadow(blurRadius: 5.0,
              color:Colors.grey[600] ,
              offset: Offset(0.5,0.5))

            ],
            shape: BoxShape.rectangle,
            color: Colors.white ,
            borderRadius: BorderRadius.all(Radius.circular(10))
          ),
           child: Column(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: <Widget>[
              // Image.asset('lib/images/settingssettings.png' , width: 70.0, height: 70.0,),
               Container(
                margin: EdgeInsets.all(15.0),
                child : Text('' , style: TextStyle(fontFamily: 'Raleway'),)),
             ],
           )),),


           GestureDetector(
                onTap : (){
                 
                },
                child : Container(
          // color: Colors.white,
          margin: EdgeInsets.all(10),
          width: 150.0,
          padding: EdgeInsets.only(top: 10.0),
          decoration: BoxDecoration(
            boxShadow:<BoxShadow>[
              BoxShadow(blurRadius: 5.0,
              color:Colors.grey[600] ,
              offset: Offset(0.5,0.5))

            ],
            shape: BoxShape.rectangle,
            color: Colors.white ,
            borderRadius: BorderRadius.all(Radius.circular(10))
          ),
           child: Column(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: <Widget>[
              // Image.asset('lib/images/settingssettings.png' , width: 70.0, height: 70.0,),
               Container(
                margin: EdgeInsets.all(15.0),
                child : Text('' , style: TextStyle(fontFamily: 'Raleway'),)),
             ],
           )),),
            ],),
        )
    );
  }
)));
}
}

