// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:graduation/shared/custombutton.dart';
// import 'package:image_picker/image_picker.dart';
//
// class photoScreen extends StatefulWidget {
//   const photoScreen({Key? key}) : super(key: key);
// static String id='photoScreen';
//   @override
//   State<photoScreen> createState() => _photoScreenState();
// }
//
// class _photoScreenState extends State<photoScreen> {
//   File? _images;
//   final imagePicker =ImagePicker();
//   Future getimage() async{
//     final image=await imagePicker.getImage(source:
//     ImageSource.camera,
//     );
//     setState(() {
//       _images =File(image!.path);
//
//     });
//   }
//   Future getimagegall() async{
//     final image=await imagePicker.getImage(source:
//     ImageSource.gallery
//     );
//     setState(() {
//       _images =File(image!.path);
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//       appBar: AppBar(
//         backgroundColor: Color(0xffF5F5F5),
//         elevation: 0,
//         leading: GestureDetector(
//           onTap: (){
//             Navigator.pop(context);
//           },
//           child: IconButton(
//             icon: Icon(Icons.arrow_back, color: Colors.black),
//             onPressed: () => Navigator.of(context).pop(),
//           ),
//         ),
//       ),
//       body: Container(
//       width: double.infinity,
//       decoration: BoxDecoration(
//       color: Color(0xffF5F5F5),
//     ),
//           child: ListView(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(top: 20.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     // SizedBox(height: 200,),
//                     _images == null ?
//                     Image.asset("assets/images/upload.png",width: 300,)
//                         : Image.file(_images!),
//                     //SizedBox(height: 30,),
//                     //SizedBox(height: 200,),
//                     // Padding(
//                     //   padding: const EdgeInsets.only(right: 60,left: 60,top:30,bottom: 20),
//                     //   child: Row(
//                     //     children: [
//                     //       GestureDetector(
//                     //           onTap: (){
//                     //             getimage();
//                     //           },
//                     //           child: Icon(Icons.flip_camera_ios,size: 40,color: Colors.blue[700],)),
//                     //       Spacer(flex: 1,),
//                     //       GestureDetector(
//                     //           onTap: (){
//                     //             getimagegall();
//                     //           },
//                     //           child: Icon(Icons.panorama,size: 40,color: Colors.blue[700])),
//                     //     ],
//                     //   ),
//                     //
//                     // ),
//
//                     SizedBox(height: 45,),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 30),
//                 child: custombutton(text: 'Upload photo',onTap: (){
//
//                 },),
//                 )
//     ],
//           ),
//         )
//     );
//   }
// }
// // void showsnackbar(BuildContext context,String message) {
// //   ScaffoldMessenger.of(context).
// //   showSnackBar(SnackBar(content:
// //   Text(message),),);
// // }
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../lib/UI/functions.dart';
class photoScreen extends StatefulWidget {
  const photoScreen({Key? key}) : super(key: key);

  @override
  State<photoScreen> createState() => _photoScreenState();
}

class _photoScreenState extends State<photoScreen> {
  @override
  Widget build(BuildContext context) {
    return
     Text('data');
  }
  String? result;

  upload() async {
    var request = http.MultipartRequest('POST',
        Uri.parse('https://white-skin-patches.onrender.com/predictApi'));
    request.files
        .add(await http.MultipartFile.fromPath('fileup', functions().imageFile!.path));
    final header = {"Content-Type": "multipart/form-data"};
    request.headers.addAll(header);
    final myRrequest = await request.send();
    http.Response res = await http.Response.fromStream(myRrequest);
    if (myRrequest.statusCode == 200) {
      final resJson = jsonDecode(res.body);
      //return resJson;
      print("response here : ${resJson}");
      result = resJson['prediction'];
    } else {
      print("Error..${myRrequest.statusCode}");
    }

    setState(() {});
  }

  final picker = ImagePicker();

  cropImage(File imgFile) async {
    final croppedFile = await ImageCropper().cropImage(
        sourcePath: imgFile.path,
        aspectRatioPresets: Platform.isAndroid
            ? [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ]
            : [
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio5x3,
          CropAspectRatioPreset.ratio5x4,
          CropAspectRatioPreset.ratio7x5,
          CropAspectRatioPreset.ratio16x9
        ],
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: "Image Cropper",
              toolbarColor: Colors.deepOrange,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: "Image Cropper",
          )
        ]);
    if (croppedFile != null) {
      imageCache.clear();
      functions().imageFile = File(croppedFile.path);

      // reload();
    }
  }
  imgFromCamera() async {
    await picker
        .pickImage(source: ImageSource.camera, imageQuality: 50)
        .then((value) {
      if (value != null) {
        setState(() {
          cropImage(File(value.path));
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => photoScreen(),));

        });
      }
    });
  }
}
