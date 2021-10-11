import 'package:flutter/material.dart';

class ScannerModel {
  int? id;
  String? lat;
  String? long;
  String? name;
  String? stock;

  ScannerModel({this.id, this.lat, this.long, this.name, this.stock});

  ScannerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    lat = json['lat'];
    long = json['long'];
    name = json['name'];
    stock = json['stock'];
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'lat': lat, 'long': long, 'name': name, 'stock': stock};
  }
}
