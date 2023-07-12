import 'package:flutter/material.dart';
import 'package:graduation/screens/homeScreen.dart';


class casesSCreen extends StatefulWidget {
  casesSCreen({Key? key}) : super(key: key);
  static String id='casesScreen';

  @override
  State<casesSCreen> createState() => _casesSCreenState();
}

class _casesSCreenState extends State<casesSCreen> {

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

    );
  }
}
