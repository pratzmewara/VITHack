import 'package:intro_slider/dot_animation_enum.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:flutter/material.dart';
import 'package:vit_hack/Presentation/util.dart';
import 'package:vit_hack/main.dart';
import 'package:vit_hack/pages/loginScreen.dart';
import 'package:vit_hack/models/sharedPref.dart';

class IntroScreen extends StatefulWidget {
  IntroScreen({Key key}) : super(key: key);

  @override
  IntroScreenState createState() => new IntroScreenState();
}

class IntroScreenState extends State<IntroScreen> {
  List<Slide> slides = new List();

  Function goToTab;

  SharedPreferencesTest s=new SharedPreferencesTest();

  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
        widgetTitle: Container(
          // margin: EdgeInsets.only(left: 16, right: 16.0),
          child: 
        
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text("Welcome To",style:intoTitleStyle,textAlign: TextAlign.start,),
            Text("VIT Hack",style:intoTitleBlueStyle,textAlign: TextAlign.start,)
          ],
        ),),
        description:
            "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa.",
        styleDescription: TextStyle(
            color: Colors.black,
            fontSize: 16.0,
            fontFamily: 'Raleway'),
        pathImage: 'lib/assests/aboutus.png',
      ),
    );
    slides.add(
      new Slide(
        widgetTitle: Container(
         // margin: EdgeInsets.only(left: 16, right: 16.0),
          child: 
        
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text("Welcome To",style:intoTitleStyle,textAlign: TextAlign.start,),
            Text("VIT Hack",style:intoTitleBlueStyle,textAlign: TextAlign.start,)
          ],
        ),),
        styleTitle: TextStyle(
            color: Color(0xff3da4ab),
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description:
            "Ye indulgence unreserved connection alteration appearance",
         styleDescription: TextStyle(
            color: Colors.black,
            fontSize: 16.0,
            fontFamily: 'Raleway'),
        pathImage: 'lib/assests/aboutus.png',
      ),
    );
    slides.add(
      new Slide(
         widgetTitle: Container(
          //margin: EdgeInsets.only(left: 16, right: 16.0),
          child: 
        
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text("Welcome To",style:intoTitleStyle,textAlign: TextAlign.start,),
            Text("VIT Hack",style:intoTitleBlueStyle,textAlign: TextAlign.start,)
          ],
        ),),
        styleTitle: TextStyle(
            color: Color(0xff3da4ab),
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description:
            "Much evil soon high in hope do view. Out may few northward believing attempted. Yet timed being songs marry one defer men our. Although finished blessing do of",
         styleDescription: TextStyle(
            color: Colors.black,
            fontSize: 16.0,
            fontFamily: 'Raleway'),
        pathImage: 'lib/assests/aboutus.png',
      ),
    );
  }

  void onDonePress() {
    // Back to the first tab
    // this.goToTab(0);
  }

  void onTabChangeCompleted(index) {
    // Index of current tab is focused
  }

  Widget renderNextBtn() {
    return Container();
  }

  Widget renderDoneBtn() {
    return Container();
  }

  Widget renderSkipBtn() {
    return Container();
  }

  List<Widget> renderListCustomTabs() {
    List<Widget> tabs = new List();
    for (int i = 0; i < slides.length; i++) {
      Slide currentSlide = slides[i];
      tabs.add(Container(
        width: double.infinity,
        height: double.infinity,
        child: Container(
         // margin: EdgeInsets.only(bottom: 60.0, top: 60.0),
          child: ListView(
            children: <Widget>[
              Container(
                alignment: Alignment(-1, 0),
                child: currentSlide.widgetTitle,
                // child: Text(
                  
                //   // style: currentSlide.styleTitle,
                //   textAlign: TextAlign.center,
                // ),
                margin: EdgeInsets.only(top: 20.0),
              ),
              GestureDetector(
                  child: Image.asset(
                currentSlide.pathImage,
                width: 200.0,
                height: 200.0,
                fit: BoxFit.contain,
              )),
              
              Container(
                //padding: EdgeInsets.only(left: 16,right: 16),
                child: Text(
                  currentSlide.description,
                  style: currentSlide.styleDescription,
                  textAlign: TextAlign.center,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                ),
                margin: EdgeInsets.only(top: 20.0),
              ),
            ],
          ),
        ),
      ));
    }
    return tabs;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body:Container(
      color:Colors.white,
      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.05, right: MediaQuery.of(context).size.width*0.05),
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: (MediaQuery.of(context).size.height/4)*3,
            child:
    IntroSlider(
      // List slides
      slides: this.slides,

      // Skip button
      renderSkipBtn: this.renderSkipBtn(),
      // colorSkipBtn: Color(0x33ffcc5c),
      // highlightColorSkipBtn: Color(0xffffcc5c),

      // Next button
      renderNextBtn: this.renderNextBtn(),
      isShowSkipBtn: false,
      isShowPrevBtn: false,
      

      // Done button
      renderDoneBtn: this.renderDoneBtn(),
      onDonePress: this.onDonePress,
      isShowDoneBtn: false,
      // colorDoneBtn: Color(0x33ffcc5c),
      // highlightColorDoneBtn: Color(0xffffcc5c),

      // Dot indicator
      colorDot: Colors.blue,
      sizeDot: 13.0,
      typeDotAnimation: dotSliderAnimation.SIZE_TRANSITION,

      // Tabs
      listCustomTabs: this.renderListCustomTabs(),
      backgroundColorAllSlides: Colors.white,
      refFuncGoToTab: (refFunc) {
        this.goToTab = refFunc;
      },

      // Show or hide status bar
      shouldHideStatusBar: true,

      // On tab change completed
      onTabChangeCompleted: this.onTabChangeCompleted,
    )),
    GestureDetector(
                      child: Container(
                        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/20),
                        width: MediaQuery.of(context).size.width/2,
                        alignment: Alignment.center,
                         decoration: BoxDecoration(
                           
                                                              // borderRadius: BorderRadius.circular(10.0),

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
                        // sendToServer();

                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => LoginScreen()));
                        }, 
                    ),
                      GestureDetector(
                      child: Container(
                        width: 145,
                        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/30),
                        alignment: Alignment.center,
                      
                  color: Colors.white,
                        child :Row(children: <Widget>[
                        Text("Skip Login ", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),),
                        Icon(Icons.arrow_forward,color: Colors.grey,)
                        ],) ,
                        padding: EdgeInsets.all(20.0),
                      ),
                      onTap: (){
                        s.setEmail("yo");
                        s.setLogincheck('true');
                        // sendToServer();
                        Navigator.of(context).popUntil((route) => route.isFirst);
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => MyHomePage()));
                        }, 
                    ),
        ],
      ),
    ));
  }
}