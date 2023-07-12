// import 'package:flutter/material.dart';
// import 'package:graduation/screens/casescreen.dart';
// import 'package:graduation/screens/homeScreen.dart';
// class bottomnavbar extends StatefulWidget {
//   @override
//   State<bottomnavbar> createState() => _bottomnavbarState();
// }
// class _bottomnavbarState extends State<bottomnavbar> {
//   int currentindex=0;
//  VoidCallback? onTap;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar:
//       BottomNavigationBar(
//         currentIndex:currentindex,
//           onTap: (int){
//           setState(() {
//             currentindex=int;
//           });
//           },
//           type: BottomNavigationBarType.fixed,
//           items: [
//             BottomNavigationBarItem(
//             icon: GestureDetector(
//               onTap:(){
//                 Navigator.pushNamed(context, homeSCreen.id);
//               },
//               child: Icon(
//                   Icons.home,
//               ),
//             ),
//             label: 'Home'
//         ),
//             BottomNavigationBarItem(
//             icon: GestureDetector(
//               onTap:(){
//                Navigator.pushNamed(context, caseScreen.id);
//             },
//               child: Icon(
//                   Icons.run_circle
//               ),
//             ),
//             label: 'New Case'
//         ),
//             BottomNavigationBarItem(
//             icon: GestureDetector(
//               onTap: onTap,
//               child: Icon(
//                   Icons.chat
//               ),
//             ),
//             label: 'Chat'
//         ),
//             BottomNavigationBarItem(
//                 icon: GestureDetector(
//                   onTap: onTap,
//                   child: Icon(
//                       Icons.chat
//                   ),
//                 ),
//                 label: 'Chat'
//             ),
//             BottomNavigationBarItem(
//                 icon: GestureDetector(
//                   onTap: onTap,
//                   child: Icon(
//                       Icons.chat
//                   ),
//                 ),
//                 label: 'Chat'
//             ),
//       ]),
//     );
//   }
// }
