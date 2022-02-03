import 'package:absen_lite/pages/home.dart';
import 'package:absen_lite/providers/attendance_provider.dart';

import 'package:absen_lite/widgets/loading_button.dart';
import 'package:flutter/material.dart';
import 'package:absen_lite/theme.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';

import 'package:relative_scale/relative_scale.dart';
import 'package:geocoding/geocoding.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ClockInPage extends StatefulWidget {
  const ClockInPage({Key? key}) : super(key: key);

  @override
  _ClockInPageState createState() => _ClockInPageState();
}

class _ClockInPageState extends State<ClockInPage> {
  late Image img;
  Image imgIn = Image.asset('assets/clockIn.png', width: 160, height: 160);
  Image imgOut = Image.asset('assets/clockOut.png', width: 160, height: 160);

  bool _isClockIn = true;
  DateFormat? dateFormat;
  DateFormat? timeFormat;

  dynamic currentTime = DateFormat.Hm().format(DateTime.now());

  String currentAddress = 'My Address';
  Position? currentposition;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    img = imgIn;
    _determinePosition();
    initializeDateFormatting();
    checkhasil();
    dateFormat = DateFormat.yMMMMd('id_ID');
    timeFormat = DateFormat.Hms('id_ID');
  }

  Future checkhasil() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? clockIn = prefs.getBool('checkClock');

    clockIn ??= true;

    print('ini clockin hasil ' + clockIn.toString());

    if (clockIn == true) {
      img = imgIn;
    } else {
      img = imgOut;
    }
  }

  Future<Position?> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    setState(() {
      isLoading = true;
    });

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Fluttertoast.showToast(msg: 'Please Keep your location on.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Fluttertoast.showToast(msg: 'Location Permission is denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      Fluttertoast.showToast(msg: 'Permission is denied Forever');
    }
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark place = placemarks[0];
      setState(() {
        currentposition = position;
        currentAddress =
            " ${place.street}, ${place.subLocality}, ${place.locality}, ${place.subAdministrativeArea}, ${place.administrativeArea} ${place.postalCode}";
        setState(() {
          isLoading = false;
        });
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    AttedanceProvider attedanceProvider =
        Provider.of<AttedanceProvider>(context);

    _attendance() async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      bool? clockIn = prefs.getBool('checkClock');
      print('ini clockin attend ' + clockIn.toString());
      clockIn ??= true;
      _isClockIn = clockIn;
      if (_isClockIn == true) {
        _isClockIn = false;
      } else {
        _isClockIn = true;
      }

      print('ini isclockin ' + _isClockIn.toString());
      prefs.setBool('checkClock', _isClockIn);
    }

    handleCheckin() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');
      _attendance();

      if (await attedanceProvider.attendanceIn(
        token,
        currentTime,
        currentposition!.latitude,
        currentposition!.longitude,
      )) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
      }
    }

    handleCheckout() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');
      _attendance();
      if (await attedanceProvider.attendanceOut(
        token,
        currentTime,
        currentposition!.latitude,
        currentposition!.longitude,
      )) {
        // _isClockIn = true;
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
      }
    }

    Widget day() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '$currentTime',
                style: trueBlackTextStyle.copyWith(
                    fontSize: 28, fontWeight: semiBold),
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                DateFormat.yMMMMEEEEd('id_ID').format(DateTime.now()),
                style:
                    greyTextStyle.copyWith(fontSize: 18, fontWeight: reguler),
              )
            ],
          ),
        ),
      );
    }

    Widget tap() {
      return TextButton(
        onPressed: () => showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(color: blueShadow, width: 4)),
            title: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Image.asset('assets/warning.png', width: 46, height: 46)
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: Text('Are you sure to do it now?',
                        style: trueBlackTextStyle.copyWith(
                            fontSize: 16, fontWeight: semiBold)),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      width: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: blueShadow),
                      child: Center(
                        child: Wrap(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(3),
                              child: Text(
                                'NO',
                                style: whiteTextStyle.copyWith(
                                    fontSize: 14, fontWeight: medium),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      check() async {
                        final SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        bool? clockIn = prefs.getBool('checkClock');
                        clockIn ??= true;
                        print(clockIn);
                        if (clockIn == true) {
                          handleCheckin();
                        } else {
                          handleCheckout();
                        }
                      }

                      setState(() {
                        check();
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      width: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: whiteColor,
                        boxShadow: [
                          BoxShadow(
                            color: blueShadow.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 4,
                            offset: const Offset(
                                0, 2), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Center(
                        child: Wrap(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(3),
                              child: Text(
                                'YES',
                                style: blueTextStyle.copyWith(
                                    fontSize: 14, fontWeight: medium),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        child: Container(
          margin: const EdgeInsets.only(top: 30),
          child: Column(
            children: [
              Center(child: img),
            ],
          ),
        ),
      );
    }

    Widget location() {
      return RelativeBuilder(builder: (context, height, width, sy, sx) {
        return Column(
          children: [
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 27),
                width: MediaQuery.of(context).size.width * 0.75,
                height: MediaQuery.of(context).size.width * 0.20,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: lightgreyColor),
                //isi dari kotak berupa location
                child: Container(
                  margin: const EdgeInsets.all(5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.location_on_outlined),
                          Expanded(
                            child: InkWell(
                              child: Text(
                                currentAddress,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: trueBlackTextStyle.copyWith(
                                    fontSize: 12, fontWeight: medium),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      });
    }

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80.0),
          child: AppBar(
            toolbarHeight: 120,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: trueBlack,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            iconTheme: const IconThemeData(color: Colors.black),
            centerTitle: true,
            backgroundColor: Colors.white,
            bottomOpacity: 0.0,
            elevation: 0.0,
            title: const Text(
              'Attendance',
              style: TextStyle(color: Colors.black),
            ),
            actions: const <Widget>[
              Image(image: AssetImage('assets/rounded.png')),
            ],
          ),
        ),
        backgroundColor: whiteColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              day(),
              tap(),
              isLoading ? const Loadinglocation() : location(),
              // clock(),
            ],
          ),
        ),
      ),
    );
  }
}
