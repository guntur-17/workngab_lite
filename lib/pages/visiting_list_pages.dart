import 'package:absen_lite/providers/visiting_all_provider.dart';

import 'package:absen_lite/widgets/visiting_card.dart';
import 'package:flutter/material.dart';
import 'package:absen_lite/theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VisitingListPage extends StatefulWidget {
  const VisitingListPage({Key? key}) : super(key: key);

  @override
  State<VisitingListPage> createState() => _VisitingListPageState();
}

class _VisitingListPageState extends State<VisitingListPage> {
  @override
  void initState() {
    getvisiting();
    super.initState();
  }

  getvisiting() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    await Provider.of<VisitingAllProvider>(context, listen: false)
        .getAllVisit(token);
  }

  @override
  Widget build(BuildContext context) {
    VisitingAllProvider visitingAllProvider =
        Provider.of<VisitingAllProvider>(context);
    Widget card() {
      return Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.95,
          child: SingleChildScrollView(
            child: Center(
              child: Container(
                margin: const EdgeInsets.only(bottom: 20),
                width: MediaQuery.of(context).size.width * 0.90,
                child: Column(
                  children: visitingAllProvider.showAll.reversed
                      .map((visiting) => VisitingCard(visiting))
                      .toList(),
                ),
              ),
            ),
          ),
        ),
      );
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
            title: Text(
              'Visiting List',
              style: trueBlackTextStyle.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
        ),
        backgroundColor: whiteColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              card(),
            ],
          ),
        ),
      ),
    );
  }
}
