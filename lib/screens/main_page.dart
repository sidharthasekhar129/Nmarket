import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:nmarket/screens/profile_page.dart';

import 'cart_screen.dart';

// ignore: must_be_immutable
class MainPage extends KFDrawerContent {
  MainPage({
    Key key,
  });

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex=0;
  final tabs=[

    Center(child: Text("Home2"),),
    Center(child: Text("Home3"),),
    MyAccountPage(),

  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: (_currentIndex==0) ? SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    child: Material(
                      shadowColor: Colors.transparent,
                      color: Colors.transparent,
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: IconButton(
                          icon: Icon(
                            Icons.menu,
                            color: Colors.black,
                          ),
                          onPressed: widget.onMenuPressed,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Home page'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ): tabs[_currentIndex-1],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index){
          setState( (){
            _currentIndex=index;
          }

          );
        },
       // type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black12,
        showUnselectedLabels: true,
        elevation: 1,
        selectedItemColor: Colors.green,
         //backgroundColor: Colors.blueAccent,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home,color: Colors.black87),
              title: Text("Home",style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,fontFamily: "Spectral",fontSize: 16),),
           ),
          BottomNavigationBarItem(
              icon: Icon(Icons.category,color: Colors.black87,),
              title: Text("Categories",style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,fontFamily: "Spectral",fontSize: 16),),
           ),
          BottomNavigationBarItem(
              icon: Icon(Icons.trending_up,color: Colors.black87,),
              title: Text("Trend",style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,fontFamily: "Spectral",fontSize: 16),),
           ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person,color: Colors.black87,),
              title: Text("Account",style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,fontFamily: "Spectral",fontSize: 16),),
           ),
        ],
      ),
    );
  }

}