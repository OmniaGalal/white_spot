// import 'dart:convert';
// import 'dart:io';
// import 'package:animated_text_kit/animated_text_kit.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:tflite/tflite.dart';
// import 'package:http/http.dart' as http;
//
// class caseScreen extends StatefulWidget {
//
//   @override
//   State<caseScreen> createState() => _caseScreenState();
// }
//
// class _caseScreenState extends State<caseScreen> {
//   @override
//   void initState() {
//     super.initState();
//     // loadModel().then((value) {
//     //   setState(() {});
//     // });
//   }
//
//   bool loading = true;
//   File? image;
//   List? _output;
//   final picker = ImagePicker();
//   String pred='';
//  var url ="https://white-skin-patches.onrender.com/predictApi";
//   // void predictImage() async {
//   //   var request = http.MultipartRequest('POST', Uri.parse('https://white-skin-patches.onrender.com/predictApi'));
//   //   request.files.add(await http.MultipartFile.fromPath('fileup', image!.path));
//   //
//   //   var response = await request.send();
//   //   if (response.statusCode == 200) {
//   //     var jsonResponse = await response.stream.bytesToString();
//   //     var prediction = jsonDecode(jsonResponse)['prediction'];
//   //
//   //     // Handle the prediction result
//   //     // ...
//   //   } else {
//   //     // Handle the API request error
//   //     print('API request failed with status code ${response.statusCode}');
//   //   }
//   // }
//  upload()async{
//    var request = http.MultipartRequest('POST', Uri.parse('https://white-skin-patches.onrender.com/predictApi'));
//    request.files.add(await http.MultipartFile.fromPath('fileup', image!.path));
//     final header={"Content-Type" : "multipart/form-data"};
//    request.headers.addAll(header);
//    final myRrequest= await request.send();
//    http.Response res=await http.Response.fromStream(myRrequest);
//    if(myRrequest.statusCode==200){
//      final resJson=jsonDecode(res.body);
//      //return resJson;
//      print("response here : ${resJson}");
//    }else{
//      print("Error..${myRrequest.statusCode}");
//    }
//
//    setState(() {
//
//    });
//  }
//   pickImage() async {
//     var pickedImage = await picker.pickImage(source: ImageSource.gallery);
//     if (pickedImage != null) {
//       setState(() {
//         image = File(pickedImage.path);
//       });
//       // classifyImage(image!);
//     }
//   }
//
//   pickCameraImage() async {
//     var pickedImage = await picker.pickImage(source: ImageSource.camera);
//     if (pickedImage != null) {
//       setState(() {
//         image = File(pickedImage.path);
//       });
//       // classifyImage(image!);
//     }
//   }
//
//   // classifyImage(File image) async {
//   //
//   //   var output = await Tflite.runModelOnImage(
//   //     path: image.path,
//   //     numResults: 10,
//   //     threshold: 0.5,
//   //     imageMean: 127.5,
//   //     imageStd: 127.5,
//   //   );
//   //   setState(() {
//   //     loading = false;
//   //     _output = output;
//   //     String? str= _output![0]['label'];
//   //     pred=str!;
//   //   });
//   // }
//   //
//   // loadModel() async {
//   //   await Tflite.loadModel(
//   //     model: 'assets/model.tflite',
//   //     labels: 'assets/labels.txt',
//   //   );
//   // }
//
//   @override
//   // void dispose() {
//   //   Tflite.close();
//   //   super.dispose();
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: AnimatedTextKit(
//           repeatForever: true,
//           animatedTexts: [
//             ColorizeAnimatedText(
//               'Object Detection',
//               textStyle: const TextStyle(
//                 fontSize: 30,
//                 fontWeight: FontWeight.bold,
//               ),
//               colors: [
//                 const Color.fromRGBO(5, 242, 246, 1),
//                 const Color.fromRGBO(84, 46, 146, 0.82),
//               ],
//               speed: const Duration(milliseconds: 200),
//             ),
//           ],
//         ),
//         centerTitle: true,
//     leading: IconButton(
//               icon: Icon(Icons.arrow_back, color: Colors.black),
//               onPressed: () {
//                 Navigator.pop(context);
//               }),
//         ),
//
//       body: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 24),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               const SizedBox(height: 40),
//               image != null
//                   ?
//               Column(
//                 children: [
//                   Card(
//                     clipBehavior: Clip.antiAlias,
//                     elevation: 10,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Image.file(image!),
//                   ),
//                   MaterialButton(onPressed: (){
//                     upload();
//                     //predictImage();
//                   }
//                   ,child: Text('Analyze photo'),),
//                   Text('${upload()}'),
//                 ],
//               )
//                   :  Column(
//                 children: [
//                   SizedBox(
//                     height: 40,
//                   ),
//                   Image.asset('./assets/images/dermaa.png'),
//                   SizedBox(
//                     height: 24,
//                   ),
//                   Text(
//                     'Focus the affected skin area in the box',
//                     style: TextStyle(fontSize: 18),
//                   ),
//                   SizedBox(
//                     height: 8,
//                   ),
//                   Text(
//                     'and snap the picture to get started',
//                     style: TextStyle(fontSize: 18),
//                   ),
//                   SizedBox(
//                     height: 30,
//                   ),
//                   GestureDetector(
//                     onTap: () async {
//                       Map<Permission, PermissionStatus> statuses = await [
//                       Permission.camera,
//                           Permission.storage,
//                       ].request();
//                       if (statuses[Permission.storage]! .isGranted && statuses[Permission.camera]! .isGranted) {
//                         showDialog(
//                           context: context,
//                           builder: (ctx) => AlertDialog(
//                             //title: const Text("Alert Dialog Box"),
//                             content: Container(
//                               height: 150,
//                               child: Column(
//                                 children: [
//                                   SizedBox(
//                                     height: 20,
//                                   ),
//                                   Container(
//                                     child: GestureDetector(
//                                         child: Center(
//                                             child: Text(
//                                               'Upload from Gallery',
//                                               style: TextStyle(
//                                                   fontSize: 20,
//                                                   color: Colors.white),
//                                             )),
//                                         onTap: () {
//                                           pickImage();
//                                           Navigator.pop(context);
//                                         }),
//                                     width: double.infinity,
//                                     height: 40,
//                                     padding:
//                                     EdgeInsets.symmetric(horizontal: 10),
//                                     decoration: BoxDecoration(
//                                         color: Color(0xff407BFF),
//                                         borderRadius:
//                                         BorderRadius.circular(15)),
//                                   ),
//                                   SizedBox(
//                                     height: 20,
//                                   ),
//                                   Container(
//                                     child: GestureDetector(
//                                         child: Center(
//                                             child: Text(
//                                               'Use Camera',
//                                               style: TextStyle(
//                                                   fontSize: 20,
//                                                   color: Colors.white),
//                                             )),
//                                         onTap: () {
//                                           pickCameraImage();
//                                           Navigator.pop(context);
//                                         }),
//                                     width: double.infinity,
//                                     height: 40,
//                                     padding:
//                                     EdgeInsets.symmetric(horizontal: 10),
//                                     decoration: BoxDecoration(
//                                         color: Color(0xff407BFF),
//                                         borderRadius:
//                                         BorderRadius.circular(15)),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         );
//                        // Navigator.pushNamed(context, photoScreen.id);
//                       }else
//                         {
//                           print('No permission provided');
//                         }
//
//
//
//                     },
//                     child: Stack(
//                       alignment: AlignmentDirectional.center,
//                       children: [
//                         Icon(
//                           Icons.circle,
//                           size: 130,
//                           color: Colors.white,
//                         ),
//                         Icon(
//                           Icons.photo_camera_outlined,
//                           size: 60,
//                           color: Color(0xff407BFF),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 40),
//               _output != null
//                   ? AnimatedTextKit(
//                 repeatForever: true,
//                 animatedTexts: [
//                   TyperAnimatedText(
//                     '${pred} ${(100 * _output![0]['confidence']).toStringAsFixed(0)}% ',
//                     textStyle: const TextStyle(
//                       fontSize: 30,
//                       fontWeight: FontWeight.bold,
//                     ),
//                     speed: const Duration(milliseconds: 120),
//                   ),
//                 ],
//               )
//                   : Container(),
//               const SizedBox(height: 40),
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:convert';
import 'dart:io';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation/lib/UI/functions.dart';
import 'package:graduation/lib/UI/onBoarding.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class caseScreen extends StatefulWidget {
  @override
  State<caseScreen> createState() => _caseScreenState();
}

class _caseScreenState extends State<caseScreen> {
  final picker = ImagePicker();
  File? imageFile;
  String? result;
  upload() async {
    var request = http.MultipartRequest('POST',
        Uri.parse('https://white-skin-patches.onrender.com/predictApi'));
    request.files
        .add(await http.MultipartFile.fromPath('fileup', imageFile!.path));
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
      setState(() {
        imageFile = File(croppedFile.path);
        upload();
      });

      // reload();
    }
  }

  imgFromCamera() async {
    await picker
        .pickImage(source: ImageSource.camera, imageQuality: 50)
        .then((value) {
      if (value != null) {
        cropImage(File(value.path));
      }
    });
  }

  imgFromGallery() async {
    await picker
        .pickImage(source: ImageSource.gallery, imageQuality: 50)
        .then((value) {
      if (value != null) {
        cropImage(File(value.path));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   title: AnimatedTextKit(
        //     repeatForever: true,
        //     animatedTexts: [
        //       ColorizeAnimatedText(
        //         'Analyzing ',
        //         textStyle: const TextStyle(
        //           fontSize: 30,
        //           fontWeight: FontWeight.bold,
        //         ),
        //         colors: [
        //            Colors.black,
        //           const Color.fromRGBO(84, 46, 146, 0.82),
        //         ],
        //         speed: const Duration(milliseconds: 200),
        //       ),
        //     ],
        //   ),
        //   leading: IconButton(
        //       icon: Icon(Icons.arrow_back, color: Colors.black),
        //       onPressed: () {
        //         Navigator.pop(context);
        //       }),
        // ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 20.0,
              ),
              imageFile != null
                  ? Container(
                      width: MediaQuery.of(context).size.height * .9,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child:
                                CircleAvatar(
                                  radius: 100,
                                  backgroundImage: FileImage(imageFile!),
                                  //child: Image.file(imageFile!),
                                )
                            //     Card(
                            //   clipBehavior: Clip.antiAlias,
                            //   elevation: 10,
                            //   shape: RoundedRectangleBorder(
                            //     borderRadius: BorderRadius.circular(10),
                            //   ),
                            //   child: Padding(
                            //     padding: const EdgeInsets.all(15.0),
                            //     child: Image.file(imageFile!),
                            //   ),
                            // ),
                          ),

                          result == null
                              ? Text(
                                  'Processing... ',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                )
                              : Column(
                                  children: [
                                    Text(
                                      'Your skin condition is',
                                      style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 10,),
                                    AnimatedTextKit(
                                      repeatForever: true,
                                      animatedTexts: [
                                        TyperAnimatedText(
                                          '${result}',
                                          textStyle: const TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          speed:
                                              const Duration(milliseconds: 120),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 35,),

                                    Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(40),
                                          gradient: LinearGradient(
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                              colors: [
                                                Colors.black38,
                                                Colors.blue
                                              ])),
                                      child: MaterialButton(
                                        onPressed: () {},
                                        child: Text(
                                          'Recommendations',
                                          style:
                                          TextStyle(color: Colors.white, fontSize: 20),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 15,),
                                    Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(40),
                                          gradient: LinearGradient(
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                              colors: [
                                                Colors.black38,
                                                Colors.blue
                                              ])),
                                      child: MaterialButton(
                                        onPressed: () {},
                                        child: Text(
                                          'About this disease',
                                          style:
                                          TextStyle(color: Colors.white, fontSize: 20),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 15,),
                                    Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(40),
                                          gradient: LinearGradient(
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                              colors: [
                                                Colors.black38,
                                                Colors.blue
                                              ])),
                                      child: MaterialButton(
                                        onPressed: () {},
                                        child: Text(
                                          'Chat with doctor',
                                          style:
                                          TextStyle(color: Colors.white, fontSize: 20),
                                        ),
                                      ),
                                    ),


                                  ],
                                ),
                        ],
                      ),
                    )
                  : Column(
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        Image.asset('./assets/images/dermaa.png'),
                        SizedBox(
                          height: 40,
                        ),
                        Text('Focus the affected skin area in the box',
                            style: GoogleFonts.acme(
                              textStyle: TextStyle(
                                fontSize: 25,
                              ),
                            )),
                        SizedBox(
                          height: 8,
                        ),
                        Text('and snap the picture to get started',
                            style: GoogleFonts.acme(
                              textStyle: TextStyle(
                                fontSize: 25,
                              ),
                            )),
                        SizedBox(
                          height: 50,
                        ),
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Colors.pinkAccent,
                                    Colors.amberAccent
                                  ])),
                          child: MaterialButton(
                            onPressed: () async {
                              Map<Permission, PermissionStatus> statuses =
                                  await [
                                Permission.storage,
                                Permission.camera,
                              ].request();
                              if (statuses[Permission.storage]!.isGranted &&
                                  statuses[Permission.camera]!.isGranted) {
                                imgFromGallery();
                                print('permission');
                              } else {
                                print('no permission provided');
                              }
                            },
                            child: Text(
                              'Upload image from Gallery',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          height: 50,
                          width: 270,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Colors.pinkAccent,
                                    Colors.amberAccent
                                  ])),
                          child: MaterialButton(
                            onPressed: () async {
                              Map<Permission, PermissionStatus> statuses =
                                  await [
                                Permission.storage,
                                Permission.camera,
                              ].request();
                              if (statuses[Permission.storage]!.isGranted &&
                                  statuses[Permission.camera]!.isGranted) {
                                //imgFromCamera();
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //       builder: (context) => OnBoarding(),
                                //     ));
                                imgFromCamera();
                                print('permission');
                              } else {
                                print('no permission provided');
                              }
                            },
                            child: Text(
                              'Pick image from Camera',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),

                        // TextButton(
                        //   onPressed: () async {
                        //     Map<Permission, PermissionStatus> statuses = await [
                        //       Permission.storage,
                        //       Permission.camera,
                        //     ].request();
                        //     if (statuses[Permission.storage]!.isGranted &&
                        //         statuses[Permission.camera]!.isGranted) {
                        //       showImagePicker(context);
                        //       print('permission');
                        //     } else {
                        //       print('no permission provided');
                        //     }
                        //   },
                        //   child:
                        //
                        //   Stack(
                        //     alignment: AlignmentDirectional.center,
                        //     children: [
                        //       Icon(
                        //         Icons.circle,
                        //         size: 130,
                        //         color: Colors.white,
                        //       ),
                        //       Icon(
                        //         Icons.photo_camera_outlined,
                        //         size: 60,
                        //         color: Color(0xff407BFF),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),

              const SizedBox(
                height: 20.0,
              ),
              // ElevatedButton(
              //   onPressed: () async {
              //     Map<Permission, PermissionStatus> statuses = await [
              //       Permission.storage, Permission.camera,
              //     ].request();
              //     if(statuses[Permission.storage]!.isGranted && statuses[Permission.camera]!.isGranted){
              //       showImagePicker(context);
              //     } else {
              //       print('no permission provided');
              //     }
              //   },
              //   child: Text('Select Image'),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  // void showImagePicker(BuildContext context) {
  //   showModalBottomSheet(
  //       context: context,
  //       builder: (builder) {
  //         return Card(
  //           child: Container(
  //               width: MediaQuery.of(context).size.width,
  //               height: MediaQuery.of(context).size.height / 5.2,
  //               margin: const EdgeInsets.only(top: 8.0),
  //               padding: const EdgeInsets.all(12),
  //               child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 children: [
  //                   Expanded(
  //                       child: InkWell(
  //                     child: Column(
  //                       children: const [
  //                         Icon(
  //                           Icons.image,
  //                           size: 60.0,
  //                         ),
  //                         SizedBox(height: 12.0),
  //                         Text(
  //                           "Gallery",
  //                           textAlign: TextAlign.center,
  //                           style: TextStyle(fontSize: 16, color: Colors.black),
  //                         )
  //                       ],
  //                     ),
  //                     onTap: () {
  //                       _imgFromGallery();
  //                       Navigator.pop(context);
  //                     },
  //                   )),
  //                   Expanded(
  //                       child: InkWell(
  //                     child: SizedBox(
  //                       child: Column(
  //                         children: const [
  //                           Icon(
  //                             Icons.camera_alt,
  //                             size: 60.0,
  //                           ),
  //                           SizedBox(height: 12.0),
  //                           Text(
  //                             "Camera",
  //                             textAlign: TextAlign.center,
  //                             style:
  //                                 TextStyle(fontSize: 16, color: Colors.black),
  //                           )
  //                         ],
  //                       ),
  //                     ),
  //                     onTap: () {
  //                       _imgFromCamera();
  //                       Navigator.pop(context);
  //                     },
  //                   ))
  //                 ],
  //               )),
  //         );
  //       });
  // }

}
