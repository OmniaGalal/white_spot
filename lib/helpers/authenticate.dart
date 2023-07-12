import 'package:flutter/material.dart';
import 'package:graduation/screens/login/registerscreen.dart';
import 'package:graduation/screens/register/loginscreen.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  static String id="authenticate";
  bool showregister=true;
  void toogle(){
    setState(() {
      showregister =!showregister;
    });
  }
  @override
  Widget build(BuildContext context) {
    if(showregister){
      return RegisterScreen();
    }else{
      return loginScreen();
    }
  }
}
