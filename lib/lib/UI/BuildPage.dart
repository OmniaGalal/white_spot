import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
class BuildPage extends StatelessWidget {
  BuildPage(
      {
        this.text1,
        this.text2,
        this.image,

      });
  final controller = PageController();
  String? text1;
  String? text2;
  String? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:
      Column(
        children: [
          SizedBox(
            height: 125,
          ),
          Center(
              child: Stack(
            children: [
              Image.asset(
                '$image',
                width: 196,
                height: 326,
              ),

              //Image.asset('$image2',width: 196,height: 326,alignment: Alignment.topLeft,),
            ],
          )),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$text1 ',
                style:GoogleFonts.acme(textStyle:  TextStyle(
                  fontSize: 26,
                ),)
              ),
              SizedBox(height: 10,),
              Text(
                '$text2 ',
                  style:GoogleFonts.acme(textStyle:  TextStyle(
                    fontSize: 26,
                  ),)
              ),

            ],
          ),

        ],
      ),
    );
  }
}
