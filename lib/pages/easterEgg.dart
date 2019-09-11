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
    body:Container(child:Center(child:Text("Tech Team Bhagwan Hai"))) ,
    ) ;
  }

}