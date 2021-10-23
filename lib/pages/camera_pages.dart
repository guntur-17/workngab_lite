import 'dart:io';

import 'package:absen_lite/pages/home.dart';
import 'package:absen_lite/pages/success_pages.dart';
import 'package:absen_lite/pages/test_pages.dart';
import 'package:absen_lite/providers/scanner_provider.dart';
import 'package:absen_lite/theme.dart';
import 'package:absen_lite/widgets/loading_button.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';

class CameraPages extends StatefulWidget {
  int? id;
  String? name;

  String? addressUser;
  CameraPages(this.id, this.name, this.addressUser);
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
      // Dio dio = new Dio();
      // FormData formdata = new FormData();
      // formdata.add('photos', new UploadFileInfo(image, basename(image.path)));
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
    ScannerProvider scannerProvider = Provider.of<ScannerProvider>(context);
    bool isLoading = false;
    // Widget nextpage() {
    //   return Container(
    //     child: Column(
    //       children: [

    //       ],
    //     ),
    //   );   }
    handleUploadPhoto(String? name) async {
      // setState(() {
      //   isLoading = true;
      // });

      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');
      if (await scannerProvider.visitingPhoto(
          widget.id, token, widget.addressUser, image)) {
        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //     backgroundColor: greenColor,
        //     content: Text(
        //       'Loading...',
        //       textAlign: TextAlign.center,
        //     )));
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => SuccessPages(name)));
        ScaffoldMessenger.of(context).removeCurrentSnackBar();
      }

      // setState(() {
      //   isLoading = false;
      // });
    }

    wait(String? name) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: greenColor,
        content: Text(
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
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/toko.png', width: sx(60), height: sy(60)),
                SizedBox(
                  width: 5,
                ),
                Text('${widget.name}',
                    style: trueBlackTextStyle.copyWith(
                        fontSize: 18, fontWeight: FontWeight.w600))
              ],
            ),
          ),
        );
      });
    }

    Widget alamat() {
      return RelativeBuilder(builder: (context, height, width, sy, sx) {
        return Padding(
          padding: const EdgeInsets.only(top: 20, left: 45, right: 45),
          child: Container(
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
          ),
        );
      });
    }

    Widget fullalamat() {
      return RelativeBuilder(builder: (context, height, width, sy, sx) {
        return Padding(
          padding:
              const EdgeInsets.only(top: 10, left: 45, right: 45, bottom: 10),
          child: Container(
            child: Expanded(
              child: Text(
                '${widget.addressUser}',
                // maxLines: 3,
                // overflow: TextOverflow.ellipsis,
                // textDirection: TextDirection.rtl,
                textAlign: TextAlign.justify,
                style: trueBlackTextStyle.copyWith(
                    fontSize: 14, fontWeight: reguler),
              ),
            ),
          ),
        );
      });
    }

    Widget buttonSelfie() {
      return Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.6,
          height: MediaQuery.of(context).size.height * 0.08,
          decoration: BoxDecoration(
              color: blueColor, borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Take a Selfiie',
                style: whiteTextStyle.copyWith(fontSize: 18, fontWeight: bold),
              ),
              Image.asset(
                'assets/cam.png',
                width: 25,
                height: 25,
              )
            ],
          ),
        ),
      );
    }

    Widget next() {
      return Padding(
        padding: EdgeInsets.only(top: 10),
        child: Column(
          children: [
            SizedBox(
              height: 50,
              width: 170,
              child: TextButton(
                style: TextButton.styleFrom(backgroundColor: blueColor),
                onPressed: () async {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => testPage(image)));
                  wait(widget.name);
                  // handleUploadPhoto(widget.name);
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
    }

    Widget kotak() {
      return Padding(
        padding: const EdgeInsets.only(left: 22, right: 22, top: 10),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.8,
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
              color: yellowColor, borderRadius: BorderRadius.circular(15)),
          child: Column(
            children: [
              title(),
              alamat(),
              fullalamat(),
              // image != null ? retakeSelfie() : buttonSelfie(),
              image != null
                  ? Container(
                      // height: 50,
                      // width: 50,
                      margin: EdgeInsets.only(bottom: 10),
                      child: Image.file(
                        image!,
                        fit: BoxFit.cover,
                        height: 230,
                        width: 230,
                      ),
                    )
                  // nextpage()
                  : Container(
                      margin: EdgeInsets.only(bottom: 10),
                      height: 230,
                      width: 230,
                    ),

              image != null
                  ? TextButton(
                      style: TextButton.styleFrom(backgroundColor: blueColor),
                      onPressed: () async {
                        await getPhoto();
                      },
                      child: Text(
                        'retake a photo',
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
        ),
      );
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
              // Text(
              //   '${widget.id}',
              //   style: trueBlackTextStyle.copyWith(fontSize: 14, fontWeight: light),
              // ),
              // Text(
              //   '${widget.name}',
              //   style: trueBlackTextStyle.copyWith(fontSize: 14, fontWeight: light),
              // ),
              // Text(
              //   '${widget.latUser}',
              //   style: trueBlackTextStyle.copyWith(fontSize: 14, fontWeight: light),
              // ),
              // Text(
              //   '${widget.longUser}',
              //   style: trueBlackTextStyle.copyWith(fontSize: 14, fontWeight: light),
              // ),
              // Text(
              //   '${widget.addressUser}',
              //   style: trueBlackTextStyle.copyWith(fontSize: 14, fontWeight: light),
              // ),
              kotak(),
              // image != null
              //     ? Container(
              //         height: MediaQuery.of(context).size.width,
              //         width: MediaQuery.of(context).size.width,
              //         child: Image.file(
              //           image!,
              //           fit: BoxFit.cover,
              //         ),
              //       )
              //     // nextpage()
              //     : Container(),
              // image != null
              //     ? TextButton(
              //         style: TextButton.styleFrom(backgroundColor: blueColor),
              //         onPressed: () async {
              //           await getPhoto();
              //         },
              //         child: Text(
              //           'retake a photo',
              //           style: whiteTextStyle,
              //         ),
              //       )
              //     : TextButton(
              //         style: TextButton.styleFrom(backgroundColor: blueColor),
              //         onPressed: () async {
              //           await getPhoto();
              //         },
              //         child: Text(
              //           'Take a photo',
              //           style: whiteTextStyle,
              //         ),
              //       ),
            ],
          ),
        ),
      ),
    );
  }
}
