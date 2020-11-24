import 'package:flutter/material.dart';

import 'auth/loginPage.dart';
import 'cart_screen.dart';

class MyAccountPage extends StatelessWidget{

  // String username = "";
  //
  // MyAccountPage({Key key, this.username}) : super(key: key);
  //
  // StorageReference storageReference = FirebaseStorage.instance.ref();
  // ProgressDialog pr;
  //
  //
  //
  // Future getImage(ImgSource source,BuildContext context) async {
  //   var image = await ImagePickerGC.pickImage(context: context, source: source,
  //     cameraIcon: Icon(Icons.camera, color: Colors.red,
  //     ), //cameraIcon and galleryIcon can change. If no icon provided default icon will be present
  //   );
  //   try {
  //     //CreateRefernce to path.
  //     StorageReference ref = storageReference.child("userProfilePic/");
  //
  //     //StorageUpload task is used to put the data you want in storage
  //     //Make sure to get the image first before calling this method otherwise _image will be null.
  //     await pr.show();
  //     StorageUploadTask storageUploadTask = ref.child(username).putFile(image);
  //
  //     if (storageUploadTask.isSuccessful || storageUploadTask.isComplete) {
  //       final String url = await ref.getDownloadURL();
  //       //  print("The download URL is " + url);
  //     } else if (storageUploadTask.isInProgress) {
  //       storageUploadTask.events.listen((event) {
  //         double percentage = 100 * (event.snapshot.bytesTransferred.toDouble()
  //             / event.snapshot.totalByteCount.toDouble());
  //
  //         //  print("THe percentage " + percentage.toString());
  //         pr = ProgressDialog(context, type: ProgressDialogType.Download,
  //             isDismissible: false,
  //             showLogs: true);
  //       });
  //
  //       StorageTaskSnapshot storageTaskSnapshot = await storageUploadTask
  //           .onComplete;
  //
  //       var downloadUrl1 = await storageTaskSnapshot.ref.getDownloadURL();
  //       Firestore.instance.collection(username)
  //           .document("PersonalInfo")
  //           .updateData({
  //         "profilePic": downloadUrl1,
  //
  //       });
  //       //Here you can get the download URL when the task has been completed.
  //       // print("Download URL " + downloadUrl1.toString());
  //       await pr.hide();
  //     } else {
  //       await pr.hide();
  //
  //       //Catch any cases here that might come up like canceled, interrupted
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // TODO: implement buildj
    String pic;
    AssetImage assetImage = AssetImage("images/logo1.png");
    Image image = Image(
      image: assetImage,
    );
    Widget _backButton() {
      return InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
                child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
              ),
              Text('Back',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
            ],
          ),
        ),
      );
    }
    Widget _logOutButton() {
      return InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child:  Container(
            padding: EdgeInsets.only(left: 0, top: 10, bottom: 10,right: 10),
            child: Icon(Icons.power_settings_new, color: Colors.black),
          ),
        ),
      );
    }
    // pr = new ProgressDialog(context);
    // pr.style(
    //     message: 'Uploading Image...',
    //     borderRadius: 10.0,
    //     backgroundColor: Colors.white,
    //     progressWidget: CircularProgressIndicator(),
    //     elevation: 10.0,
    //     insetAnimCurve: Curves.easeInOut,
    //     progressTextStyle: TextStyle(
    //         color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
    //     messageTextStyle: TextStyle(
    //         color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.w600)
    // );
    return Scaffold(

      body: Container(
        height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: SingleChildScrollView(
            child:  Column(
              children: <Widget>[
                // maincard2(username),
                Stack(
                  // alignment: Alignment.center,
                  children: <Widget>[

                    Container(

                      //margin: EdgeInsets.only(top: 80),
                      height: 240,
                      width: MediaQuery.of(context).size.width,
                    ),
                    Positioned(
                      top: 120,
                      left: MediaQuery.of(context).size.width*0.5-50,
                      child:   Container(
                        //margin: EdgeInsets.only(top: 80),
                        height: 100,
                        width: 100,
                        child: ClipOval(
                             child: Image(image: AssetImage("assets/logo1.JPG"),)),
                        // child: GestureDetector(
                        //   onTap: (){
                        //     getImage(ImgSource.Both,context);
                        //   },
                        //   child: StreamBuilder(
                        //       stream: Firestore.instance.collection(username).document("PersonalInfo").snapshots(),
                        //       builder: (context, snapshot) {
                        //         if (!snapshot.hasData) {
                        //           return new Text("Loading");
                        //         }
                        //         var userDocument = snapshot.data;
                        //         pic = userDocument["profilePic"];
                        //         if(pic==""){
                        //           return Container(
                        //
                        //             child: image,
                        //           );
                        //         }
                        //         else{
                        //           return CircleImageInkWell(
                        //             size: 100,
                        //             image: NetworkImage(pic),
                        //           );
                        //         }
                        //
                        //       }
                        //   ),
                        // ),
                      ),
                    ),


                    Positioned(top: 40, left: 0, child: _backButton()),
                    Positioned(top: 40, right: 0, child: _logOutButton()),

                  ],
                ),
                Container(
                  child: Text("SIDHARTHA SEKHAR",style: TextStyle(
                    fontSize: 18,
                    fontFamily: "Spectral",
                    color: Colors.black,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                  )),
                ),
                GestureDetector(
                  onTap: (){
                  //  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Profileinfo(username: username,)));
                  },
                  child: Personalinfo(),
                ),

                GestureDetector(
                  onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyCart()));
                  },
                  child: Cart(),
                ),

                GestureDetector(
                  onTap: (){
                    //  Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyOrdersPage(username: username,)));
                  },
                  child: Orders(),
                ),
                GestureDetector(
                  onTap: (){
                   // Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddressPage(username: username,)));
                  },
                  child: Address(),
                ),

                GestureDetector(
                  onTap: (){
                   // Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyPointsPage(username: username,)));
                  },
                  child: Points(),
                ),




              ],
            ),
          )
      ),
    );
  }

}



class Personalinfo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(

      decoration: BoxDecoration(
        //color: Color(0xFF394FC2),
          color: Colors.black12,
          borderRadius: new BorderRadius.all(Radius.circular(12))
      ),
      height: 35,
      width: MediaQuery.of(context).size.width-120,
      margin: EdgeInsets.only(left: 10,right: 10,top: 20, ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon1(),
         Expanded(child: Text1()),

          nexticon(),
        ],
      ),
    );
  }
}
class Icon1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 25,
      child: Icon(Icons.person,color: Colors.teal,),
    );
  }
}
class Text1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 150,
      margin: EdgeInsets.only(left: 7),
      child: Text("Profile info.",textDirection: TextDirection.ltr,style: TextStyle(
        fontSize: 18,
        fontFamily: "Spectral",

        color: Colors.black,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w500,
      ),),
    );
  }
}

class nexticon extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        width: 25,
        child: Icon(Icons.navigate_next,color: Colors.teal,)
    );
  }
}
class Cart extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        //color: Color(0xFF394FC2),
          color: Colors.black12,
          borderRadius: new BorderRadius.all(Radius.circular(12))

      ),
      height: 35,
      width: MediaQuery.of(context).size.width-120,
      margin: EdgeInsets.only(left: 10,right: 10,top: 15, ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Iconx(),
          Expanded(
            child:  Textx(),
          ),
          nexticon(),
        ],
      ),
    );
  }
}
class Iconx extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 25,
      padding: EdgeInsets.all(2),
      child: Icon(Icons.shopping_cart,color: Colors.teal,),
    );
  }
}
class Textx extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 150,
      margin: EdgeInsets.only(left: 7),
      child: Text("My Cart",textDirection: TextDirection.ltr,style: TextStyle(
        fontSize: 18,
        fontFamily: "Spectral",
        color: Colors.black,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
      ),),
    );
  }
}

class Orders extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        //color: Color(0xFF394FC2),
          color: Colors.black12,
          borderRadius: new BorderRadius.all(Radius.circular(12))

      ),
      height: 35,
      width: MediaQuery.of(context).size.width-120,
      margin: EdgeInsets.only(left: 10,right: 10,top: 15, ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon2(),
          Expanded(
            child:  Text2(),
          ),
          nexticon(),
        ],
      ),
    );
  }
}
class Icon2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 25,
      child: Icon(Icons.featured_play_list,color: Colors.teal,),
    );
  }
}
class Text2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 150,
      margin: EdgeInsets.only(left: 7),
      child: Text("My Orders",textDirection: TextDirection.ltr,style: TextStyle(
        fontSize: 18,
        fontFamily: "Spectral",
        color: Colors.black,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w500,
       ),),
    );
  }
}

class Address extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        //color: Color(0xFF394FC2),
          color: Colors.black12,
          borderRadius: new BorderRadius.all(Radius.circular(12))

      ),
      height: 35,
      width: MediaQuery.of(context).size.width-120,
      margin: EdgeInsets.only(left: 10,right: 10,top: 15, ),
      child: Row(

        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon3(),
          Expanded(
            child:  Text3(),
          ),
          nexticon(),
        ],
      ),
    );

  }
}
class Icon3 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 25,
      child: Icon(Icons.location_on,color: Colors.teal,),
    );
  }
}
class Text3 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 150,
      margin: EdgeInsets.only(left: 7),
      child: Text("My Address",textDirection: TextDirection.ltr,style: TextStyle(
        fontSize: 18,
        fontFamily: "Spectral",
        color: Colors.black,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w500,
       ),
      ),
    );
  }
}

class Points extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        //color: Color(0xFF394FC2),
          color: Colors.black12,
          borderRadius: new BorderRadius.all(Radius.circular(12))

      ),
      height: 35,
      width: MediaQuery.of(context).size.width-120,
      margin: EdgeInsets.only(left: 10,right: 10,top: 15, ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon4(),
          Expanded(
            child:  Text4(),
          ),
          nexticon(),
        ],
      ),
    );
  }
}
class Icon4 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 25,
      child: Icon(Icons.attach_money,color: Colors.teal,),
    );
  }
}
class Text4 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 150,
      margin: EdgeInsets.only(left: 7),
      child: Text("My Points",textDirection: TextDirection.ltr,style: TextStyle(
        fontSize: 18,
        fontFamily: "Spectral",
        color: Colors.black,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w500,
       ),
      ),
    );
  }
}





class LogoutButton extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        //color: Color(0xFF394FC2),
          color: Colors.teal,
          borderRadius: new BorderRadius.all(Radius.circular(8))

      ),
      width: 300,
      height: 45.0,
      margin: EdgeInsets.only(left: 15.0,top: 20.0,right: 15,bottom: 20),
      child: RaisedButton(
        onPressed: () {

          showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context){
                return AlertDialog(
                  title: Text("Logout!",style: TextStyle(color: Colors.white,fontSize: 20),),
                  content: Text("Are you fucking sure?",style: TextStyle(color: Colors.white,fontSize: 17),),
                  actions: <Widget>[
                    FlatButton( onPressed: (){
                      Navigator.pop(context);
                    },
                      child: Text("No",style: TextStyle(color: Colors.white,fontSize: 17),),),
                    FlatButton(onPressed: () async {
                      Navigator.pop(context);
                      Navigator.of(context).pop(context);
                      //SharedPreferences prefs = await SharedPreferences.getInstance();
                     // prefs.remove('email');
                    //  FirebaseAuth.instance.signOut();
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );

                    },child: Text("Yes",style: TextStyle(color: Colors.white,fontSize: 17),),),
                  ],
                  elevation: 24.0,
                  backgroundColor: Colors.blue,
                );
              }
          );
        },
        child: Text("LOG OUT"),
        color: Colors.teal,
        textColor: Color(0xFFffffff),

      ),

    );
  }

}