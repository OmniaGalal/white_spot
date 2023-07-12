import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/lib/UI/home_screen.dart';
import 'package:graduation/screens/homeScreen.dart';

import '../../../shared/custombutton.dart';
import '../../../shared/customtextfield.dart';
import 'auth_cubit.dart';
import 'auth_states.dart';
import 'login_screen.dart';

class RegisterScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final TextEditingController passconfirmcontroller=TextEditingController();
  String? password,confirmpassword;
  RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthCubit,AuthStates>(
        listener: (context,state)
        {
          if( state is FailedToCreateUserState )
            {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor:Colors.red,content: Text(state.message)));
            }
          if( state is UserCreatedSuccessState )
            {
              Navigator.push(context, MaterialPageRoute(builder: (context) => homeSCreen()));
            }
        },
        builder: (context,state){
          return Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children:
              [
                SizedBox(height: 10,),
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

                  controller: nameController,
                ),
                customField(
                  controller: emailController,
                  validate: (data){
                    if(data==''){
                      return "Can't be empty";
                    }else {
                      return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(data!) ?
                      null : "Enter correct email";
                    }

                  },

                  label: 'E-mail',
                  hinttext: 'Enter your e-mail address',
                  icon: Icons.email,
                ),
                custompassField(
                  controller: passwordController,
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
                    confirmpassword=data;

                  },
                ),
                SizedBox(height: 20,),
                custombutton(
                  text: 'Register',
                  onTap: (){
                    if( emailController.text.isNotEmpty && passwordController.text.isNotEmpty  &&nameController.text.isNotEmpty)
                    {
                      BlocProvider.of<AuthCubit>(context).register(email: emailController.text, password: passwordController.text,name: nameController.text);
                      print('pressed');
                      //Navigator.push(context, MaterialPageRoute(builder: (context) => homeSCreen(),));
                    }
                    // else
                    // {
                    //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor:Colors.red,content: Text("Please, fill The Textformfield and try again later")));
                    // }

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
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
                      },
                      child: Text('Log In ',style: TextStyle(fontSize:18,color: Color(0xff407BFF)),),)
                  ],
                ),
                SizedBox(height: 20,),

              ],
            ),
          );
        },
      )
    );
  }
}
