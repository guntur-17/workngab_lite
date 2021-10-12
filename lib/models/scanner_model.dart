import 'package:flutter/material.dart';

class ScannerModel {
  int? id;
  String? lat;
  String? long;
  String? name;
  String? address;
  String? barcode;

  ScannerModel({
    this.id,
    this.lat,
    this.long,
    this.name,
    this.address,
    this.barcode,
  });

  ScannerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    lat = json['lat'];
    long = json['long'];
    name = json['name'];
    address = json['address'];
    barcode = json['barcode'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'lat': lat,
      'long': long,
      'name': name,
      'address': address,
      'barcode': barcode,
    };
  }
}
