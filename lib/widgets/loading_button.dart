import 'package:flutter/material.dart';
import 'package:absen_lite/theme.dart';

class LoadingButton extends StatelessWidget {
  const LoadingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        // margin: EdgeInsets.only(top: 590),
        width: 315,
        height: 57,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: blueColor),
        child: InkWell(
          onTap: () {},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(
                      strokeWidth: 3,
                      valueColor: AlwaysStoppedAnimation(whiteColor),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Loading',
                    style: whiteTextStyle.copyWith(
                        fontSize: 20, fontWeight: medium),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Loadinglocation extends StatelessWidget {
  const Loadinglocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            margin: const EdgeInsets.only(top: 27),
            width: MediaQuery.of(context).size.width * 0.6,
            height: MediaQuery.of(context).size.width * 0.20,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: lightgreyColor),
            //isi dari kotak berupa location
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(
                        strokeWidth: 3,
                        valueColor: AlwaysStoppedAnimation(whiteColor),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Loading',
                      style: whiteTextStyle.copyWith(
                          fontSize: 20, fontWeight: medium),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class Loadinglocation2 extends StatelessWidget {
  const Loadinglocation2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            margin: const EdgeInsets.only(top: 27),
            // width: MediaQuery.of(context).size.width * 0.6,
            height: MediaQuery.of(context).size.width * 0.10,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: lightgreyColor),
            //isi dari kotak berupa location
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(
                        strokeWidth: 3,
                        valueColor: AlwaysStoppedAnimation(whiteColor),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Loading',
                      style: whiteTextStyle.copyWith(
                          fontSize: 20, fontWeight: medium),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class LoadingDefault extends StatelessWidget {
  const LoadingDefault({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 18,
      height: 18,
      child: CircularProgressIndicator(
        strokeWidth: 3,
        valueColor: AlwaysStoppedAnimation(blueColor),
      ),
    );
  }
}

class LoadingClockCard extends StatelessWidget {
  const LoadingClockCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            margin: const EdgeInsets.only(top: 27),
            width: MediaQuery.of(context).size.width * 0.6,
            height: MediaQuery.of(context).size.width * 0.20,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: lightgreyColor),
            //isi dari kotak berupa location
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(
                        strokeWidth: 3,
                        valueColor: AlwaysStoppedAnimation(whiteColor),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Loading',
                      style: whiteTextStyle.copyWith(
                          fontSize: 20, fontWeight: medium),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
