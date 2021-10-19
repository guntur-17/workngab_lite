import 'dart:io';

import 'package:flutter/material.dart';

//tidak dipakai, hanya sebagai percobaan parsing gambar
class testPage extends StatefulWidget {
  // const testPage({Key? key}) : super(key: key);
  // double? lat;
  // double? long;

  // Scanner(this.lat, this.long);

  // int? id;
  // String? name;
  // testPage(this.id, this.name);
  File? image;
  testPage(this.image);

  @override
  _testPageState createState() => _testPageState();
}

class _testPageState extends State<testPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        // Text(widget.name!),
        Container(
          height: MediaQuery.of(context).size.width,
          width: MediaQuery.of(context).size.width,
          child: Image.file(
            widget.image!,
            fit: BoxFit.cover,
          ),
        )
      ]),
    );
  }
}
