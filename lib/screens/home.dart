import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:graduation/models/usermodel.dart';

class defaulthome extends StatefulWidget {
   defaulthome({Key? key}) : super(key: key);
  static String id='defaultScreen';

  @override
  State<defaulthome> createState() => _defaulthomeState();
}

class _defaulthomeState extends State<defaulthome> {
  User? user =FirebaseAuth.instance.currentUser;
//   UserModel? loggedin=UserModel();
//
//    Future getdata() async {
//      // TODO: implement initState
//      //super.initState();
//      await FirebaseFirestore.instance.collection('users')
//          .doc(user!.uid).get().then((value) {
//        this.loggedin=UserModel.fromJson(value.data());
//        print(loggedin!.Name);
//        setState(() {
//
//        });
//      });
//    }
// @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     getdata();
//   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   backgroundColor: Colors.blue,
      //   elevation: 0,
      // ),
     // body:
      // Center(child:Text("${loggedin!.Name}"))
      //drawer(),
              // Center(
              //
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Text('omniaaaaa',style: TextStyle(color: Colors.cyan),)
              //     ],
              //   ),
              // ),

    );
  }
}
