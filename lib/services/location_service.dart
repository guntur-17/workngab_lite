import 'dart:async';
import '../geolocation_class/geolocation_class.dart';
import 'package:location/location.dart';

class LocationService {
  //alternatif 1: dinamis, otomatis berubah ketika posisi berubah
  //inisialisasi memulai mengaktifkan service lokasi
  LocationService() {
    Location location = Location();
    location.requestPermission().then((granted) {
      if (granted == PermissionStatus.granted) {
        location.onLocationChanged.listen((dataLokasi) {
          _locationController
              .add(GeoLocation.createUserPointLocationData(dataLokasi));
        });
      }
    });
  }
  //update lokasi (lewat stream)
  StreamController<GeoLocation> _locationController =
      StreamController<GeoLocation>();
  Stream<GeoLocation> get locationStream => _locationController.stream;

  //alternatif 2: statis, hanya menampilkan ketika getLocation dipanggil
  Future<GeoLocation?> getLocation() async {
    Location location = Location();
    GeoLocation? _currentLocation;
    try {
      var userLocation = await location.getLocation();
      _currentLocation = GeoLocation.createUserPointLocationData(userLocation);
    } on Exception catch (e) {
      print('Gagal ambil lokasi: ${e.toString()}');
    }
    return _currentLocation;
  }
}
