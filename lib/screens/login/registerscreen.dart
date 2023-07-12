import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graduation/StartScreen.dart';
import 'package:graduation/models/usermodel.dart';
import 'package:graduation/screens/homeScreen.dart';
import 'package:graduation/screens/register/loginscreen.dart';
import 'package:graduation/services/auth.dart';
import 'package:graduation/shared/custombutton.dart';
import 'package:graduation/shared/customtextfield.dart';

import '../../models/user_model.dart';

class RegisterScreen extends StatefulWidget {
    RegisterScreen({ this.namecontroller});
  final  String? namecontroller;
  // final Function? toggle;
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}
class _RegisterScreenState extends State<RegisterScreen> {

  GlobalKey<FormState> formkey=GlobalKey();
  String? email,password,confirmpassword,Name;
  //AuthService auth=AuthService();
  final  TextEditingController namecontroller=TextEditingController();
  final TextEditingController emailcontroller=TextEditingController();
  final TextEditingController passcontroller=TextEditingController();
  final TextEditingController passconfirmcontroller=TextEditingController();
@override
  void initState() {
    // TODO: implement initState
  //namecontroller.text=widget.namecontroller;

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
    ),
    body:
    Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30,),
              Form(
                key: formkey,
                child:
                Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text("Register",style: TextStyle(fontSize:22,fontWeight: FontWeight.bold),),
                  ),
                  customField(
                    validate: (data){
                      return data!.isEmpty || data!.length < 3 ? "Enter Username 3+ characters" : null;
                    },
                      label: "Name",
                      hinttext: "Enter Your Name",
                      icon: Icons.account_circle,
                      onchange: (data){
                      Name=data;
                      },
                    controller: namecontroller,
              ),
                  customField(
                    controller: emailcontroller,
                    validate: (data){
                      if(data==''){
                        return "Can't be empty";
                      }else {
                        return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(data!) ?
                        null : "Enter correct email";
                      }

                    },
                    onchange: (data){
                      email=data;
                    },
                    label: 'E-mail',
                    hinttext: 'Enter your e-mail address',
                    icon: Icons.email,
                  ),
                  custompassField(
                    controller: passcontroller,
                    validate: (data){
                      if(data==''){
                        return "Can't be empty";
                      }else if(data!.length<6){
                        return "password must be more than 6 characters";
                      }
                      password=data;
                    },
                    onchange: (data){
                      password=data;
                    },
                    label: 'Password',
                    hinttext: 'Enter your password',
                  ),
                  custompassField(
                    controller: passconfirmcontroller,
                      label: 'confirm password',
                      hinttext: 'confirm your password',
                      onchange: (data){
                        confirmpassword=data;
                      },
                      validate: (data){
                        if(data==''){
                          return "Can't be empty";
                        }else if(data!=password){
                          return 'Not match';
                        }
                      },
                  ),
                  SizedBox(height: 20,),
                  custombutton(
                      text: 'Register',
                    onTap: ()async{
                        if(formkey.currentState!.validate()){
                          setState(() {
                          });
                          try {
                            UserCredential user = await register();
                            Fluttertoast.showToast(msg: 'Account created successfully',fontSize: 18);
                            Navigator.pushNamed(context, StartScreen.id);
                          }
                          on FirebaseAuthException catch(ex){
                            if(ex.code=='weak-password'){
                              ScaffoldMessenger.of(context).
                              showSnackBar(SnackBar(
                                content: Text('weak password !!'),),);
                            }
                            else if(ex.code=='email-already-in-use'){
                              ScaffoldMessenger.of(context).
                              showSnackBar(SnackBar(
                                content: Text('email already exists !!'),),);
                            }
                          }
                          setState(() {

                          });
                        }

                    },

                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment. center,
                    children: [
                      Text('Already have an account?',style: TextStyle(fontSize:16),),
                      TextButton(
                        onPressed: (){
                          //widget.toggle;
                         Navigator.push(context, MaterialPageRoute(builder: (context)=> loginScreen()));
                      },
                      child: Text('Log In ',style: TextStyle(fontSize:18,color: Color(0xff407BFF)),),)
                    ],
                  ),
                  SizedBox(height: 20,),

                ],
                  ),
              ),


            ],
          ),
        ),
      )
  );
  }



  //post data to cloud firestore to use it in another screen
  posttofirestore()async{
    //call firestore
    FirebaseFirestore firestore=FirebaseFirestore.instance;
    User? user=FirebaseAuth.instance.currentUser;
    //call model
    UserModel usermodel=UserModel();
    usermodel.mail=user!.email;
    usermodel.Name=Name;
    await firestore.collection('users').doc().set(usermodel.toMap());
  }
  //firebase auth
  Future<UserCredential> register() async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
        email: emailcontroller.text,
        password: passcontroller.text,
    );
    posttofirestore();
    return user;
  }
  }

  class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h= size.height;
  final path = Path();
  path.lineTo(0, h);
  path.quadraticBezierTo(w*.1, h-100, w, h);
  path.lineTo(w, 0);
  path.close();
  return path;
  }

  @override
  bool shouldReclip(TriangleClipper oldClipper) => false;
  }
