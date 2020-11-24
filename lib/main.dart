import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:nmarket/onboarding_screen.dart';

 import 'screens/auth_page.dart';
import 'screens/calendar_page.dart';
import 'screens/main_page.dart';
import 'utils/class_builder.dart';

void main() {
  ClassBuilder.registerClasses();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: OnboardingScreen(),
    );
  }
}
class UserLogin extends StatefulWidget {
  @override
  _UserLoginState createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    colorFilter:
                    ColorFilter.mode(Colors.black.withOpacity(0.7),
                        BlendMode.dstATop),
                    image: AssetImage("assets/abc.jpeg"), fit: BoxFit.cover)
            ),
          child: SafeArea(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,

                  child:  ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Image(image: AssetImage("assets/logo1.JPG"),width: 80,height: 80,),
                  ),

                ),
                RaisedButton(

                  onPressed: ()=>{
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => MainWidget() ))
                  },
                  child: Text("Login"),
                )
              ],
            ),
          )
        ),
      );
  }
}

class MainWidget extends StatefulWidget {
  MainWidget({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> with TickerProviderStateMixin {
  KFDrawerController _drawerController;
  DateTime currentBackPressTime;
  @override
  void initState() {
    super.initState();
    _drawerController = KFDrawerController(
      initialPage: ClassBuilder.fromString('MainPage'),
      items: [
        KFDrawerItem.initWithPage(
          text: Text('Home', style: TextStyle(color: Colors.white)),
          icon: Icon(Icons.home, color: Colors.white),
          page: MainPage(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Beverages',
            style: TextStyle(color: Colors.white),
          ),
          icon: Icon(Icons.fastfood, color: Colors.white),
          page: CalendarPage(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Offers',
            style: TextStyle(color: Colors.white),
          ),
          icon: Icon(Icons.local_offer, color: Colors.white),
          page: ClassBuilder.fromString('SettingsPage'),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Notification',
            style: TextStyle(color: Colors.white),
          ),
          icon: Icon(Icons.notifications, color: Colors.white),
          page: ClassBuilder.fromString('SettingsPage'),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Settings',
            style: TextStyle(color: Colors.white),
          ),
          icon: Icon(Icons.settings, color: Colors.white),
          page: ClassBuilder.fromString('SettingsPage'),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Share',
            style: TextStyle(color: Colors.white),
          ),
          icon: Icon(Icons.share, color: Colors.white),
          page: ClassBuilder.fromString('SettingsPage'),
        ),  KFDrawerItem.initWithPage(
          text: Text(
            'About us',
            style: TextStyle(color: Colors.white),
          ),
          icon: Icon(Icons.supervised_user_circle, color: Colors.white),
          page: ClassBuilder.fromString('SettingsPage'),
        ),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: onWillPop,
        child: KFDrawer(
//        borderRadius: 0.0,
//        shadowBorderRadius: 0.0,
//        menuPadding: EdgeInsets.all(0.0),
//        scrollable: true,
          controller: _drawerController,
          header: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(15)
              ),
              margin: EdgeInsets.only(left: 18,top: 15),
              height: 60,
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 60,
                    width: 60,
                    margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.blueAccent,

                    ),
                    child: Text("S",style: TextStyle(fontSize: 25,
                        color: Colors.white),),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("SIDHARTHA SEK.",textAlign:TextAlign.center,style: TextStyle(fontSize: 18,
                          color: Colors.white,fontWeight: FontWeight.bold)),
                      SizedBox(height: 5,),
                      Text("tina@gmail.com",style: TextStyle(fontSize: 18,
                          color: Colors.white)),
                    ],
                  )
                ],
              ),


            ),
          ),
          footer: KFDrawerItem(
            text: Text(
              'Log out',
              style: TextStyle(color: Colors.white),
            ),
            icon: Icon(
              Icons.input,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).push(CupertinoPageRoute(
                fullscreenDialog: true,
                builder: (BuildContext context) {
                  return AuthPage();
                },
              ));
            },
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color.fromRGBO(255, 255, 255, 1.0), Color.fromRGBO(44, 72, 171, 1.0)],
              tileMode: TileMode.repeated,
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> onWillPop() {
    _drawerController.close();
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(msg: "press back again to exit");
      return Future.value(false);
    }
    return Future.value(true);
  }

}