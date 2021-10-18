import 'dart:io';

import 'package:absen_lite/theme.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraPages extends StatefulWidget {
  // const CameraPages({Key? key}) : super(key: key);

  @override
  _CameraPagesState createState() => _CameraPagesState();
}

class _CameraPagesState extends State<CameraPages> {
  //untuk memunculkan gambar
  File? image;

  Future getPhoto() async {
    final ImagePicker _picker = ImagePicker();

    // Capture a photo
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    //mengubah Xfile jadi file
    image = File(photo!.path);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: whiteColor,
      height: 200,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Photo'),
          image != null
              ? Container(
                  height: MediaQuery.of(context).size.width,
                  width: MediaQuery.of(context).size.width,
                  child: Image.file(
                    image!,
                    fit: BoxFit.cover,
                  ),
                )
              : Container(),
          TextButton(
              style: TextButton.styleFrom(backgroundColor: blueColor),
              onPressed: () async {
                await getPhoto();
              },
              child: Text(
                'Ambil Gambar',
                style: whiteTextStyle,
              ))
        ],
      ),
    );
  }
}
