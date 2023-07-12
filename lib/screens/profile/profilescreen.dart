
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:graduation/lib/UI/auth/login_screen.dart';
import 'package:graduation/models/usermodel.dart';
import 'package:graduation/screens/homeScreen.dart';
import 'package:graduation/screens/login/registerscreen.dart';
import 'package:graduation/screens/register/loginscreen.dart';

class profileScreen extends StatefulWidget {
  profileScreen({Key? key}) : super(key: key);
  static String id = 'profileScreen';


  @override
  State<profileScreen> createState() => _profileScreenState();
}

class _profileScreenState extends State<profileScreen> {
  //int currentindex=2;
  //UserModel name=UserModel();
  RegisterScreen name = RegisterScreen();
  String? username;
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar:
      // BottomNavigationBar(
      //     currentIndex:currentindex,
      //     onTap: (int){
      //       setState(() {
      //         currentindex=int;
      //       });
      //     },
      //     type: BottomNavigationBarType.fixed,
      //     items: [
      //       BottomNavigationBarItem(
      //           icon: GestureDetector(
      //             onTap:(){
      //               Navigator.pushNamed(context, homeSCreen.id);
      //             },
      //             child: Icon(
      //               Icons.home,
      //             ),
      //           ),
      //           label: 'Home'
      //       ),
      //       BottomNavigationBarItem(
      //           icon: GestureDetector(
      //             onTap:(){
      //               Navigator.pushNamed(context,caseScreen.id);
      //             },
      //             child: Icon(
      //                 Icons.run_circle
      //             ),
      //           ),
      //           label: 'New Case'
      //       ),
      //       BottomNavigationBarItem(
      //           icon: GestureDetector(
      //             onTap: (){
      //               Navigator.pushNamed(context, chatSCreen.id);
      //               // Navigator.pop(context);
      //             },
      //             child: Icon(
      //                 Icons.chat
      //             ),
      //           ),
      //           label: 'Chat'
      //       ),
      //       BottomNavigationBarItem(
      //           icon: GestureDetector(
      //             onTap: (){},
      //             child: Icon(
      //                 Icons.grain_sharp
      //             ),
      //           ),
      //           label: 'New case'
      //       ),
      //       BottomNavigationBarItem(
      //           icon: GestureDetector(
      //             onTap: (){},
      //             child: Icon(
      //               Icons.account_circle,
      //             ),
      //           ),
      //           label: 'Profile'
      //       ),
      //     ]),
      body: Center(
        child: Stack(
          children: [
            user == null ? CircularProgressIndicator() :
            Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 300,
                  color: Color(0xff407BFF),
                ),

                //Icon(Icons.account_circle,size: 100,),
                SizedBox(
                  height: 100,
                ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 12.0),
                //   child: Container(
                //       height: 50,
                //       width: double.infinity,
                //       alignment: Alignment.center,
                //       decoration: BoxDecoration(
                //         color: Colors.grey[100],
                //         borderRadius: BorderRadius.circular(15),
                //       ),
                //       child: Text(
                //           '${user!.uid}',
                //           style: TextStyle(
                //             fontSize: 20,
                //           ))),
                // ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Container(
                      height: 50,
                      width: double.infinity,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                          '${user!.email}',
                          style: TextStyle(
                            fontSize: 20,
                          ))),
                ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 12.0),
                //   child: Container(
                //       height: 50,
                //       width: double.infinity,
                //       alignment: Alignment.center,
                //       decoration: BoxDecoration(
                //         color: Colors.grey[100],
                //         borderRadius: BorderRadius.circular(15),
                //       ),
                //       child: FutureBuilder<Object>(
                //         future: FirebaseFirestore.instance.collection('users')
                //             .doc(FirebaseAuth.instance.currentUser!.uid)
                //             .get(),
                //         builder: (context, snapshot) {
                //           return Text(
                //               'test',
                //               style: TextStyle(
                //                 fontSize: 20,
                //               ));
                //         }
                //       )),
                // ),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.logout),
                    SizedBox(width: 8,),
                    TextButton(
                        onPressed: () {
                          FirebaseAuth.instance.signOut();
                          Navigator.push(context, MaterialPageRoute(builder: (
                              context) => LoginScreen(),));
                        },
                        child: Text(
                          'Log out', style: TextStyle(fontSize: 18),)),
                  ],
                )
              ],
            ),
            Positioned(
                bottom: 360,
                left: 130,
                child: Image.asset(
                  'assets/images/splash.png',
                  height: 130,
                )),
          ],
        ),
      ),
    );
  }

  //@override
// void initState() {
//   // TODO: implement initState
//   super.initState();
//   getdata();
// }
// Future getdata() async{
//      DocumentSnapshot ds=  await  FirebaseFirestore.instance.collection('users')
//       .doc(FirebaseAuth.instance.currentUser!.uid).get();
//     print("${ds['Name']}");
//   }
 }

