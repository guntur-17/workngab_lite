import 'package:absen_lite/geolocation_class/geolocation_class.dart';
import 'package:absen_lite/pages/splash_pages.dart';
import 'package:absen_lite/providers/attendance_provider.dart';
import 'package:absen_lite/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'geolocation_class/geolocation_class.dart';
import 'package:absen_lite/services/location_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<GeoLocation>(
          initialData: GeoLocation.createZeroUserPoint(),
          //baca lokasi pada saat pertama kali
          create: (context) => LocationService().locationStream,
        ),
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => AttedanceProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashPage(),
      ),
    );
  }
}
