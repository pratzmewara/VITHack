import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:vit_hack/models/sharedPref.dart';
import 'package:vit_hack/pages/loginScreen.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key,}) : super(key: key);

  @override
  _HomePageState createState() => new _HomePageState();
}



 
class CustomPopupMenu {
  CustomPopupMenu({this.title, this.icon});
 
  String title;
  IconData icon;
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
}


Widget bullet(){
    return new Container(
      height: 10.0,
      width: 10.0,
      decoration: new BoxDecoration(
        color: Colors.blue,
        shape: BoxShape.circle,
      ),
    );
}
List<CustomPopupMenu> choices = <CustomPopupMenu>[
  CustomPopupMenu(title: 'Logout'),
];
SharedPreferencesTest s=new SharedPreferencesTest();

 void _select(CustomPopupMenu choice) {
    setState(() {
      
    });
    if(choice.title=='Logout'){
      s.setEmail("");
      s.setLogincheck("false");
      s.setToken("");
        Navigator.of(context).popUntil((route) => route.isFirst);
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => LoginScreen()));

    }
  }
  @override
  Widget build(BuildContext context) {

    return new Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
            //titleSpacing: 50.0,
            title:  Text("Home" , style: TextStyle(fontSize:23.0, fontWeight: FontWeight.bold, color: Colors.black),),
       actions: <Widget>[
          Theme(
            data: Theme.of(context).copyWith(
              cardColor: Colors.white,
              iconTheme: IconThemeData(color: Colors.black),
            ),
            child: ListTileTheme(
              iconColor: Colors.black,
              child: 
      PopupMenuButton<CustomPopupMenu>(
            elevation: 3.2,
            initialValue: choices[0],
            
            onCanceled: () {
              print('You have not choosed anything');
            },
            tooltip: 'This is tooltip',
            onSelected: _select,
            itemBuilder: (BuildContext context) {
              return choices.map((CustomPopupMenu choice) {
                return PopupMenuItem<CustomPopupMenu>(
                  value: choice,
                  child: Text(choice.title),
                );
              }).toList();
            },
          )))
        ],
         
          ),
          backgroundColor: Colors.white,
          body : Container(
            margin: EdgeInsets.only(top: 10.0, left: 30.0),
            alignment: Alignment.centerLeft,
          child : Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
            alignment:Alignment.center,
            child :Text('Day 1', style: TextStyle(fontSize:27.0, fontWeight: FontWeight.bold, color: Colors.blue),),
          ),
              Container(
                margin: EdgeInsets.only(top: 10.0, bottom: 20.0),
                child : Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      Container(
                      margin: EdgeInsets.only(top: 10.0, bottom: 20.0),
                        child : Text('Bootcamp'  , style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold,)),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10.0, bottom: 2.0),
                        child : Row(
                          children: <Widget>[
                            bullet(),
                            Padding(
                              padding: EdgeInsets.only(left: 10.0),
                            ),
                            Text('10:00 am - 3:00 pm', style: TextStyle(fontSize: 15.0,  color: Colors.blue),),
                          ],
                        )
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 5.0, bottom: 20.0),
                          child : Text('Registration' ,  style: TextStyle(fontSize: 15.0, )),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 10.0, bottom: 2.0),
                          child : Row(
                            children: <Widget>[
                              bullet(),
                              Padding(
                                padding: EdgeInsets.only(left: 10.0),
                              ),
                              Text('10:00 am - 3:00 pm', style: TextStyle(fontSize: 15.0,  color: Colors.blue),),
                            ],
                          )
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5.0, bottom: 20.0),
                        child : Text('Registration' ,  style: TextStyle(fontSize: 15.0, )),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 10.0, bottom: 2.0),
                          child : Row(
                            children: <Widget>[
                              bullet(),
                              Padding(
                                padding: EdgeInsets.only(left: 10.0),
                              ),
                              Text('10:00 am - 3:00 pm', style: TextStyle(fontSize: 15.0,  color: Colors.blue),),
                            ],
                          )
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5.0, bottom: 20.0),
                        child : Text('Registration' ,  style: TextStyle(fontSize: 15.0, )),
                      ),
                  ]
              ),),
            ],
          )),
     );
  }
}