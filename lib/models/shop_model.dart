class ShopModel {
  int? id;
  String? name;
  String? address;
  double? lat;
  double? long;

  ShopModel({
    this.id,
    this.name,
    this.address,
    this.lat,
    this.long,
  });

  ShopModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    lat = json['lat'];
    long = json['long'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'lat': lat,
      'long': long,
    };
  }
}
