
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/lib/UI/auth/register_screen.dart';
import '../../../screens/homeScreen.dart';
import '../../../shared/custombutton.dart';
import '../../../shared/customtextfield.dart';
import '../home_screen.dart';
import 'auth_cubit.dart';
import 'auth_states.dart';

class LoginScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthCubit,AuthStates>(
        listener: (context,state){
          if( state is LoginSuccessState )
            {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => homeSCreen()));
            }
          if( state is FailedToLoginState )
            {

            }
        },
        builder: (context,state){
          return 
            SafeArea(
              child: SingleChildScrollView(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
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
                      height: 300,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        customField(
                          controller: emailController,

                          validate: (data){
                            if(data==''){
                              return 'Enter your e-mail';
                            }
                          },
                          label: 'E-mail',
                          hinttext: 'Enter your mail',
                          icon: Icons.email,
                        ),
                        SizedBox(height: 15,),
                        custompassField(
                          controller: passwordController,
                          validate: (data){
                            if(data==''){
                              return "Can't be empty";
                            }
                          },
                          label: 'Password',
                          hinttext: 'Enter your password',

                        ),
                        SizedBox(height: 15,),
                        custombutton(
                            text: 'Log In',
                            onTap: () {
                              if( emailController.text.isNotEmpty && passwordController.text.isNotEmpty )
                              {
                                BlocProvider.of<AuthCubit>(context).login(email: emailController.text, password: passwordController.text);
                              }
                              else
                              {
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor:Colors.red,content: Text("Please, fill The Textformfield and try again later")));
                              }
                            }

                            ),
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

                          ],
                        ),
                      ],
                    ),
                  ),

                ],
          ),
              ),
            );
        },
      )
    );
  }
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
