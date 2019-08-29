import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:qrcode_reader/qrcode_reader.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  
  GlobalKey<FormState> _key = new GlobalKey();


    @override
    void initState() {
    super.initState();
  }

  String tokenValue ;
  bool _validate = false;
  String code;

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor: Colors.white,
     body: new Form(
      key: _key,
      autovalidate: _validate,
      child: FormUI(),
    ), );
  }

  bool _load = false;
  
  Widget FormUI() {

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
                  Text("Logging in",style: TextStyle(fontSize: 16.0 ,fontWeight: FontWeight.w500,decoration: TextDecoration.none),)
                ],
              )
          ) )),
        ))):new Container();

    return  Stack(
      children: <Widget>[
      SingleChildScrollView(
      child : Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(16.0),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              "Login",
                style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18.0),
              ),
            Container(
                        padding: EdgeInsets.only(left: 16.0,right:16.0,top: 26.0),
                        child: TextFormField(
                            style: TextStyle(color: Colors.blue,fontFamily: 'Raleway'),
                            cursorColor: Theme.of(context).primaryColor,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Enter your code',
                                labelText: 'Code'
                            ),
                            validator: validateEM,
                            onSaved: (String val) {
                              code = val;
                              print("Code"+code);
                            }
                        )
                    ),
                  GestureDetector(
                      child: Container(
                        width: 200.0,
                        alignment: Alignment.center,
                         decoration: BoxDecoration(
                  boxShadow:<BoxShadow>[
                    BoxShadow(
                      blurRadius: 5.0,
                      color:Colors.grey[600] ,
                      offset: Offset(0.5,0.5)
                    )

                  ],
                  shape: BoxShape.rectangle,
                  color: Colors.blue[400] ,
                  borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                        child : Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                        padding: EdgeInsets.all(20.0),
                      ),
                      onTap: (){
                        _login_Server();
                        }, 
                    ),
                    GestureDetector(
                      child: Container(
                        alignment: Alignment.center,
                        width: 200.0,
                         decoration: BoxDecoration(
                  boxShadow:<BoxShadow>[
                    BoxShadow(
                      blurRadius: 5.0,
                      color:Colors.grey[600] ,
                      offset: Offset(0.5,0.5)
                    )

                  ],
                  shape: BoxShape.rectangle,
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                        child : Text("QR Code", style: TextStyle (fontWeight: FontWeight.bold),),
                        padding: EdgeInsets.all(20.0),
                      ),
                      onTap: (){
                        _scanQR();
                        }, 
                    )
          ],
        )
        /*new Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround ,
            children: <Widget>[
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                            Expanded(
                              child: Text(
                                        "Login",
                                          style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.0),
                                      ),flex: 1,)
                          ],
                        ),
                        ),
                   /* Container(
                        padding: EdgeInsets.only(left: 16.0,right:16.0,top: 26.0),
                        child: Theme(
                          child: TextFormField(
                            style: TextStyle(color: Colors.blue,fontFamily: 'Raleway'),
                            cursorColor: Theme.of(context).primaryColor,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Enter your code',
                                labelText: 'Code'
                            ),
                            validator: validateEM,
                            onSaved: (String val) {
                              code = val;
                              print("Code"+code);
                            }
                        )
                        )
                    ),*/
                    GestureDetector(
                      child: Container(
                        child : Text("Login"),
                        padding: EdgeInsets.all(20.0),
                      ),
                      onTap: (){
                        _login_Server();
                        }, 
                    ),
                    GestureDetector(
                      child: Container(
                        child : Text("QR Code"),
                        padding: EdgeInsets.all(20.0),
                      ),
                      onTap: (){
                        _scanQR();
                        }, 
                    )
                  ],
        ),*/
              ),),
      new Align(child: loadingIndicator,alignment: FractionalOffset.center,),
    ]);
  }

  String validateEM(String value) {
    String patttern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(patttern);
    String pattern1 = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp1 = new RegExp(pattern1);
    if(regExp.hasMatch(value) && (value.isNotEmpty)){
      if (value.length == 0) {
        return "Code is Required";
      } 
      return null;
    }
  }

  _login_Server() {
    if(_key.currentState.validate())
    {
      _key.currentState.save();

      // setState(() {
      //   _load=true;
      // });

       Navigator.of(context).pushNamedAndRemoveUntil('/homepage', (Route<dynamic> route) => false);
       
  }
  }

  String result = "Press Scan";

  Future _scanQR() async {
    try {
      print("qwertyuiopsdfghjkzxcvbnm,");
      String qrResult =await  QRCodeReader().scan();
      if(qrResult!=null){
      Navigator.of(context).pushNamedAndRemoveUntil('/homepage', (Route<dynamic> route) => false);
    }
    }

     on FormatException {
      setState(() {
        result = "You pressed the back button before scanning anything";
      });
    }
    catch (ex) {
      setState(() {
        print("Unknown Error $ex");
        result = "Nothing Scanned";
      });
    }
  }
}
