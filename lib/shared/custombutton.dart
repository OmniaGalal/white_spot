
import 'package:flutter/material.dart';
class custombutton extends StatelessWidget {
  custombutton({ this.onTap ,required this.text,@required this.icon,@required this.color}) ;
  VoidCallback? onTap;
  String text;
  IconData? icon;
  Color? color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: GestureDetector(
        onTap: onTap ,
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xff407BFF),
            borderRadius: BorderRadius.circular(12),
          ),
          height: 50,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Icon(icon,color: color),
                  //SizedBox(width: 15,),
                  Text(text,style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}