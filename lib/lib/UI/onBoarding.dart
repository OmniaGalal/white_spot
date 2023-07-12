import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation/lib/UI/BuildPage.dart';
import 'package:graduation/lib/UI/functions.dart';
import 'package:graduation/screens/photoScreen.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:http/http.dart' as http;

import '../../casescreen.dart';
import '../../screens/cases.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);
  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final controller = PageController();
  bool? isLast;
  List list = [
    BuildPage(
      image: "assets/images/image 10.png",
      text1: "Go to a well-lit room ,place tour  ",
      text2: 'phone at about 90 degrees to the mole',
    ),
    BuildPage(
      image: 'assets/images/Group 178.png',
      text2: "Place the mole in the center of ",
      text1: "the square and take the photo ",
    ),
    BuildPage(
      image: 'assets/images/Group 180.png',
      text1: "Only skin should fill up the whole ",
      text2: "black square without coverings",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: imageFile == null ?
        Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemBuilder: (context, index) => list[index],
                itemCount: list.length,
                controller: controller,
                onPageChanged: (index) {
                  if (index == list.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                    print('last');
                  } else {
                    setState(() {
                      isLast = false;
                    });
                    print('Not Last');
                  }
                },
              ),
            ),
            SmoothPageIndicator(
              controller: controller,
              count: 3,
              effect: WormEffect(
                spacing: 16,
                dotWidth: 20,
                dotHeight: 20,
                dotColor: Colors.white,
                activeDotColor: Color(0xff8588C7),
              ),
              onDotClicked: (index) => controller.animateToPage(index,
                  duration: Duration(milliseconds: 500), curve: Curves.easeIn),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 40, left: 30, right: 30, bottom: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                    onPressed: () {
                      controller.previousPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeIn);
                    },
                    child: Text('Back',
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                            color: Color(0xff5B5FC7),
                            fontSize: 22,
                          ),
                        )),
                  ),
                  MaterialButton(
                      onPressed: () {
                        if (isLast == true) {
                          Navigator.pop(context);
                          imgFromCamera();
                          //Navigator.push(context, MaterialPageRoute(builder: (context) => caseScreen(),));
                        }
                        controller.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      },
                      color: Color(0xff8588C7),
                      shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      child: isLast == true
                          ? Text('I understand',
                              style: GoogleFonts.lato(
                                textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                ),
                              ))
                          : Text('Next',
                              style: GoogleFonts.lato(
                                textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                ),
                              )))
                ],
              ),
            )
          ],
        ):Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Card(
                clipBehavior: Clip.antiAlias,
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Image.file(imageFile!),
                ),
              ),
            ),
            MaterialButton(
              onPressed: () {
                // upload();
                //predictImage();
              },
              child: Text('Analyze photo'),
            ),
            // Text('$result') == null
            //     ? Text(
            //   'Processing...',
            //   style: TextStyle(
            //       fontSize: 18, color: Colors.white),
            // )
            //     : Text(
            //   '$result',
            //   style: TextStyle(fontSize: 18),
            // )
          ],
        )
    );
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
      setState(() {
        imageFile = File(croppedFile.path);
      });

      // reload();
    }
  }
File? imageFile;
  imgFromCamera() async {
    var pickedimage =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 50);
    if (pickedimage != null) {
      setState(() {
        imageFile = File(pickedimage.path);
      });
    }
  }
}
