import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:graduation/casescreen.dart';
import 'package:graduation/lib/UI/auth/login_screen.dart';
import 'package:graduation/screens/homeScreen.dart';
import 'package:graduation/screens/login/registerscreen.dart';
import 'package:graduation/screens/register/loginscreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    });
  }

  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/splash.png',
            width: 300,
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: <Widget>[
          //     const SizedBox( height: 150.0),
          //     const SizedBox( height: 150.0),
          //     DefaultTextStyle(
          //       style: const TextStyle(
          //         fontSize: 40.0,
          //         fontFamily: 'Horizon',
          //         color: Colors.black,
          //       ),
          //       child: AnimatedTextKit(
          //         animatedTexts: [
          //           RotateAnimatedText('DERMA'),
          //           RotateAnimatedText('APP'),
          //
          //         ],
          //         onTap: () {
          //           print("Tap Event");
          //         },
          //       ),
          //     ),
          //   ],
          // ),
          // SizedBox(
          //   width: 250.0,
          //   child: TextLiquidFill(
          //     text: 'شفاء',
          //     waveColor: Colors.blueAccent,
          //     boxBackgroundColor: Colors.white,
          //     textStyle: TextStyle(
          //       fontSize: 30.0,
          //       fontWeight: FontWeight.bold,
          //     ),
          //     boxHeight: 200.0,
          //   ),
          // ),
          DefaultTextStyle(
            style: const TextStyle(
              color: Colors.cyan,
              fontSize: 40.0,
            ),
            child: AnimatedTextKit(
              animatedTexts: [
                WavyAnimatedText('White Spot'),
                // WavyAnimatedText('Look at the waves'),
              ],
              isRepeatingAnimation: false,
              onTap: () {
                print("Tap Event");
              },
            ),
          ),
        ],
      ),
    );
    // return Container(
    //   decoration: BoxDecoration(
    //     color: Colors.white,
    //   ),
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         Center(child: Image.asset('assets/images/splash.png',width: 200,height: 300,)
    //         ),
    //         // AnimatedTextKit(
    //         //     animatedTexts: [
    //         //       TypewriterAnimatedText(
    //         //         'Derma App',
    //         //         textStyle: const TextStyle(
    //         //           fontSize: 32.0,
    //         //           fontWeight: FontWeight.bold,
    //         //           color: Colors.black,
    //         //         ),
    //         //         speed: const Duration(milliseconds: 500),
    //         //       ),
    //         //     ])
    //         // AnimatedTextKit(
    //         //   animatedTexts: [
    //         //     FadeAnimatedText(
    //         //       'Welcome to',
    //         //       textStyle: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
    //         //     ),
    //         //     ScaleAnimatedText(
    //         //       'Derma App',
    //         //       textStyle: TextStyle(fontSize: 70.0, fontFamily: 'Canterbury'),
    //         //     ),
    //         //   ],
    //         // ),
    //
    //       ],
    //     ),
    // );
  }
}
