// import 'package:graduation/models/usermodel.dart' as  u;
// // import 'package:untitled/views/chat.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//
// import '../models/user_model.dart';
// // import 'package:google_sign_in/google_sign_in.dart';
//
// class AuthService {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   u.UserModel _userFromFirebaseUser(User user) {
//     return u.UserModel(uid: user.uid,);
//   }
//
//   Future signInWithEmailAndPassword(String email, String password) async {
//     try {
//       UserCredential result = await _auth.signInWithEmailAndPassword(
//           email: email, password: password);
//       //Userc user = result.user;
//       return _userFromFirebaseUser(result.user!);
//     } catch (e) {
//       print(e.toString());
//       return null;
//     }
//   }
//
//   Future signUpWithEmailAndPassword(String email, String password) async {
//     try {
//       UserCredential result = await _auth.createUserWithEmailAndPassword(
//           email: email, password: password);
//       //UserCredential user = result.user;
//       return _userFromFirebaseUser(result.user!);
//     } catch (e) {
//       print(e.toString());
//       return null;
//     }
//   }
//
//   Future resetPass(String email) async {
//     try {
//       return await _auth.sendPasswordResetEmail(email: email);
//     } catch (e) {
//       print(e.toString());
//       return null;
//     }
//   }
//
//   // Future<UserCredential> signInWithGoogle(BuildContext context) async {
//   //   final GoogleSignIn _googleSignIn = new GoogleSignIn();
//   //
//   //   final GoogleSignInAccount googleSignInAccount =
//   //   await _googleSignIn.signIn();
//   //   final GoogleSignInAuthentication googleSignInAuthentication =
//   //   await googleSignInAccount.authentication;
//   //
//   //   final AuthCredential credential = GoogleAuthProvider.credential(
//   //       idToken: googleSignInAuthentication.idToken,
//   //       accessToken: googleSignInAuthentication.accessToken);
//   //
//   //   UserCredential result = await _auth.signInWithCredential(credential);
//   //   //FirebaseUser userDetails = result.user;
//   //
//   //   if (result == null) {
//   //   } else {
//   //     Navigator.push(context, MaterialPageRoute(builder: (context) => Chat()));
//   //   }
//   // }
//
//   Future signOut() async {
//     try {
//       return await _auth.signOut();
//     } catch (e) {
//       print(e.toString());
//       return null;
//     }
//   }
// }
