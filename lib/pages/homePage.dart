import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:vit_hack/models/sharedPref.dart';
import 'package:vit_hack/pages/loginScreen.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vit_hack/models/global.dart';
import 'package:vit_hack/pages/introductoryPage.dart';

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
    getEmail();
    getToken();
}

String token="";
String email="";
int currentIndex=0;
  
SharedPreferencesTest s = new SharedPreferencesTest();
Future<String> futureToken;
Future<String> futureEmail;
getToken() async{
    futureToken=s.getToken();
    futureToken.then((res){
    setState(() {
        token=res; 
    });
<<<<<<< HEAD
});

 futureEmail=s.getEmail();
=======
});}
String email="";
  int currentIndex=0;
  Future<String> futureEmail;
  getEmail() async{
    futureEmail=s.getEmail();
>>>>>>> Design changes
    futureEmail.then((res){

      if(res.compareTo("")==0||res==null||res.compareTo("yo")==0){
 
      setState(() {
        email=res; 
<<<<<<< HEAD
        currentIndex=0;
      
=======
      currentIndex=0;
>>>>>>> Design changes
    });
   
       }
       else{
          setState(() {
          email=res; 
<<<<<<< HEAD
          currentIndex=1;
      
    });
       }
    });
    }
=======
        
      currentIndex=1;
    });
       }
    });
  }
>>>>>>> Design changes


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


 void _select(CustomPopupMenu choice) {
    
    if(choice.title=='Logout'){
     currentIndex==0?logoutSkip(): logOut();
      // s.setEmail("");
      // s.setLogincheck("false");
      // s.setToken("");
      // Navigator.of(context).popUntil((route) => route.isFirst);
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => LoginScreen()));

    }
  }

  logOut() async{
    if(currentIndex == 0){
      Navigator.of(context).popUntil((route) => route.isFirst);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => LoginScreen()));
    }
     
     else{
       Future fetchPosts(http.Client client) async {
        print("In logout");
      
        var response = await http.get(URL_LOGOUT, headers: {"Content-Type": "application/json", "Authorization":token},);

        print(response.statusCode);
        print(response.body);
        setState(() {
         _load=true; 
        });
        
        if (response.statusCode == 200) {
          setState(() {
         _load=false; 
        });
            s.setEmail("");
            s.setLogincheck("false");
            s.setToken("");
            Navigator.of(context).popUntil((route) => route.isFirst);
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => IntroScreen()));
        }
        else{
          setState(() {
         _load=false; 
        });
          Fluttertoast.showToast(
            msg: "Some error occured"
          );
        }
      }

      return FutureBuilder(

          future: fetchPosts(http.Client()),
          builder: (BuildContext context,AsyncSnapshot snapshot){
            if(snapshot.data==null){
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );

            }
            else{
              return Container();

            }
          });
      }
  }

  logoutSkip(){
    s.setEmail("");
            s.setLogincheck("false");
            s.setToken("");
            Navigator.of(context).popUntil((route) => route.isFirst);
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => IntroScreen()));
  }

  bool _load = false;

  @override
  Widget build(BuildContext context) {

     Widget loadingIndicator =_load? new Container(
        color: Colors.transparent,
        height: MediaQuery.of(context).size.height,
        width:  MediaQuery.of(context).size.width,
        child:Center( child:
        Container(
          height: 200,
          width: 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
           gradient:RadialGradient(
             stops: [ 0.1,10],
             colors: [
               Colors.grey[200],
               Colors.grey[400],
             ],),
          ),
          child: new Padding(padding: const EdgeInsets.all(16.0),child: new Center(child:Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new CircularProgressIndicator(),
                  Padding(padding: EdgeInsets.all(5),),
                  Text("Logging out",style: TextStyle(fontSize: 16.0 ,fontWeight: FontWeight.w500,decoration: TextDecoration.none),)
                ],
              )
          ) )),
        ))):new Container();

    return new Stack(
      children: <Widget>[
        Scaffold(
          appBar:
          
          AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
          
            //titleSpacing: 50.0,
<<<<<<< HEAD
            title:  Text("Home" , style: TextStyle(fontSize:23.0, fontWeight: FontWeight.bold, color: Colors.black),),
            actions: <Widget>[
              Theme(
                data: Theme.of(context).copyWith(
                  cardColor: Colors.white,
                  iconTheme: IconThemeData(color: Colors.black),
                ),
                child: ListTileTheme(
                  iconColor: Colors.black,
                  child: PopupMenuButton<CustomPopupMenu>(
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
=======
            title:  Container(
            
            child:Text("" , style: TextStyle(fontSize:23.0, fontWeight: FontWeight.bold, color: Colors.black),)),
       
       bottom: PreferredSize(
child: 
Container(
child:Row(
  // mainAxisAlignment: MainAxisAlignment.start,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: <Widget>[
  Container( margin: EdgeInsets.fromLTRB(32, 8, 16, 8),
  child: Text("Home" , style: TextStyle(fontSize:23.0, fontWeight: FontWeight.bold, color: Colors.black),textAlign: TextAlign.left,),),
      
],)),
  preferredSize: const Size.fromHeight(50.0)),
        
      
       actions: <Widget>[
          Theme(
            data: Theme.of(context).copyWith(
              cardColor: Colors.white,
              iconTheme: IconThemeData(color: Colors.black),
            ),
            child: ListTileTheme(
              iconColor: Colors.black,
              child: PopupMenuButton<CustomPopupMenu>(
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
>>>>>>> Design changes
        ],
         
          ),
          backgroundColor: Colors.white,
          body : Container(
            padding: EdgeInsets.only(left: MediaQuery.of(context).size.width/10,right: MediaQuery.of(context).size.width/10),
            margin: EdgeInsets.only(top: 10.0, left: 15.0),
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
     ),
         new Align(child: loadingIndicator,alignment: FractionalOffset.center,),
      ],
    ) ;
  }
}