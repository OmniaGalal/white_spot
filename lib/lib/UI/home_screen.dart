import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Controller/layout_cubit.dart';
import '../Controller/layout_states.dart';
import 'chat_screen.dart';
class HomeScreen extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  HomeScreen({Key? key}) : super(key: key);
List list=[
  'the consultant dermatologist and former president of the National Research Center',
  'Dermatologist',
  "Ass.Professor in Dermatology specialized in vitiligo"


];
  @override
  Widget build(BuildContext context) {
    final layoutCubit = BlocProvider.of<LayoutCubit>(context)..getMyData()..getUsers();
    return BlocConsumer<LayoutCubit,LayoutStates>(
        listener: (context,state){},
        builder: (context,state){
          return Scaffold(
            key: scaffoldKey,
            // drawer: Drawer(
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children:
            //     [
            //       if( layoutCubit.userModel != null )
            //         UserAccountsDrawerHeader(
            //           accountName: Text(layoutCubit.userModel!.name!),
            //           accountEmail: Text(layoutCubit.userModel!.email!),
            //           // currentAccountPicture: CircleAvatar(
            //           //   radius: 40,
            //           //   backgroundImage: NetworkImage(layoutCubit.userModel!.image!),
            //           // ),
            //       ),
            //       Expanded(
            //         child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children:
            //           [
            //             SizedBox(height: 80,),
            //             ListTile(
            //               leading: Icon(Icons.logout),
            //               title: Text("log out"),
            //             )
            //           ],
            //         ),
            //       )
            //     ],
            //   ),
            // ),
            appBar: AppBar(
              title: Row(
                children: [
                  Icon(Icons.arrow_back_ios,color: Colors.black,),
                  TextButton(onPressed: (){}, child:
                  Text('Back',style: TextStyle(fontSize: 20),))
                ],
              ),
              // layoutCubit.searchEnabled ? TextField(
              //   style: TextStyle(color: Colors.white),
              //   onChanged: (input)
              //   {
              //     layoutCubit.searchAboutUser(query: input);
              //   },
              //   decoration: InputDecoration(
              //     border: InputBorder.none,
              //     hintText: 'Search about User....',
              //     hintStyle: TextStyle(color: Colors.white)
              //   ),
              // ) : GestureDetector(
              //     child: Text("Recommended Doctors"),
              //     onTap: ()
              //     {
              //       scaffoldKey.currentState!.openDrawer();
              //     },
              // ),
              // actions: [
              //   Padding(
              //     padding: const EdgeInsets.only(right: 12.0),
              //     child: GestureDetector(
              //       child:
              //       // Icon(layoutCubit.searchEnabled ?
              //       // Icons.clear : Icons.search),
              //       // onTap: ()
              //       // {
              //       //   layoutCubit.changeSearchStatus();
              //       // },
              //     ),
              //   )
              // ],

              automaticallyImplyLeading: true,elevation: 0,backgroundColor: Colors.transparent,),

            body: state is GetUsersLoadingState ?
              const Center(
                child: CircularProgressIndicator(),
               ) : layoutCubit.users.isNotEmpty ?
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 8),
                child: ListView.separated(
                  itemCount: layoutCubit.usersFiltered.isEmpty ? layoutCubit.users.length : layoutCubit.usersFiltered.length,
                    separatorBuilder: (context,index) => const SizedBox(height: 18,),
                    itemBuilder: (context,index){
                    return Container(

                      height: 210,
                      padding: EdgeInsets.symmetric(horizontal:20,),
                      child: Card(
                        child:  Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${layoutCubit.usersFiltered.isEmpty ? layoutCubit.users[index].name! : layoutCubit.usersFiltered[index].name!}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                            SizedBox(height: 5,),
                              Text('${list[index]}',style: TextStyle(fontSize: 15),),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                Image.asset('assets/images/Rate.png'),
                                  Image.asset('assets/images/Time.png')

                                ],),
                              SizedBox(height: 15),
                              Center(
                                child: Container(
                                  width: double.infinity,
                                  child: MaterialButton(onPressed: (){

                                    Navigator.push(context, MaterialPageRoute(builder: (context){
                                      return ChatScreen(userModel: layoutCubit.usersFiltered.isEmpty? layoutCubit.users[index] : layoutCubit.usersFiltered[index]);
                                    }));
                                  },
                                    textColor: Colors.white,
                                    color: Colors.blue,
                                  child: Text("Message"),),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                    //   ListTile(
                    //
                    //   // onTap: (){
                    //   //   Navigator.push(context, MaterialPageRoute(builder: (context){
                    //   //     return ChatScreen(userModel: layoutCubit.usersFiltered.isEmpty? layoutCubit.users[index] : layoutCubit.usersFiltered[index]);
                    //   //   }));
                    //   // },
                    //   contentPadding: EdgeInsets.zero,
                    //   // leading: CircleAvatar(
                    //   //   radius: 35,
                    //   //   backgroundImage: NetworkImage(
                    //   //     layoutCubit.usersFiltered.isEmpty ? layoutCubit.users[index].image! : layoutCubit.usersFiltered[index].image!
                    //   //   ),
                    //   // ),
                    //   title: Text("${layoutCubit.usersFiltered.isEmpty ? layoutCubit.users[index].name! : layoutCubit.usersFiltered[index].name!}"),
                    // );
                    }
            ),
              ) : const Center(
              child: Text("There is no Users yet"),
            ),
          );
        },
    );
  }
}
