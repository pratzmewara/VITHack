import 'dart:async';
import 'package:flutter/material.dart';
import 'package:vit_hack/main.dart';
import 'package:vit_hack/models/sharedPref.dart';
import 'package:vit_hack/pages/loginScreen.dart';

class SplashScreen extends StatefulWidget {


  SplashScreen({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _SplashScreenState();
  }
}
class _SplashScreenState extends State<SplashScreen> {

  SharedPreferencesTest s= new SharedPreferencesTest();

  Future<bool> checkLogin;
  String setLogin ="false";

  Future<String> checkPersonName;
  String setPersonName ="false";

  Future<String> checkPersonID;
  String setPersonID ="false";


  _SplashScreenState({Key key });
  @override
  void initState() {
    super.initState();
    go();
  }

  go(){
      Future.delayed(const Duration(seconds:3),()
    {
      Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (BuildContext context) =>
                      new LoginScreen()));
      /*if (setLogin.compareTo(true.toString()) == 0 || setLogin=="true") {
        new Future.delayed(
            const Duration(seconds: 0),
                () => Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (BuildContext context) =>
                      new MyHomePage()))

          );
        }
        else{
          new Future.delayed(
              const Duration(seconds: 0),

                  () => Navigator.of(context).pushReplacementNamed('/intro')

          );
        }*/
    });
  }

  String checktext() {
    checkLogin = s.getLogincheck();
    checkLogin.then((resultString) {
      setState(() {
        setLogin = resultString.toString();
        print(setLogin);
        print("Value of login check is" + setLogin.toString());
      });
    });

    checkPersonName = s.getPersonName();
    checkPersonName.then((resultString) {
      setState(() {
        setPersonName = resultString.toString();
        print(setPersonName);
        print("Value of Person Name check is" + setPersonName.toString());
      });
    });

  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/4),
          alignment: Alignment(0, 0),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 42.0),
            ),
            Expanded(
              child: Text(
                        "VITHack",
                        style: TextStyle(
                          color: Colors.blue,
                            fontWeight: FontWeight.w900,
                            fontSize: 32.0),
                      ),flex: 1,),
          ],
        ) ,
        )       
    );
  }
}