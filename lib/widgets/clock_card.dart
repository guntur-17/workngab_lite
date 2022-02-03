import 'package:absen_lite/models/attendance_model.dart';
import 'package:absen_lite/theme.dart';
import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';

class ClockOutCard extends StatelessWidget {
  // const ClockOutCard({Key? key}) : super(key: key);

  final AttendanceModel attendance;
  const ClockOutCard(this.attendance, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var date = DateTime.parse(attendance.createdAt.toString());
    var formattedDate = "${date.day}-${date.month}-${date.year}";

    // print(formattedDate);
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return TextButton(
          style: TextButton.styleFrom(alignment: Alignment.centerRight),
          onPressed: () => showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              title: Center(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/clockOutsmol.png',
                          width: sx(60),
                          height: sx(60),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          'Clock ${attendance.type}',
                          style: trueBlackTextStyle.copyWith(
                              fontSize: 22, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/minicalendar.png',
                            height: sx(14),
                            width: sx(14),
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Text(
                            'Senin, $formattedDate',
                            style: trueBlackTextStyle.copyWith(
                                fontSize: 18, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/clockblack.png',
                                height: sx(14),
                                width: sx(14),
                              ),
                              const SizedBox(
                                width: 3,
                              ),
                              Text('${attendance.time} WIB',
                                  style: trueBlackTextStyle.copyWith(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400)),
                            ],
                          ),
                          Text(
                            'SUCCESS',
                            style: greenTextStyle.copyWith(
                                fontSize: 18, fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: sy(40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      attendance.type == "Out"
                          ? 'assets/clockOutbox.png'
                          : 'assets/clockInbox.png',

                      // 'assets/clockOutbox.png',
                      width: sy(40),
                      height: sy(40),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Clock ${attendance.type}',
                          style: trueBlackTextStyle.copyWith(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          '$formattedDate (${attendance.time})',
                          style: trueBlackTextStyle.copyWith(
                              fontSize: 14, fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ],
                ),
                Image.asset(
                  'assets/rightButton.png',
                  width: sx(20),
                  height: sx(20),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// class ClockInCard extends StatelessWidget {
//   // const ClockInCard({Key? key}) : super(key: key);

//   final AttendanceModel attendance;
//   ClockInCard(this.attendance);

//   @override
//   Widget build(BuildContext context) {
//     return RelativeBuilder(
//       builder: (context, height, width, sy, sx) {
//         return TextButton(
//           style: TextButton.styleFrom(
//               // backgroundColor: blueColor,
//               ),
//           onPressed: () => showDialog<String>(
//             context: context,
//             builder: (BuildContext context) => AlertDialog(
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(20)),
//               title: Center(
//                 child: Container(
//                   child: Column(
//                     children: [
//                       Container(
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Image.asset('assets/clockInsmol.png',
//                                 width: sx(60), height: sx(60)),
//                             SizedBox(
//                               width: 3,
//                             ),
//                             Text(
//                               'Clock ' + attendance.type.toString(),
//                               style: trueBlackTextStyle.copyWith(
//                                   fontSize: 22, fontWeight: FontWeight.w500),
//                             )
//                           ],
//                         ),
//                       ),
//                       Container(
//                         child: Padding(
//                           padding: EdgeInsets.only(top: 10),
//                           child: Row(
//                             children: [
//                               Image.asset('assets/minicalendar.png',
//                                   height: sx(14), width: sx(14)),
//                               SizedBox(
//                                 width: 3,
//                               ),
//                               Expanded(
//                                 child: Text(
//                                   attendance.createdAt.toString(),
//                                   style: trueBlackTextStyle.copyWith(
//                                     fontSize: 18,
//                                     fontWeight: FontWeight.w400,
//                                   ),
//                                   textAlign: TextAlign.center,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       Container(
//                         child: Padding(
//                           padding: EdgeInsets.only(top: 10),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Row(
//                                 children: [
//                                   Image.asset(
//                                     'assets/clockblack.png',
//                                     height: sx(14),
//                                     width: sx(14),
//                                   ),
//                                   SizedBox(
//                                     width: 3,
//                                   ),
//                                   Text(
//                                     '${attendance.time} WIB',
//                                     style: trueBlackTextStyle.copyWith(
//                                         fontSize: 18,
//                                         fontWeight: FontWeight.w400),
//                                   ),
//                                 ],
//                               ),
//                               Text(
//                                 'SUCCESS',
//                                 style: greenTextStyle.copyWith(
//                                     fontSize: 18, fontWeight: FontWeight.w400),
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           child: Container(
//             width: sx(430),
//             height: sy(40),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                   children: [
//                     Image.asset(
//                       'assets/clockInbox.png',
//                       width: sy(40),
//                       height: sy(40),
//                     ),
//                     SizedBox(
//                       width: 16,
//                     ),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         Text('Clock In',
//                             style: trueBlackTextStyle.copyWith(
//                                 fontSize: 18, fontWeight: FontWeight.w500)),
//                         Text('12-8-2021 (19:30)',
//                             style: trueBlackTextStyle.copyWith(
//                                 fontSize: 14, fontWeight: FontWeight.w300)),
//                       ],
//                     ),
//                   ],
//                 ),
//                 Image.asset(
//                   'assets/rightButton.png',
//                   width: sx(20),
//                   height: sx(20),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
