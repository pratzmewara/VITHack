import 'package:flutter/material.dart';
import 'package:vit_hack/Presentation/util.dart';

class EasterEgg extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
  
    return EasterEggState();
  }
  
}

class EasterEggState extends State<EasterEgg>{
  @override
  Widget build(BuildContext context) {
  
    return Scaffold
    (
      appBar: AppBar(
        iconTheme: IconThemeData(
        color: Colors.black, //change your color here
        ),
      title: Text("The Tech Team",style: TextStyle(color: Colors.black),),backgroundColor: background,centerTitle: true,
      elevation: 0,
    ),
    backgroundColor: background,
    body: SingleChildScrollView(
      child: Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: <Widget>[
           Container(
            padding: EdgeInsets.all(10.0),
            child: Text("Some text"),
          ),
          Image.asset("lib/assests/group_picture.jpg"),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text("From left to right:"),
          ),


          Container(
            padding: EdgeInsets.only(top: 10.0, bottom: 5.0),
            child: Text("Angad Sharma", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 17.0),),
          ),
          Container(
            child: Text("(Backend Developer)"),
          ),
          Container(
            padding: EdgeInsets.only(top: 10.0, bottom: 5.0),
            child: Text("Prateek Mewara", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 17.0),),
          ),
          Container(
            child: Text("(Andriod Developer)"),
          ),
          Container(
            padding: EdgeInsets.only(top: 10.0, bottom: 5.0),
            child: Text("Ayush Priya", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 17.0),),
          ),
          Container(
            child: Text("(Tech Lead)"),
          ),
          Container(
            padding: EdgeInsets.only(top: 10.0, bottom: 5.0),
            child: Text("Satkriti Singh", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 17.0),),
          ),
          Container(
            child: Text("(Andriod Developer)"),
          ),
          Container(
            padding: EdgeInsets.only(top: 10.0, bottom: 5.0),
            child: Text("Nikhil Singh", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 17.0),),
          ),
          Container(
            child: Text("(Frontend Developer)"),
          ),
          
        ],
      ),
    ) ),
    ) ;
  }

}