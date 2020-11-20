import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentpage = 0;



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),

          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentpage,
        selectedItemColor: Colors.blueAccent,

        type: BottomNavigationBarType.fixed,
         onTap: (index){
          setState(() {
            currentpage=index;
          });
        },
        items: [
          BottomNavigationBarItem(
             icon: Icon(Icons.home,color: Colors.black87),
            label: "Home",

          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.category,color: Colors.black87),
              label: "Categories"
          ),
          BottomNavigationBarItem(
                icon: Icon(Icons.assessment,color: Colors.black87),
              label: "Trending"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person,color: Colors.black87),
              label: "profile"
          ),
        ],
      ),
     );
  }
}
