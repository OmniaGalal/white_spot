
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation/screens/homeScreen.dart';
import 'package:graduation/shared/custombutton.dart';
class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);
static String id='StartScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child:
          Center(
            child: Column(
              children: [
                SizedBox(height: 50,),
                Text('Welcome to our ',
                  style:
                GoogleFonts.inter(textStyle: TextStyle(fontSize: 28)),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('abcd ',
                      style:
                      GoogleFonts.pacifico(textStyle: TextStyle(fontSize: 28,color: Color(0xff407BFF))),),
                    Text('app ',
                      style:
                      GoogleFonts.inter(textStyle: TextStyle(fontSize: 28)),)
                  ],
                ),
                SizedBox(height: 70,),
                Image.asset('assets/images/welcome.png'),
                SizedBox(height: 150,),
                custombutton(text: "start",
                  onTap: (){
                  Navigator.pushNamed(context, homeSCreen.id);
                  },)
              ],
            ),
          ),
      ),
    );
  }
}
