import 'dart:io';

import 'package:absen_lite/pages/success_pages.dart';

import 'package:absen_lite/providers/scanner_provider.dart';
import 'package:absen_lite/theme.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CameraPages extends StatefulWidget {
  final int? id;
  final String? name;
  final String? addressUser;
  const CameraPages(this.id, this.name, this.addressUser, {Key? key})
      : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    ScannerProvider scannerProvider = Provider.of<ScannerProvider>(context);

    handleUploadPhoto(String? name) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');
      if (await scannerProvider.visitingPhoto(
          widget.id, token, widget.addressUser, image)) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => SuccessPages(name)));
        ScaffoldMessenger.of(context).removeCurrentSnackBar();
      }
    }

    wait(String? name) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: greenColor,
        content: const Text(
          'Loading...',
          textAlign: TextAlign.center,
        ),
        // duration: Duration(seconds: 2),
      ));
      handleUploadPhoto(name);
    }

    Widget title() {
      return RelativeBuilder(builder: (context, height, width, sy, sx) {
        return Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/toko.png', width: sx(60), height: sy(60)),
              const SizedBox(
                width: 5,
              ),
              Text('${widget.name}',
                  style: trueBlackTextStyle.copyWith(
                      fontSize: 18, fontWeight: FontWeight.w600))
            ],
          ),
        );
      });
    }

    Widget alamat() {
      return RelativeBuilder(builder: (context, height, width, sy, sx) {
        return Padding(
          padding: const EdgeInsets.only(top: 20, left: 45, right: 45),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'assets/loc.png',
                width: sx(20),
                height: sy(20),
              ),
              SizedBox(
                width: sx(10),
              ),
              Text(
                'Alamat',
                style: trueBlackTextStyle.copyWith(
                    fontSize: 14, fontWeight: semiBold),
              )
            ],
          ),
        );
      });
    }

    Widget fullalamat() {
      return RelativeBuilder(builder: (context, height, width, sy, sx) {
        return Padding(
          padding:
              const EdgeInsets.only(top: 10, left: 45, right: 45, bottom: 10),
          child: Text(
            '${widget.addressUser}',
            textAlign: TextAlign.justify,
            style:
                trueBlackTextStyle.copyWith(fontSize: 14, fontWeight: reguler),
          ),
        );
      });
    }

    Widget next() {
      return RelativeBuilder(builder: (contex, height, width, sy, sx) {
        return Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            children: [
              SizedBox(
                height: sx(60),
                width: sx(150),
                child: TextButton(
                  style: TextButton.styleFrom(backgroundColor: blueColor),
                  onPressed: () async {
                    wait(widget.name);
                  },
                  child: Text(
                    'Upload',
                    style:
                        whiteTextStyle.copyWith(fontSize: 18, fontWeight: bold),
                  ),
                ),
              ),
            ],
          ),
        );
      });
    }

    Widget kotak() {
      return RelativeBuilder(builder: (context, height, widht, sy, sx) {
        return Container(
          height: sy(450),
          width: sx(500),
          decoration: BoxDecoration(
              color: yellowColor, borderRadius: BorderRadius.circular(15)),
          child: Column(
            children: [
              title(),
              alamat(),
              fullalamat(),
              image != null
                  ? Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: Image.file(
                        image!,
                        fit: BoxFit.cover,
                        height: sx(130),
                        width: sx(130),
                      ),
                    )
                  : Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      height: sy(130),
                      width: sx(130),
                    ),
              image != null
                  ? TextButton(
                      style: TextButton.styleFrom(backgroundColor: blueColor),
                      onPressed: () async {
                        await getPhoto();
                      },
                      child: Text(
                        'Retake a photo',
                        style: whiteTextStyle.copyWith(
                            fontSize: 18, fontWeight: bold),
                      ),
                    )
                  : TextButton(
                      style: TextButton.styleFrom(backgroundColor: blueColor),
                      onPressed: () async {
                        await getPhoto();
                      },
                      child: Text(
                        'Take a photo',
                        style: whiteTextStyle.copyWith(
                            fontSize: 18, fontWeight: bold),
                      ),
                    ),
              image != null ? next() : Container(),
            ],
          ),
        );
      });
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: whiteColor,
        body: Container(
          color: whiteColor,
          // height: 200,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              kotak(),
            ],
          ),
        ),
      ),
    );
  }
}
