import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graduation/StartScreen.dart';
import 'package:graduation/screens/homeScreen.dart';
import 'package:graduation/screens/login/registerscreen.dart';
import 'package:graduation/shared/custombutton.dart';
import 'package:graduation/shared/customtextfield.dart';

class loginScreen extends StatefulWidget {
   // loginScreen({});
  static String id = 'registerScreen';
  // Function? toggle;

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {

  String? email;
  String? password;
  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff407BFF),
        elevation: 0,
      ),
        body: Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipPath(
              clipper: TriangleClipper(),
              child:  Container(
               padding: EdgeInsets.fromLTRB(20, 0, 20, 20), //extra 10 for top padding because triangle's height = 10
                decoration: BoxDecoration(
                  color: Color(0xff407BFF),
                  // borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                    child: Image.asset(
                  'assets/images/login.png',
                  width: 200,
                )),
                height: 250,
              ),
            ),
            Form(
              key: formkey,
              child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              const SizedBox(
                    height: 20,
                  ),
               const Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      "Log In",
                      style: TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                  customField(
                    controller: emailcontroller,

                    validate: (data){
                      if(data==''){
                        return 'Enter your e-mail';
                      }
                    },
                    label: 'E-mail',
                    hinttext: 'Enter your mail',
                    icon: Icons.email,
                  ),
                  custompassField(
                    controller: passwordcontroller,
                    validate: (data){
                      if(data==''){
                        return "Can't be empty";
                      }
                    },
                    label: 'Password',
                    hinttext: 'Enter your password',

                  ),
                const  SizedBox(
                    height: 20,
                  ),
                  custombutton(
                      text: 'Log In',
                      onTap: () async {
                        if (formkey.currentState!.validate()) {}
                        try{
                      await  FirebaseAuth.instance.
                        signInWithEmailAndPassword(email: emailcontroller.text, password: passwordcontroller.text);
                          Navigator.pushNamed(context, StartScreen.id);
                             Fluttertoast.showToast(msg: 'Logged in successfully',fontSize: 18,backgroundColor: Colors.white,textColor: Colors.black);}
                        catch(e){
                          Fluttertoast.showToast(msg: 'Not found check email and password',fontSize: 18,backgroundColor: Colors.white,textColor: Colors.black);}

                          // on FirebaseAuthException catch (e) {
                          //   if (user != null) {
                          //     setState(() {
                          //       success = 2;
                          //       useremail = user!.user!.email!;
                          //       Navigator.pushNamed(context, homeSCreen.id);
                          //
                          //     });
                          //   } else {
                          //     setState(() {
                          //       success = 3;
                          //     });
                          //   }
                          // }

// on FirebaseAuthException catch(ex){
//   if(user=='weak-password'){
//     ScaffoldMessenger.of(context).
//     showSnackBar(SnackBar(
//       content: Text('weak password !!'),),);
//   }
//   else if(ex.code=='email-already-in-use'){
//     ScaffoldMessenger.of(context).
//     showSnackBar(SnackBar(
//       content: Text('email already exists !!'),),);
//   }
// }
                        // try {
                        //   UserCredential user = await FirebaseAuth.instance
                        //       .createUserWithEmailAndPassword(
                        //           email: email!, password: password!
                        //   );
                        // } on FirebaseAuthException catch (ex) {
                        //   if (ex.code == 'weak-password') {
                        //     ScaffoldMessenger.of(context).showSnackBar(
                        //       SnackBar(
                        //         content: Text('weak password !!'),
                        //       ),
                        //     );
                        //   }
                        // }
                      }),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment. center,
                    children: [
                      Text("don't have an account?",style: TextStyle(fontSize:16),),
                      TextButton(
                        onPressed: (){
                         // widget.toggle;
                           Navigator.push(context, MaterialPageRoute(builder: (context)=> RegisterScreen()));
                        },
                        child: Text('Register ',style: TextStyle(fontSize:18,color: Color(0xff407BFF)),),),
                      SizedBox(width: 10,),
                      Center(
                        child: Text(
                            success==1 ? '' : success==2 ? 'yess': 'fffff',
                        ),
                      ),

                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
  TextEditingController emailcontroller=TextEditingController();
  TextEditingController passwordcontroller=TextEditingController();

  int success=1;
  String useremail='';

  // void login()async{
  // }
}

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;
    final path = Path();
    path.lineTo(0, h);
    path.quadraticBezierTo(w * .1, h - 100, w, h);
    path.lineTo(w, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(TriangleClipper oldClipper) => false;
}
