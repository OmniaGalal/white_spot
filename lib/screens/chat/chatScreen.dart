import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/message.dart';
import '../../shared/chat.dart';
class chatpage extends StatefulWidget {
  chatpage({Key? key}) : super(key: key);
  static String id = 'chatpage';

  @override
  State<chatpage> createState() => _chatpageState();
}

class _chatpageState extends State<chatpage> {
  TextEditingController controller=TextEditingController();

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  String? data;

  final  _controller = ScrollController();

  final user = FirebaseAuth.instance;

  late User signedin;

  @override
  void initState() {
    // TODO: implement initState
    getcurrentuser();
    super.initState();
  }

  void getcurrentuser() {
    try {
      final users = user.currentUser;
      if (users != null) {
        signedin = users;
        print(signedin.email);
      }
    } catch (e) {
      print(e);
    }
  }

  CollectionReference messeges = FirebaseFirestore.instance.collection('message');

  @override
  Widget build(BuildContext context) {
    var email= ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>
      (
        stream: messeges.orderBy('createdAt',descending: true).snapshots(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            List<Message> messagelist=[];
            for(int i=0 ; i<snapshot.data!.docs.length;i++){
              messagelist.add(Message.fromJson(snapshot.data!.docs[i]));
            }
            //print(snapshot.data!.docs[0]['message']);
            return Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.blueGrey,
                  elevation: 0,
                  automaticallyImplyLeading: false,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // CircleAvatar(
                      //   backgroundColor: Colors.white,
                      //   radius: 20,
                      //   child:Image.asset(
                      //     'assets/images/chatt.png',
                      //     height: 100,
                      // ),
                      // ),
                      //SizedBox(width: 130,),
                      Text('Messags',style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'pacifico'
                      ),),
                    ],
                  ),

                  centerTitle: true,
                ),
                body:
                Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                          reverse: true,
                          controller: _controller,
                          itemCount: messagelist.length,
                          itemBuilder: (context,int)
                          {
                            return
                              messagelist[int].id == signedin.email ?
                              chatshared(message: messagelist[int])
                                  : chatsharedfriend(message: messagelist[int]);
                          }),

                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextField(
                        controller: controller,
                        onSubmitted: (data){
                          messeges.add({
                            'message': data,
                            'createdAt':DateTime.now(),
                           'id':signedin.email,
                            'uid':signedin.uid

                          });
                          controller.clear();
                          _controller.animateTo(
                            0,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeIn,
                          );

                        },

                        decoration:InputDecoration(

                          contentPadding:EdgeInsets.all(8.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(
                                color: Color(0xff819ee5),
                              )
                          ),
                          hintText: 'Send message',
                          suffixIcon: Icon(
                            Icons.send,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
            );
          }
          else{
            return Text('is Loading...');
          }
        }
    );
  }
}
