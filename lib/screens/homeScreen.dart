import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:graduation/lib/UI/home_screen.dart';
import 'package:graduation/screens/cases.dart';
import 'package:graduation/casescreen.dart';
import 'package:graduation/screens/chat/chatScreen.dart';
import 'package:graduation/screens/home.dart';
import 'package:graduation/shared/bottomNavbar.dart';

import 'profile/profilescreen.dart';

class homeSCreen extends StatefulWidget {
   homeSCreen({Key? key}) : super(key: key);
static String id='homeScreen';

  @override
  State<homeSCreen> createState() => _homeSCreenState();
}

class _homeSCreenState extends State<homeSCreen> {
  int currentindex=0;

  // final items=[
  //   Icon(Icons.home,size: 30,),
  //   Icon(Icons.run_circle,size: 30,),
  //   Icon(Icons.chat,size: 30,),
  //   Icon(Icons.grain_sharp,size: 30,),
  //   Icon(Icons.account_circle,size: 30,),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: GNav(
          rippleColor: Colors.grey, // tab button ripple color when pressed
          hoverColor: Colors.grey, // tab button hover color
          haptic: true,
          tabBorderRadius: 15,
          curve: Curves.easeIn,
          duration: Duration(milliseconds: 700),
          gap: 3,
          color: Colors.grey[800],
          activeColor: Colors.blue[700],
          iconSize: 24,
          tabBackgroundColor: Colors.purple.withOpacity(0.1),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          tabs: [
            GButton(icon: Icons.home,text: 'Home',),
            GButton(icon: Icons.run_circle,text: 'New Case'),
            GButton(icon: Icons.chat,text: 'Chat'),
            GButton(icon: Icons.grain_sharp,text: 'Cases'),
            GButton(icon: Icons.account_circle,text: 'Profile'),
          ],
          onTabChange: (SelectedIndex){
            setState(() {
              currentindex=SelectedIndex;
            });
          },
        ),
      ),
    //   CurvedNavigationBar(
    //     backgroundColor: Colors.blue,
    //     items: [
    //
    //       Icon(Icons.home,size: 30,),
    //       Icon(Icons.run_circle,size: 30,),
    //       Icon(Icons.chat,size: 30,),
    //       Icon(Icons.grain_sharp,size: 30,),
    //      Icon(Icons.account_circle,size: 35,),
    // //       IconButton(
    // //           icon:Icon(Icons.account_circle,size: 35,),
    // //         onPressed: (){
    // //           Text('Profile');
    // //         },
    // // ),
    //     ],
    //     index:currentindex,
    //       onTap: (SelectedIndex){
    //         setState(() {
    //           currentindex=SelectedIndex;
    //         });
    //      },
    //     height: 65,
    //     animationCurve: Curves.easeIn,
    //     animationDuration: Duration(milliseconds: 60),
    //
    //   ),
         //  type: BottomNavigationBarType.fixed,
          // items: [
          //   BottomNavigationBarItem(
          //       icon: GestureDetector(
          //         onTap:(){
          //           Navigator.pushNamed(context, homeSCreen.id);
          //         },
          //         child: Icon(
          //           Icons.home,
          //         ),
          //       ),
          //       label: 'Home'
          //   ),
          //   BottomNavigationBarItem(
          //       icon: GestureDetector(
          //         onTap:(){
          //           Navigator.pushNamed(context,caseScreen.id);
          //         },
          //         child: Icon(
          //             Icons.run_circle
          //         ),
          //       ),
          //       label: 'New Case'
          //   ),
          //   BottomNavigationBarItem(
          //       icon: GestureDetector(
          //         onTap: (){
          //           Navigator.pushNamed(context, chatSCreen.id);
          //         },
          //         child: Icon(
          //             Icons.chat
          //         ),
          //       ),
          //       label: 'Chat'
          //   ),
          //   BottomNavigationBarItem(
          //       icon: GestureDetector(
          //         onTap: (){},
          //         child: Icon(
          //             Icons.grain_sharp
          //         ),
          //       ),
          //       label: 'New case'
          //   ),
          //   BottomNavigationBarItem(
          //       icon: GestureDetector(
          //         onTap: (){},
          //         child: Icon(
          //             Icons.account_circle,
          //         ),
          //       ),
          //       label: 'Profile'
          //   ),
          // ]

      body: Container(
        child: getSelected(index:currentindex),
      ),
    );
  }
  Widget getSelected({required int index}){
    Widget widget;
    switch(currentindex){
      case 0:
        widget=defaulthome();
        break;
      case 1:
        widget=caseScreen();
        break;
      case 2:
        widget=HomeScreen();
        break;
      case 3:
        widget=casesSCreen();
        break;
      case 4:
        widget=profileScreen();
        break;
      default:
        widget = defaulthome();

    }
    return widget;
  }
}
