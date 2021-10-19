import 'dart:io';

import 'package:absen_lite/pages/test_pages.dart';
import 'package:absen_lite/theme.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraPages extends StatefulWidget {
  int? id;
  String? name;
  CameraPages(this.id, this.name);
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
    if (photo != null) {
      image = File(photo.path);
    }

    setState(() {});
  }

  nextpage() {
    if (image != null) {
      // Navigator.push(
      //         context,
      //         MaterialPageRoute(
      //           builder: (context) => testPage(image)),
      //         ),
      //       );
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => testPage(image)));
    }
  }

  @override
  Widget build(BuildContext context) {
    // Widget nextpage() {
    //   return Container(
    //     child: Column(
    //       children: [

    //       ],
    //     ),
    //   );   }

    return Container(
      color: whiteColor,
      height: 200,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${widget.name}',
            style: trueBlackTextStyle.copyWith(fontSize: 14, fontWeight: light),
          ),
          image != null
              ? Container(
                  height: MediaQuery.of(context).size.width,
                  width: MediaQuery.of(context).size.width,
                  child: Image.file(
                    image!,
                    fit: BoxFit.cover,
                  ),
                )
              // nextpage()
              : Container(),
          image != null
              ? TextButton(
                  style: TextButton.styleFrom(backgroundColor: blueColor),
                  onPressed: () async {
                    await getPhoto();
                  },
                  child: Text(
                    'retake a photo',
                    style: whiteTextStyle,
                  ),
                )
              : TextButton(
                  style: TextButton.styleFrom(backgroundColor: blueColor),
                  onPressed: () async {
                    await getPhoto();
                  },
                  child: Text(
                    'Take a photo',
                    style: whiteTextStyle,
                  ),
                ),
          image != null
              ? TextButton(
                  style: TextButton.styleFrom(backgroundColor: blueColor),
                  onPressed: () async {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => testPage(image)));
                  },
                  child: Text(
                    'next',
                    style: whiteTextStyle,
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
