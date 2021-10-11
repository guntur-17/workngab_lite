class InModel {
  String? time;
  String? long;
  String? lat;

  InModel({
    this.time,
    this.lat,
    this.long,
  });

  InModel.fromJason(Map<String, dynamic> json) {
    time = json['time'];
    lat = json['lat'];
    long = json['long'];
  }

  Map<String, dynamic> toJson() {
    return {
      'time': time,
      'lat': lat,
      'long': long,
    };
  }
}
