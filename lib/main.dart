// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:graduation/screens/cases.dart';
// import 'package:graduation/casescreen.dart';
// import 'package:graduation/screens/chat/chatScreen.dart';
// import 'package:graduation/screens/home.dart';
// import 'package:graduation/screens/homeScreen.dart';
// import 'package:graduation/screens/photoScreen.dart';
// import 'package:graduation/screens/profile/profilescreen.dart';
// import 'package:graduation/screens/splashscreen.dart';
// import 'StartScreen.dart';
// import 'firebase_options.dart';
// import 'screens/login/registerscreen.dart';
// void main()async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//       options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp( MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   // const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       routes: {
//         'caseScreen':(context)=>caseScreen(),
//         'homeScreen':(context)=>homeSCreen(),
//         'chatscreen':(context)=>chatpage(),
//         // 'photoScreen':(context)=>photoScreen(),
//         'casesScreen':(context)=>casesSCreen(),
//         'profileScreen':(context)=>profileScreen(),
//         'StartScreen':(context)=>StartScreen(),
//         'defaultScreen':(context)=>defaulthome(),
//       },
//       //initialRoute: 'homeScreen',
//       home:SplashScreen(),
//     );
//   }
// }


import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/firebase_options.dart';
import 'package:graduation/lib/Controller/layout_cubit.dart';
import 'package:graduation/lib/Core/constants.dart';
import 'package:graduation/screens/cases.dart';
import 'package:graduation/screens/chat/chatScreen.dart';
import 'package:graduation/screens/home.dart';
import 'package:graduation/screens/homeScreen.dart';
import 'package:graduation/screens/profile/profilescreen.dart';
import 'package:graduation/screens/splashscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'StartScreen.dart';
import 'casescreen.dart';
import 'lib/UI/auth/auth_cubit.dart';
import 'lib/UI/auth/register_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPref = await SharedPreferences.getInstance();
  Constants.userID = sharedPref.getString('userID');
  debugPrint("User ID is : ${Constants.userID} ....");
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:
      [
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => LayoutCubit()),
      ],
      child: MaterialApp(

          debugShowCheckedModeBanner: false,
          routes: {
        'caseScreen':(context)=>caseScreen(),
        'homeScreen':(context)=>homeSCreen(),
        'chatscreen':(context)=>chatpage(),
        // 'photoScreen':(context)=>photoScreen(),
        'casesScreen':(context)=>casesSCreen(),
        'profileScreen':(context)=>profileScreen(),
        'StartScreen':(context)=>StartScreen(),
        'defaultScreen':(context)=>defaulthome(),
      },
      //initialRoute: 'homeScreen',
          home: homeSCreen(),
      ),
    );
  }
}
