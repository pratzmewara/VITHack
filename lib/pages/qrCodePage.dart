import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'dart:convert';
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
//     if(email.compareTo("")==0||email==null||email.compareTo("yo")==0){
// setState(() {
//   currentIndex=1;
// });
//     }
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        //titleSpacing: 50.0,
        title: Text('QR Code',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 23.0),),
        backgroundColor : Colors.white,
        //shape: BeveledRectangleBorder( borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.0) , bottomRight: Radius.circular(10.0)),),
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
        // width: MediaQuery.of(context).size.width,
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
        child:Text("Email : "+email)
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
                  boxShadow:<BoxShadow>[
                    BoxShadow(
                      blurRadius: 10.0,
                      color:Colors.grey[400] ,
                      offset: Offset(0.5,0.5)
                    )

                  ],
                  shape: BoxShape.rectangle,
                  color: Colors.blue[500] ,
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

