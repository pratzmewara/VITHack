import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'dart:convert';
import 'dart:async';
import 'package:vit_hack/Presentation/util.dart';
import 'package:flip_card/flip_card.dart';
import 'package:snaplist/snaplist.dart';
import 'package:vit_hack/Presentation/util.dart';
import 'easterEgg.dart';

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
    addList();
  }

  List<String> name=["Druvang Wagh","Hardik Kataria","Ekaansh Arora","Ayush Priya","Samarth Nayyar","Kriti Kacker","Naynika Wason","Dhruvika Sharma","Pranav Sharma",
"Rohan Kumar", "Vipul Kothari","Sameeran Bandishti","Shreyansh Ojha","Shaanvi Mehta","Harshil Parekh"];

  List<String> des=["Director","Co-Director","Co-Director","Organizer Techical","Organizer Design","Organizer Participants","Organizer Content","Organizer","Organizer Collaboration",
"Organizer Finance", "Organizer","Organizer Participants","Organizer Logistics","Organizer IR","Organizer Marketing"];

  List<String> image=["lib/Druvang_Wagh.jpg", "lib/Hardik_Kataria.jpg", "lib/Ekaansh_Arora.jpg", "lib/Ayush_Priya.jpg", "lib/Samarth_Nayyar.jpg", "lib/Kriti_Kacker.jpg",
  "lib/Naynika_Wason.jpg","lib/Dhruvika_Sharma.JPG", "lib/Pranav_Sharma.jpg", "lib/Rohan_Kumar.jpg", "lib/Vipul_Kothari.jpg", "lib/Sameeran_Bandishti.jpg", 
  "lib/Shreyansh_Ojha.jpg", "lib/Shaanvi_mehta.jpg", "lib/Harshil_parekh.jpg"];

  List<String> number=["8369091192","8860445756","8860092479","9431175490","9818288112","8004936388","8894721774","","9811069173",
  "9629888511","","7350190101","7023398836","9818489663","9624099868"];

  List<String> email =["dhruvang.wagh@gmail.com","hardikkataria2699@gmail.com","ekaansh68@gmail.com","","samarthnayyar123@gmail.com","kritikacker12@gmail.com","nay9139@gmail.com","","pspranavsharma9@gmail.com",
  "rk61198@gmail.com","","sameeranbandishti@ieee.org","shreyansh.ojha98@gmail.com","shaanvimehta@gmail.com","harshilparekh15@gmail.com"];



  addList(){
    setState(() {
      list.add(new Details("Name", "Designation", "Email", 123456789));
      list.add(new Details("Name", "Designation", "Email", 123456789));
      list.add(new Details("Name", "Designation", "Email", 123456789));
      list.add(new Details("Name", "Designation", "Email", 123456789));
      list.add(new Details("Name", "Designation", "Email", 123456789));
      list.add(new Details("Name", "Designation", "Email", 123456789));
      list.add(new Details("Name", "Designation", "Email", 123456789));
      list.add(new Details("Name", "Designation", "Email", 123456789));
      list.add(new Details("Name", "Designation", "Email", 123456789));
      list.add(new Details("Name", "Designation", "Email", 123456789));
      list.add(new Details("Name", "Designation", "Email", 123456789));
    });
    //print(list[0].name.toSColors.white,tring());
  }

  List<Details> list=[];
  SnaplistController snaplistController = new SnaplistController(
      initialPosition: 3
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        //titleSpacing: 50.0,
        title: Text('',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 23.0),),
        backgroundColor : background,
         bottom: PreferredSize(
child: 
Container(
child:Row(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: <Widget>[
  Container( margin: EdgeInsets.fromLTRB(32, 8, 16, 8),
  child: Text("Contact Us" , style: TextStyle(fontSize:23.0, fontWeight: FontWeight.bold, color: Colors.black),textAlign: TextAlign.left,),),
      
],)),
  preferredSize: const Size.fromHeight(50.0)),
      ),
      backgroundColor:background,
      body: Container(
        color: background,
        width: MediaQuery.of(context).size.width,
    child: SnapList(
    axis: Axis.vertical,
    sizeProvider : (index, data) => Size(MediaQuery.of(context).size.width, 3*MediaQuery.of(context).size.height/5),
    separatorProvider : (index, data) => Size(0.0, 0.0),
    builder: (context, index, data) => Container(
      child : Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      FlipCard(
        direction: FlipDirection.HORIZONTAL,
        front:GestureDetector(
          onDoubleTap: (){
            if(index==3){
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) =>EasterEgg()));
            }
          },
          child: Container(
          margin: EdgeInsets.all(12),
         width: (MediaQuery.of(context).size.width/4)*3,
          height: (MediaQuery.of(context).size.height/2),
          padding: EdgeInsets.only(top: 10.0),
          decoration: BoxDecoration(
            boxShadow:<BoxShadow>[
              BoxShadow(blurRadius: 10.0,
              color:Colors.grey[400] ,
              offset: Offset(0.5,0.5))
            ],
            shape: BoxShape.rectangle,
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[ 
              new Container(
                    width: 210.0,
                    height: 210.0,
                    decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(image[index])
                        ),
                            //image: Image.asset( image[index] ),
                )
              ),
              Container(
                height: 20.0,
                width: 20.0,
              ),
              Text(name[index], style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),),
              Text(des[index], style: TextStyle(fontSize: 17.0)),
              ],
            )
          )),
          back: Container(
          margin: EdgeInsets.all(12),
          width: (MediaQuery.of(context).size.width/4)*3,
          height: (MediaQuery.of(context).size.height/2),
          padding: EdgeInsets.only(top: 10.0),
          decoration: BoxDecoration(
            boxShadow:<BoxShadow>[
              BoxShadow(blurRadius: 10.0,
              color:Colors.grey[400] ,
              offset: Offset(0.5,0.5))
            ],
            shape: BoxShape.rectangle,
            color: Colors.white ,
            borderRadius: BorderRadius.all(Radius.circular(10)
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Email : "+email[index]),
              Text("Phone Number : "+number[index].toString())
            ],
            )
          ),
      ),
      // Text(name[index], style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),),
      // Text(des[index], style: TextStyle(fontSize: 17.0)),
      // Container(
      //   height: 100.0,
      // )
      ])),
      count: 15,
      snaplistController: snaplistController,
  )
   /* Column(

    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      FlipCard(
        direction: FlipDirection.HORIZONTAL,
        front: Container(
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
            borderRadius: BorderRadius.all(Radius.circular(10)
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset('lib/assests/reliance.png' , width: (MediaQuery.of(context).size.width/2)-32, height: 100.0,),
              Text("Name"),
              Text("Designation")
              ],
            )
          ),
          back: Container(
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
            borderRadius: BorderRadius.all(Radius.circular(10)
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Email"),
              Text("Phone Number")
            ],
            )
          ),
      ),
      FlipCard(
        direction: FlipDirection.HORIZONTAL,
        front: Container(
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
            borderRadius: BorderRadius.all(Radius.circular(10)
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset('lib/assests/reliance.png' , width: (MediaQuery.of(context).size.width/2)-32, height: 100.0,),
              Text("Name"),
              Text("Designation")
              ],
            )
          ),
          back: Container(
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
            borderRadius: BorderRadius.all(Radius.circular(10)
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Email"),
              Text("Phone Number")
            ],
            )
          ),
      ),
      FlipCard(
        direction: FlipDirection.HORIZONTAL,
        front: Container(
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
            borderRadius: BorderRadius.all(Radius.circular(10)
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset('lib/assests/reliance.png' , width: (MediaQuery.of(context).size.width/2)-32, height: 100.0,),
              Text("Name"),
              Text("Designation")
              ],
            )
          ),
          back: Container(
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
            borderRadius: BorderRadius.all(Radius.circular(10)
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Email"),
              Text("Phone Number")
            ],
            )
          ),
      ),
      FlipCard(
        direction: FlipDirection.HORIZONTAL,
        front: Container(
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
            borderRadius: BorderRadius.all(Radius.circular(10)
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset('lib/assests/reliance.png' , width: (MediaQuery.of(context).size.width/2)-32, height: 100.0,),
              Text("Name"),
              Text("Designation")
              ],
            )
          ),
          back: Container(
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
            borderRadius: BorderRadius.all(Radius.circular(10)
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Email"),
              Text("Phone Number")
            ],
            )
          ),
      ),
      FlipCard(
        direction: FlipDirection.HORIZONTAL,
        front: Container(
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
            borderRadius: BorderRadius.all(Radius.circular(10)
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset('lib/assests/reliance.png' , width: (MediaQuery.of(context).size.width/2)-32, height: 100.0,),
              Text("Name"),
              Text("Designation")
              ],
            )
          ),
          back: Container(
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
            borderRadius: BorderRadius.all(Radius.circular(10)
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Email"),
              Text("Phone Number")
            ],
            )
          ),
      ),
      FlipCard(
        direction: FlipDirection.HORIZONTAL,
        front: Container(
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
            borderRadius: BorderRadius.all(Radius.circular(10)
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset('lib/assests/reliance.png' , width: (MediaQuery.of(context).size.width/2)-32, height: 100.0,),
              Text("Name"),
              Text("Designation")
              ],
            )
          ),
          back: Container(
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
            borderRadius: BorderRadius.all(Radius.circular(10)
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Email"),
              Text("Phone Number")
            ],
            )
          ),
      ),
      FlipCard(
        direction: FlipDirection.HORIZONTAL,
        front: Container(
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
            borderRadius: BorderRadius.all(Radius.circular(10)
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset('lib/assests/reliance.png' , width: (MediaQuery.of(context).size.width/2)-32, height: 100.0,),
              Text("Name"),
              Text("Designation")
              ],
            )
          ),
          back: Container(
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
            borderRadius: BorderRadius.all(Radius.circular(10)
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Email"),
              Text("Phone Number")
            ],
            )
          ),
      ),
      FlipCard(
        direction: FlipDirection.HORIZONTAL,
        front: Container(
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
            borderRadius: BorderRadius.all(Radius.circular(10)
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset('lib/assests/reliance.png' , width: (MediaQuery.of(context).size.width/2)-32, height: 100.0,),
              Text("Name"),
              Text("Designation")
              ],
            )
          ),
          back: Container(
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
            borderRadius: BorderRadius.all(Radius.circular(10)
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Email"),
              Text("Phone Number")
            ],
            )
          ),
      ),
      FlipCard(
        direction: FlipDirection.HORIZONTAL,
        front: Container(
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
            borderRadius: BorderRadius.all(Radius.circular(10)
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset('lib/assests/reliance.png' , width: (MediaQuery.of(context).size.width/2)-32, height: 100.0,),
              Text("Name"),
              Text("Designation")
              ],
            )
          ),
          back: Container(
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
            borderRadius: BorderRadius.all(Radius.circular(10)
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Email"),
              Text("Phone Number")
            ],
            )
          ),
      ),
      FlipCard(
        direction: FlipDirection.HORIZONTAL,
        front: Container(
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
            borderRadius: BorderRadius.all(Radius.circular(10)
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset('lib/assests/reliance.png' , width: (MediaQuery.of(context).size.width/2)-32, height: 100.0,),
              Text("Name"),
              Text("Designation")
              ],
            )
          ),
          back: Container(
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
            borderRadius: BorderRadius.all(Radius.circular(10)
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Email"),
              Text("Phone Number")
            ],
            )
          ),
      ),
      FlipCard(
        direction: FlipDirection.HORIZONTAL,
        front: Container(
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
            borderRadius: BorderRadius.all(Radius.circular(10)
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset('lib/assests/reliance.png' , width: (MediaQuery.of(context).size.width/2)-32, height: 100.0,),
              Text("Name"),
              Text("Designation")
              ],
            )
          ),
          back: Container(
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
            borderRadius: BorderRadius.all(Radius.circular(10)
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Email"),
              Text("Phone Number")
            ],
            )
          ),
      ),
      FlipCard(
        direction: FlipDirection.HORIZONTAL,
        front: Container(
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
            borderRadius: BorderRadius.all(Radius.circular(10)
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset('lib/assests/reliance.png' , width: (MediaQuery.of(context).size.width/2)-32, height: 100.0,),
              Text("Name"),
              Text("Designation")
              ],
            )
          ),
          back: Container(
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
            borderRadius: BorderRadius.all(Radius.circular(10)
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Email"),
              Text("Phone Number")
            ],
            )
          ),
      ),
      FlipCard(
        direction: FlipDirection.HORIZONTAL,
        front: Container(
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
            borderRadius: BorderRadius.all(Radius.circular(10)
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset('lib/assests/reliance.png' , width: (MediaQuery.of(context).size.width/2)-32, height: 100.0,),
              Text("Name"),
              Text("Designation")
              ],
            )
          ),
          back: Container(
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
            borderRadius: BorderRadius.all(Radius.circular(10)
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Email"),
              Text("Phone Number")
            ],
            )
          ),
      ),
      FlipCard(
        direction: FlipDirection.HORIZONTAL,
        front: Container(
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
            borderRadius: BorderRadius.all(Radius.circular(10)
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset('lib/assests/reliance.png' , width: (MediaQuery.of(context).size.width/2)-32, height: 100.0,),
              Text("Name"),
              Text("Designation")
              ],
            )
          ),
          back: Container(
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
            borderRadius: BorderRadius.all(Radius.circular(10)
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Email"),
              Text("Phone Number")
            ],
            )
          ),
      ),
      FlipCard(
        direction: FlipDirection.HORIZONTAL,
        front: Container(
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
            borderRadius: BorderRadius.all(Radius.circular(10)
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset('lib/assests/reliance.png' , width: (MediaQuery.of(context).size.width/2)-32, height: 100.0,),
              Text("Name"),
              Text("Designation")
              ],
            )
          ),
          back: Container(
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
            borderRadius: BorderRadius.all(Radius.circular(10)
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Email"),
              Text("Phone Number")
            ],
            )
          ),
      ),
      FlipCard(
        direction: FlipDirection.HORIZONTAL,
        front: Container(
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
            borderRadius: BorderRadius.all(Radius.circular(10)
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset('lib/assests/reliance.png' , width: (MediaQuery.of(context).size.width/2)-32, height: 100.0,),
              Text("Name"),
              Text("Designation")
              ],
            )
          ),
          back: Container(
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
            borderRadius: BorderRadius.all(Radius.circular(10)
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Email"),
              Text("Phone Number")
            ],
            )
          ),
      ),
      FlipCard(
        direction: FlipDirection.HORIZONTAL,
        front: Container(
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
            borderRadius: BorderRadius.all(Radius.circular(10)
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset('lib/assests/reliance.png' , width: (MediaQuery.of(context).size.width/2)-32, height: 100.0,),
              Text("Name"),
              Text("Designation")
              ],
            )
          ),
          back: Container(
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
            borderRadius: BorderRadius.all(Radius.circular(10)
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Email"),
              Text("Phone Number")
            ],
            )
          ),
      ),
    ],),*/
          //)
          //);
          //}
          //)
        ));
  }
}

class  Details{
  String name, designation,email;
  int phone;
  Details(String name, String designation,String email, int phone){
    name = this.name;
    designation = this.designation;
    email = this.email;
    phone = this.phone;
  }
}


/*import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'dart:convert';
import 'dart:async';
import 'package:flip_card/flip_card.dart';
import 'package:snaplist/snaplist.dart';
import 'package:indexed_list_view/indexed_list_view.dart';
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
    addList();
  }
  addList(){
    setState(() {
    list.add(new Details("Name", "Designation", "Email", 123456789));
    list.add(new Details("Name", "Designation", "Email", 123456789));
    list.add(new Details("Name", "Designation", "Email", 123456789));
    list.add(new Details("Name", "Designation", "Email", 123456789));
    list.add(new Details("Name", "Designation", "Email", 123456789));
    list.add(new Details("Name", "Designation", "Email", 123456789));
    list.add(new Details("Name", "Designation", "Email", 123456789));
    list.add(new Details("Name", "Designation", "Email", 123456789));
    list.add(new Details("Name", "Designation", "Email", 123456789));
    list.add(new Details("Name", "Designation", "Email", 123456789));
    list.add(new Details("Name", "Designation", "Email", 123456789));
     });
    //print(list[0].name.toString());
  }
  List<Details> list=[];
  static IndexedScrollController controller = IndexedScrollController(initialIndex: 5);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Contact Us',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 23.0),),
        backgroundColor : Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width,
    child: IndexedListView.builder(
        maxItemCount: 11,
        minItemCount: 0,
        controller: controller,
        itemBuilder: (context, index) =>  Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      FlipCard(
        direction: FlipDirection.HORIZONTAL,
        front: Container(
          margin: EdgeInsets.all(12),
          width: (MediaQuery.of(context).size.width-20),
          height: (MediaQuery.of(context).size.height/2),
          padding: EdgeInsets.only(top: 10.0),
          decoration: BoxDecoration(
            boxShadow:<BoxShadow>[
              BoxShadow(blurRadius: 10.0,
              color:Colors.grey[400] ,
              offset: Offset(0.5,0.5))
            ],
            shape: BoxShape.rectangle,
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset('lib/assests/reliance.png' , width: (MediaQuery.of(context).size.width/2)-32, height: 100.0,),
              ],
            )
          ),
          back: Container(
          margin: EdgeInsets.all(12),
          width: (MediaQuery.of(context).size.width-20),
          height: (MediaQuery.of(context).size.height/2),
          padding: EdgeInsets.only(top: 10.0),
          decoration: BoxDecoration(
            boxShadow:<BoxShadow>[
              BoxShadow(blurRadius: 10.0,
              color:Colors.grey[400] ,
              offset: Offset(0.5,0.5))
            ],
            shape: BoxShape.rectangle,
            color: Colors.white ,
            borderRadius: BorderRadius.all(Radius.circular(10)
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Email : "),
              Text("Phone Number : ")
            ],
            )
          ),
      ),
      Text("Name : "+index.toString()),
      Text("Designation : ")]),
        ),
      ),
      );
}
}
class  Details{
  String name, designation,email;
  int phone;
  Details(String name, String designation,String email, int phone){
   name = this.name;
   designation = this.designation;
   email = this.email;
   phone = this.phone;
  }
}*/