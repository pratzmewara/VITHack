import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';
import 'package:vit_hack/pages/loginScreen.dart';
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

  int currentIndex=0;
  String email="";

  SharedPreferencesTest s = new SharedPreferencesTest();
  Future<String> futureEmail;
  getEmail() async{
    futureEmail=s.getEmail();
    futureEmail.then((res){

      if(res.compareTo("")==0||res==null||res.compareTo("yo")==0){
      setState(() {
        email=res; 
        currentIndex=0;
    });
       }
       else{
          setState(() {
          email=res; 
          currentIndex=1;
    });
       }
    });
  }

  @override
  Widget build(BuildContext context) {
    print("Email is "+email+currentIndex.toString());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 23.0),),
        backgroundColor : Colors.white,

         bottom: PreferredSize(
child: 
Container(
child:Row(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: <Widget>[
  Container( margin: EdgeInsets.fromLTRB(32, 8, 16, 8),
  child: Text("QR Code" , style: TextStyle(fontSize:23.0, fontWeight: FontWeight.bold, color: Colors.black),textAlign: TextAlign.left,),),
      
],)),
  preferredSize: const Size.fromHeight(50.0)),
     
     ),
      backgroundColor: Colors.white,
      body: Center(
        child : currentIndex==0 ? noQrPage() : qrPage()
      )
    );
}

Widget qrPage(){
  return Container(
    alignment: Alignment.center,
    child : LayoutBuilder(
    builder: (BuildContext context, BoxConstraints viewportConstraints) {
    return Container(
    padding: EdgeInsets.only(bottom:20.0),
    child: ConstrainedBox(
    constraints: BoxConstraints(
    minHeight: viewportConstraints.maxHeight,
    ),
    child: Column(
    mainAxisSize: MainAxisSize.max,
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      QrImage(
        data: email,
        //version: 3,
        size: 200.0,
      ),
      Container(
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Email : ", style: TextStyle(fontWeight: FontWeight.bold),),
            Text(email)
          ],
        )
      )
    ],),
    )
    );
    }
    ));
}

Widget noQrPage(){
  return Container(
    alignment: Alignment.center,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text("Log in to redeem your coupons."),
         GestureDetector(
                      child: Container(
                        // margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/20),
                        width: MediaQuery.of(context).size.width/2,
                        alignment: Alignment.center,
                         decoration: BoxDecoration(

                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            stops: [ 0.1,0.3,0.7,0.9],
                            colors: [
                      Color(0xFF2196F3),
                      Color(0xFF1E88E5),
                        Color(0xFF1976D2),
                        Color(0xFF1565C0),
                      ],),
                                                            
                  boxShadow:<BoxShadow>[
                    BoxShadow(
                      blurRadius: 10.0,
                      color:Colors.grey[400] ,
                      offset: Offset(0.5,0.5)
                    )

                  ],
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                        child : Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                        padding: EdgeInsets.all(20.0),
                      ),
                      onTap: (){
                        s.setLogincheck('false');
                        Navigator.of(context).popUntil((route) => route.isFirst);
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => LoginScreen()));
                        }, 
                    ),
      ],
    ),
  );
}
}

