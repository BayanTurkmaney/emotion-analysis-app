import 'dart:convert';
import './welcome.dart';
import 'package:emotion_analysis/screens/results.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as sys_path;

class Home extends StatefulWidget {
  static const route = '/home';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  File? imageFile;
  String? imageData;
  bool status = false;
  _takePicture() async {
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(source: ImageSource.camera,
     maxWidth: 600);
    if (pickedImage != null) {
      setState(() {
        imageFile = File(pickedImage.path);
        status = true;
      });
      // from bytes to string
      imageData = base64Encode(imageFile!.readAsBytesSync());
      return imageData;
    } else {
      // return null;
    }
  }

  showImage(String image) {
    //from string to bytes
    //from bytes image
    return Image.memory(base64Decode(image));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: status?
        IconButton(onPressed: (){setState(() {
          status=!status;
        });}, 
        icon: const Icon(Icons.arrow_back)):null,
        title: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            status?'Save':'Home',
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
             Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
              builder: (context) => Welcome() ),
             (Route<dynamic> route) => false);}, 
             icon: const Icon(Icons.logout))],     
      ),
    
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(5),
        child:
         Column(mainAxisAlignment: MainAxisAlignment.center, children: [
         const SizedBox(height: 50),
         
          status? Container(
            // padding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
            width: 500,
            height: 300,
            child:showImage(imageData!),
          ):Container(
            // padding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
            width: 200,
            height: 170,
            child:  SvgPicture.asset('assets/images/camera.svg'),
          ),
          SizedBox(
            height: 60,
          ),
          Container(
            color: Colors.green,
            width: 200,
            height: 50,
            child: 
            status?TextButton(
              child:const Text('submit', 
              style: TextStyle(color: Colors.white, fontSize: 20)),
              onPressed: (){
                Navigator.of(context).pushNamed(Results.route);
              },
            ):TextButton(
              child: const Text('Take a photo', style: TextStyle(color: Colors.white, fontSize: 18)),
              onPressed: _takePicture,
            ),
          )
        ]),
      ),
    );
  }
}
