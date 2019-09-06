import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'dart:convert';
import 'dart:async';

class PartnersPage extends StatefulWidget {
  PartnersPage({Key key,this.restaurantID,this.workerID}) : super(key: key);
  final String restaurantID, workerID;

  @override
  _PartnersPageState createState() => _PartnersPageState();
}
class _PartnersPageState extends State<PartnersPage> {

  @override
  void initState() {
    super.initState(); 
  }


  bool pressAttentionP=true;
  bool pressAttentionS=false;
  bool pressAttentionPBorder=true;
  bool pressAttentionSBorder=false;



  void PAction(){
    setState(() {
    pressAttentionP=true;
    pressAttentionPBorder=true;
    pressAttentionS=false;
    pressAttentionSBorder=false;
    
    });
  }

  void SAction(){
    setState(() {
    pressAttentionPBorder=false;
    pressAttentionS=true;
    pressAttentionSBorder=true;
    pressAttentionP=false;

    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
      appBar: AppBar(

          titleSpacing: 50.0,
          elevation: 0,
          title: Text('About',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 23.0),),
          backgroundColor : Colors.white,
          //shape: BeveledRectangleBorder( borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.0) , bottomRight: Radius.circular(10.0)),),
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: Colors.white,
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.grey,
            tabs: <Widget>[
              Tab(child: Text("Partners", style: TextStyle(fontSize: 18.0),),),
              Tab(child: Text("Collaborators", style: TextStyle(fontSize: 18.0),)),
              Tab(child: Text("Sponsors", style: TextStyle(fontSize: 18.0),)),
              Tab(child: Text("Speakers", style: TextStyle(fontSize: 18.0),))
            ],
          )


        /*PreferredSize(
          preferredSize: Size.fromHeight(80.0), 
          child :  Container( 
            color: Colors.grey[50],
            padding:  EdgeInsets.symmetric(horizontal: 50.0 , vertical: 20.0) ,
            child : Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(vertical: 5.0),
                decoration: new BoxDecoration(
                  //border: new Border.all(color: Colors.blue),
                  color: Colors.grey[50],
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(70))),   
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    GestureDetector(
                            onTap: (){
                               PAction();
                            },
                          child :Container(
                            alignment: Alignment.center,
                            width: 120.0,
                            padding: EdgeInsets.all(5.0),
                            decoration: new BoxDecoration(
                              border: Border.all(width: 1.0,color:  pressAttentionPBorder ? Colors.blue:Colors.grey[50],),
                              borderRadius: new BorderRadius.all(Radius.circular(70.0)),
                              color: pressAttentionP ? Colors.blue : Colors.grey[50]
                              ),
                            child: Text('Partners',style: TextStyle(fontWeight:pressAttentionPBorder ? FontWeight.bold:FontWeight.normal,color:  pressAttentionP ? Colors.white : Colors.blue , fontSize: 13.0),)
                          
                    ),),
                    GestureDetector(
                            onTap: (){
                             SAction();
                            },
                          child : Container(
                            alignment: Alignment.center,
                            width: 120.0,
                            padding: EdgeInsets.all(5.0),
                            decoration: new BoxDecoration(
                              border: Border.all(width: 1.0,color: pressAttentionSBorder ? Colors.blue:Colors.grey[50],),
                              borderRadius: new BorderRadius.all(Radius.circular(70.0)),
                              color:  pressAttentionS ? Colors.blue : Colors.grey[50]
                            ),
                            child:  Text('Sponsors',style: TextStyle(fontWeight: pressAttentionSBorder ? FontWeight.bold:FontWeight.normal,color: pressAttentionS ? Colors.white : Colors.blue , fontSize: 13.0),)
                    )),
                  ],
                ),
              )
            ],
          )),
        )*/
      ),
      backgroundColor: Colors.white,
      body: TabBarView(
        children: <Widget>[
          PromotionsPage(),

          CollaboratorsPage(),
          SponsorsPage(),
          CollaboratorsPage(),
        ],
      )

            
      )
,);
}

Widget PromotionsPage(){
  return Container(
      width: MediaQuery.of(context).size.width,
      child: LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewportConstraints) {
      return SingleChildScrollView(
        padding: EdgeInsets.only(bottom:20.0),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: viewportConstraints.maxHeight,
          ),
          child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[

            GestureDetector(
              onTap : (){

              },
              child : Container(
                // color: Colors.white,
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
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('lib/assests/codeasylums.png' , width: (MediaQuery.of(context).size.width/2)-32, height: 100.0,),
                    ],
                  )),),

            GestureDetector(
              onTap : (){

              },
              child : Container(
                // color: Colors.white,
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
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('lib/assests/crodera.png' , width: (MediaQuery.of(context).size.width/2)-32, height: 100.0,),
                    ],
                  )),),


            GestureDetector(
              onTap : (){

              },
              child : Container(
                // color: Colors.white,
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
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('lib/assests/valeo.png' , width: (MediaQuery.of(context).size.width/2)-32, height: 100.0,),
                    ],
                  )),),

            GestureDetector(
                onTap : (){
                 
                },
                child : Container(
          // color: Colors.white,
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
            borderRadius: BorderRadius.all(Radius.circular(10))
          ),
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
               Image.asset('lib/assests/Honeywell.jpg' , width: (MediaQuery.of(context).size.width/2)-32, height: 100.0,),
             ],
           )),),
           

            ],),
        )
    );
  }
));
}

  Widget SponsorsPage(){
    return Container(
        width: MediaQuery.of(context).size.width,
        child : LayoutBuilder(
            builder: (BuildContext context, BoxConstraints viewportConstraints) {
              return SingleChildScrollView(
                  padding: EdgeInsets.only(bottom:20.0),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: viewportConstraints.maxHeight,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[

                        GestureDetector(
                          onTap : (){

                          },
                          child : Container(
                            // color: Colors.white,
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
                                  borderRadius: BorderRadius.all(Radius.circular(10))
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Image.asset('lib/assests/challengeRocket.png' , width: (MediaQuery.of(context).size.width/2)-32, height: 100.0,),
                                ],
                              )),),
                      ],),
                  )
              );
            }
        ));
  }

Widget CollaboratorsPage(){
  return Container(
      width: MediaQuery.of(context).size.width,
      child : LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewportConstraints) {
      return SingleChildScrollView(
        padding: EdgeInsets.only(bottom:20.0),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: viewportConstraints.maxHeight,
          ),
          child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[

            GestureDetector(
              onTap : (){

              },
              child : Container(
                // color: Colors.white,
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
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('lib/assests/reliance.png' , width: (MediaQuery.of(context).size.width/2)-32, height: 100.0,),
                    ],
                  )),),
            GestureDetector(
              onTap : (){

              },
              child : Container(
                // color: Colors.white,
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
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('lib/assests/tekno.png' , width: (MediaQuery.of(context).size.width/2)-32, height: 100.0,),
                    ],
                  )),),
            GestureDetector(
              onTap : (){

              },
              child : Container(
                // color: Colors.white,
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
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('lib/assests/edtimes.png' , width: (MediaQuery.of(context).size.width/2)-32, height: 100.0,),
                    ],
                  )),),
            ],),
        )
    );
  }
));
}
}

