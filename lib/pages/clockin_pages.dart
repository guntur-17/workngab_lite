import 'package:absen_lite/pages/attendance_history_pages.dart';
import 'package:absen_lite/pages/home.dart';
import 'package:absen_lite/providers/attendance_provider.dart';
import 'package:absen_lite/providers/auth_provider.dart';
import 'package:absen_lite/widgets/loading_button.dart';
import 'package:flutter/material.dart';
import 'package:absen_lite/theme.dart';
import 'package:absen_lite/widgets/hour_card.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
// import 'package:intl/intl_browser.dart';
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
  // dynamic date = DateFormat.yMMMMEEEEd('id_ID').format(DateTime.now());

  String currentAddress = 'My Address';
  Position? currentposition;
  bool isLoading = false;

  void initState() {
    super.initState();
    img = imgIn;
    _determinePosition();
    initializeDateFormatting();
    checkhasil();
    dateFormat = new DateFormat.yMMMMd('id_ID');
    timeFormat = new DateFormat.Hms('id_ID');
  }

  Future checkhasil() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? clockIn = prefs.getBool('checkClock');
    // AttedanceProvider().checkConditionClock = clockIn as bool;
    if (clockIn == null) {
      clockIn = true;
    }
    // print(AttedanceProvider().checkConditionClock);
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
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    AttedanceProvider attedanceProvider =
        Provider.of<AttedanceProvider>(context);
    // bool _isClockIn = false;

    _attendance() async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      bool? clockIn = await prefs.getBool('checkClock');
      print('ini clockin attend ' + clockIn.toString());
      if (clockIn == null) {
        clockIn = true;
      }
      _isClockIn = clockIn as bool;
      if (_isClockIn == true) {
        _isClockIn = false;
      } else {
        _isClockIn = true;
      }

      print('ini isclockin ' + _isClockIn.toString());
      prefs.setBool('checkClock', _isClockIn as bool);
    }

    handleCheckin() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');
      _attendance();
      Navigator.pop(context);
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => HomePage()));
      // if (await attedanceProvider.attendanceIn(
      //   token,
      //   currentTime,
      //   currentposition!.latitude,
      //   currentposition!.longitude,
      // )) {
      //   _isClockIn = true;
      //   Navigator.push(
      //       context, MaterialPageRoute(builder: (context) => HomePage()));
      // }
    }

    handleCheckout() async {
      _attendance();
      Navigator.pop(context);
    }

    Widget day() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Center(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '${currentTime}',
                  style: trueBlackTextStyle.copyWith(
                      fontSize: 28, fontWeight: semiBold),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  // 'Senin, 12 Maret 2021 ${}',
                  '${DateFormat.yMMMMEEEEd('id_ID').format(DateTime.now())}',

                  style:
                      greyTextStyle.copyWith(fontSize: 18, fontWeight: reguler),
                )
              ],
            ),
          ),
        ),
      );
    }

    Widget tap() {
      return InkWell(
        onTap: () {
          check() async {
            final SharedPreferences prefs =
                await SharedPreferences.getInstance();
            bool? clockIn = prefs.getBool('checkClock');
            if (clockIn == null) {
              clockIn = true;
            }
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

          // if (_isClockIn == true) {
          //   _isClockIn = false;
          // } else {
          //   _isClockIn = true;
          // }
          // print(_isClockIn);
          // setState(() {});
          // clockIn == false?
          //     ? handleCheckin()
          //     : handleCheckout();
        },
        child: Container(
          margin: EdgeInsets.only(top: 30),
          child: Column(
            children: [
              Center(child: img),
            ],
          ),
        ),
      );
    }

    // Widget tap() {
    //   return Container(
    //     margin: EdgeInsets.only(top: 30),
    //     child: Column(
    //       children: [
    //         Center(
    //           child: IconButton(
    //             icon: Image.asset(
    //                 (attedanceProvider.checkConditionClock == true)
    //                     ? 'assets/clockIn.png'
    //                     : 'assets/clockOut.png'),
    //             iconSize: 160,
    //             onPressed: () {
    //               (attedanceProvider.checkConditionClock == true)
    //                   ? handleCheckin()
    //                   : handleCheckout();
    //               // setState(() {
    //               //   _isClockIn = !_isClockIn;
    //               // });
    //             },
    //           ),
    //         ),
    //       ],
    //     ),
    //   );
    // }

    Widget location() {
      return RelativeBuilder(builder: (context, height, width, sy, sx) {
        return Column(
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 27),
                width: MediaQuery.of(context).size.width * 0.75,
                height: MediaQuery.of(context).size.width * 0.20,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: lightgreyColor),
                //isi dari kotak berupa location
                child: Container(
                  margin: EdgeInsets.all(5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.location_on_outlined),
                          Expanded(
                            child: InkWell(
                              child: Text(
                                currentAddress,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: trueBlackTextStyle.copyWith(
                                    fontSize: 12, fontWeight: medium),
                              ),

                              // onTap: () {
                              //   _determinePosition();
                              // },
                            ),
                          ),
                        ],
                      ),
                      // TextButton(
                      //   onPressed: () {
                      //     _determinePosition();
                      //   },
                      //   child: Text('locate me'),
                      // )
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      });
    }

    Widget clock() {
      return Column(
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 40),
              width: MediaQuery.of(context).size.width * 0.8,
              height: 95,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HourCard(),
                  ClockOut(),
                  FullHour(),
                ],
              ),
            ),
          ),
        ],
      );
    }

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.0),
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
            iconTheme: IconThemeData(color: Colors.black),
            centerTitle: true,
            backgroundColor: Colors.white,
            bottomOpacity: 0.0,
            elevation: 0.0,
            title: Text(
              'Attendance',
              style: TextStyle(color: Colors.black),
            ),
            actions: <Widget>[
              Container(
                child: Image(image: AssetImage('assets/rounded.png')),
              ),
            ],
          ),
        ),
        backgroundColor: whiteColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              day(),
              tap(),
              isLoading ? Loadinglocation() : location(),
              clock(),
            ],
          ),
        ),
      ),
    );
  }
}
