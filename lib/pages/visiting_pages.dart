import 'dart:io';
import 'package:absen_lite/pages/camera_pages.dart';
import 'package:absen_lite/pages/shop_list_pages.dart';
import 'package:absen_lite/providers/auth_provider.dart';
import 'package:absen_lite/providers/shop_provider.dart';
// import 'package:absen_lite/providers/visiting_all_provider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:absen_lite/pages/qr_scan_pages.dart';
import 'package:absen_lite/pages/stock_list_pages.dart';
import 'package:flutter/material.dart';
import 'package:absen_lite/theme.dart';
import 'package:absen_lite/widgets/shop_card.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:relative_scale/relative_scale.dart';

class VisitingPage extends StatefulWidget {
  // const VisitingPage({Key? key}) : super(key: key);

  static const String _title = 'Visiting';

  @override
  State<VisitingPage> createState() => _VisitingPageState();
}

class _VisitingPageState extends State<VisitingPage> {
  // bool _isClockIn = false;
  DateFormat? dateFormat;
  DateFormat? timeFormat;
  File? image;

  dynamic currentTime = DateFormat.Hm().format(DateTime.now());
  String currentAddress = 'My Address';

  Position? currentposition;

  bool isLoading = false;

  void initState() {
    super.initState();
    _determinePosition();
    initializeDateFormatting();
    dateFormat = new DateFormat.yMMMMd('id_ID');
    timeFormat = new DateFormat.Hms('id_ID');
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

  String? _result;
  File? _picker;

  @override
  Widget build(BuildContext context) {
    ShopProvider shopProvider =
        Provider.of<ShopProvider>(context, listen: false);
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    // VisitingAllProvider visitingAllProvider =
    // Provider.of<VisitingAllProvider>(context, listen: false);
    Widget day() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Center(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '07:30',
                  style: trueBlackTextStyle.copyWith(
                      fontSize: 28, fontWeight: semiBold),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  'Senin, 12 Maret 2021',
                  style:
                      greyTextStyle.copyWith(fontSize: 18, fontWeight: reguler),
                )
              ],
            ),
          ),
        ),
      );
    }

    Future _openScanner(BuildContext context) async {
      double lat = currentposition!.latitude;
      double long = currentposition!.longitude;
      final result = await Navigator.push(
          context, MaterialPageRoute(builder: (c) => Scanner(lat, long)));
      _result = result;
    }

    Future _getPhoto(BuildContext context) async {
      // double lat = currentposition!.latitude;
      // double long = currentposition!.longitude;
      final picker = await Navigator.push(
          context, MaterialPageRoute(builder: (c) => ShopListPage()));
      _picker = picker;
    }

    // Future getPhoto() async {
    //   final ImagePicker _picker = ImagePicker();

    //   // Capture a photo
    //   final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    //   //mengubah Xfile jadi file
    //   image = File(photo!.path);

    //   setState(() {});
    // }

    Widget tap() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {
              _openScanner(context);
            },
            child: Container(
              margin: EdgeInsets.only(top: 30),
              child: Column(
                children: [
                  Center(
                    child: Image.asset(
                      'assets/scan.png',
                      width: 80,
                      height: 80,
                    ),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              //  attedanceProvider
              //           .getAttendances(authProvider.user.access_token);
              shopProvider.getShops(authProvider.user.access_token);
              _getPhoto(context);
            },
            child: Container(
              margin: EdgeInsets.only(top: 30),
              child: Column(
                children: [
                  Center(
                    child: Image.asset(
                      'assets/scan.png',
                      width: 80,
                      height: 80,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    }

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
                          // Text('latitude = ' +
                          //     currentposition!.latitude.toString()),
                          // Text('Longitude = ' +
                          //     currentposition!.longitude.toString()),
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

    Widget history() {
      return Container(
        width: MediaQuery.of(context).size.width * 0.91,
        margin: EdgeInsets.only(top: 40, bottom: 10, left: 20, right: 20),
        // height: 195,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('History',
                    style: trueBlackTextStyle.copyWith(
                        fontSize: 16, fontWeight: FontWeight.w600)),
              ],
            ),
            Divider(
              thickness: 1,
              height: 20,
            ),
            Column(
                // children: visitingAllProvider.showAll
                // .map((showAll) => ShopCard(showAll))
                // .toList(),
                ),
          ],
        ),
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
              'Visiting',
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
        body: Column(
          children: [day(), tap(), location(), history()],
        ),
      ),
    );
  }
}
