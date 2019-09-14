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
    (appBar: AppBar(
       iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
      title: Text("Tech Team",style: TextStyle(color: Colors.black),),backgroundColor: background,centerTitle: true,
    elevation: 0,),
    backgroundColor: background,
    body:Container(
      child: Column(
        children: <Widget>[
          Image.asset("lib/group_picture.jpg"),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text("From left to right:"),
          ),
          Text("Angad Sharma- Backend Developer"),
          Text("Prateek Mewara- Andriod Developer"),
           Text("Ayush Priya- Tech Lead"),
          Text("Satkriti Singh- Android Developer"),
         
          Text("Nikhil Singh- Frontend Developer")
        ],
      ),
    ) ,
    ) ;
  }

}