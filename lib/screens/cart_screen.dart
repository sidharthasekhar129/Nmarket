

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


// MyApp is a StatefulWidget. This allows updating the state of the
// widget when an item is removed.
class MyCart extends StatefulWidget {
  MyCart({Key key}) : super(key: key);

  @override
  MyCartState createState() =>   MyCartState();
}

class MyCartState extends State<MyCart> {
  final items = List<String>.generate(7, (i) => "Item ${i + 1}");

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
       theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(

        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {

             return Dismissible(
              // Each Dismissible must contain a Key. Keys allow Flutter to
              // uniquely identify widgets.
              key: Key(items[index]),
              direction: DismissDirection.endToStart,
              // Provide a function that tells the app
              // what to do after an item has been swiped away.
              onDismissed: (direction) {
                // Remove the item from the data source.
                setState(() {
                  items.removeAt(index);
                });

                // Then show a snackbar.
                Scaffold.of(context).showSnackBar(SnackBar(content: Text( items[index]+"dismissed")));
              },
              // Show a red background as the item is swiped away.
              background:  Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Color(0xFFFFE6E6),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    Spacer(),
                    Image(image: AssetImage("assets/logo.png")),
                  ],
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black45,

                ),
                width: MediaQuery.of(context).size.width-16,
                height: 100,
                margin: EdgeInsets.all(8),
                child: Text((items[index]),textAlign: TextAlign.center,),
              ),
            );
          },
        ),
      ),
    );
  }
}