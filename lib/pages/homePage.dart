import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:vit_hack/Presentation/util.dart';
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

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;

  _SliverAppBarDelegate(this._tabBar);

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
  BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      color: background,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {

  ScrollController scrollController;

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    getEmail();
    getToken();
    super.initState();
    scrollController = new ScrollController();
    scrollController.addListener(() => setState(() {}));
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

});}

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
     //currentIndex==0?logoutSkip(): 
     logOut();
      // s.setEmail("");
      // s.setLogincheck("false");
      // s.setToken("");
      // Navigator.of(context).popUntil((route) => route.isFirst);
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => LoginScreen()));

    }
  }

  logOut() async{
    if(currentIndex == 0){
      s.setEmail("");
      s.setLogincheck("false");
      s.setToken("");
      Navigator.of(context).popUntil((route) => route.isFirst);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => IntroScreen()));
    }
     
     else{
      setState(() {
        _load=true;
      });
       Future fetchPosts(http.Client client) async {
        print("In logout");
      
        var response = await http.get(URL_LOGOUT, headers: {"Content-Type": "application/json", "Authorization":token},);

        print(response.statusCode);
        print(response.body);

        
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

  // logoutSkip(){
  //   s.setEmail("");
  //           s.setLogincheck("false");
  //           s.setToken("");
  //           Navigator.of(context).popUntil((route) => route.isFirst);
  //           Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => IntroScreen()));
  // }

  bool _load = false;

  @override
  Widget build(BuildContext context) {

    var flexibleSpaceWidget = new SliverAppBar(
      backgroundColor: background,
      expandedHeight: 120.0,
      elevation: 0,
      pinned: true,

      flexibleSpace: FlexibleSpaceBar(

        titlePadding: EdgeInsets.only(left: 20,bottom: 30),
        title: Container(
          margin: EdgeInsets.all(0),
          padding: EdgeInsets.all(0),
          child : Text("Home",
            style: TextStyle(
            color: Colors.black,
            fontSize: 18.0,
            ),

      ),),
    ),
      actions: <Widget>[
        new IconButton(
          icon: Icon(Icons.power_settings_new, color: Colors.black, size: 30,),
          onPressed: logOut,
        )
      ],

    );


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

    return  Scaffold(

      backgroundColor: background,
      body: Stack(
        children: <Widget>[
        new DefaultTabController(
        length: 3,
        child: NestedScrollView(
          controller: scrollController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              flexibleSpaceWidget,
              SliverPersistentHeader(
                delegate: _SliverAppBarDelegate(
                  TabBar(
                    indicator:BoxDecoration(color: background),
                    isScrollable: true,
                    indicatorColor: background,
                    labelColor: Colors.blue,
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      Tab(child:Container(
                        color:background,
                          padding: EdgeInsets.only(left:4 ,right: 32),
                          child: Text("Day 1", style: TextStyle(fontSize: 26.0,fontWeight: FontWeight.w500),)),),
                      Tab(child:Container(
                        color:background,
                        margin: EdgeInsets.only(left: 32,right: 32),
                        child:  Text("Day 2", style: TextStyle(fontSize: 26.0)),)),
                      Tab(child:Container(
                          color:background,
                          margin: EdgeInsets.only(left: 32,right: 32),
                          child: Text("Day 3", style: TextStyle(fontSize: 26.0),))),
                    ],
                  ),
                ),
                pinned: true,
              ),
            ];
          },
          body:Container(
              color: background,
              child: new TabBarView(
              children: <Widget>[
                DayOne(),
                DayTwo(),
                DayThree()
            ],
          )),
        ),
      ),
      loadingIndicator
      ]
      )
    );
  }
   Widget DayThree(){
    return Container(
        //padding: EdgeInsets.only(left: MediaQuery.of(context).size.width/10,right: MediaQuery.of(context).size.width/10),
        margin: EdgeInsets.only(top: 10.0, left:  MediaQuery.of(context).size.width/20),
        alignment: Alignment.centerLeft,
        child : Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
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
                        margin: EdgeInsets.only(top: 10.0, bottom: 2.0,left:  MediaQuery.of(context).size.width/20),
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
                      margin: EdgeInsets.only(top: 5.0, bottom: 20.0,left:  MediaQuery.of(context).size.width/20),
                      child : Text('Registration' ,  style: TextStyle(fontSize: 15.0, )),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 10.0, bottom: 2.0,left:  MediaQuery.of(context).size.width/20),
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
                      margin: EdgeInsets.only(top: 5.0, bottom: 20.0,left:  MediaQuery.of(context).size.width/20),
                      child : Text('Registration' ,  style: TextStyle(fontSize: 15.0, )),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 10.0, bottom: 2.0,left:  MediaQuery.of(context).size.width/20),
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
                      margin: EdgeInsets.only(top: 5.0, bottom: 20.0,left:  MediaQuery.of(context).size.width/20),
                      child : Text('Registration' ,  style: TextStyle(fontSize: 15.0, )),
                    ),

                  ]
              ),),
          ],
        ));
  }
 Widget DayTwo(){
    return Container(
        //padding: EdgeInsets.only(left: MediaQuery.of(context).size.width/10,right: MediaQuery.of(context).size.width/10),
        margin: EdgeInsets.only(top: 10.0, left:  MediaQuery.of(context).size.width/20),
        alignment: Alignment.centerLeft,
        child : Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
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
                        margin: EdgeInsets.only(top: 10.0, bottom: 2.0,left: MediaQuery.of(context).size.width/20),
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
                      margin: EdgeInsets.only(top: 5.0, bottom: 20.0,left:  MediaQuery.of(context).size.width/20),
                      child : Text('Registration' ,  style: TextStyle(fontSize: 15.0, )),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 10.0, bottom: 2.0,left:  MediaQuery.of(context).size.width/20),
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
                      margin: EdgeInsets.only(top: 5.0, bottom: 20.0,left:  MediaQuery.of(context).size.width/20),
                      child : Text('Registration' ,  style: TextStyle(fontSize: 15.0, )),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 10.0, bottom: 2.0,left:  MediaQuery.of(context).size.width/20),
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
                      margin: EdgeInsets.only(top: 5.0, bottom: 20.0,left:  MediaQuery.of(context).size.width/20),
                      child : Text('Registration' ,  style: TextStyle(fontSize: 15.0, )),
                    ),

                  ]
              ),),
          ],
        ));
  }
  Widget DayOne(){
    return Container(


        margin: EdgeInsets.only(top: 10.0, left:  MediaQuery.of(context).size.width/20),

        alignment: Alignment.centerLeft,
        child : Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

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

                        margin: EdgeInsets.only(top: 10.0, bottom: 2.0,left:  MediaQuery.of(context).size.width/20),



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

                      margin: EdgeInsets.only(top: 5.0, bottom: 20.0,left:  MediaQuery.of(context).size.width/20),
                      child : Text('Registration' ,  style: TextStyle(fontSize: 15.0, )),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 10.0, bottom: 2.0,left:  MediaQuery.of(context).size.width/20),

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

                      margin: EdgeInsets.only(top: 5.0, bottom: 20.0,left:  MediaQuery.of(context).size.width/20),
                      child : Text('Registration' ,  style: TextStyle(fontSize: 15.0, )),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 10.0, bottom: 2.0,left:  MediaQuery.of(context).size.width/20),

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

                      margin: EdgeInsets.only(top: 5.0, bottom: 20.0,left:  MediaQuery.of(context).size.width/20),


                      child : Text('Registration' ,  style: TextStyle(fontSize: 15.0, )),
                    ),

                  ]
              ),),
          ],
        ));
  }
}