import 'package:absen_lite/theme.dart';
import 'package:flutter/material.dart';

class GuidePermissionTable extends StatelessWidget {
  const GuidePermissionTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10),
        child: Table(columnWidths: const {
          0: FlexColumnWidth(1),
          1: FlexColumnWidth(19)
        }, children: [
          TableRow(children: [
            Text(
              '1.',
              style: trueBlackTextStyle.copyWith(fontWeight: bold),
            ),
            Text('Pilih icon attendance pada menu Home.',
                style: trueBlackTextStyle.copyWith(fontWeight: bold))
          ]),
          TableRow(children: [
            Text('2.', style: trueBlackTextStyle.copyWith(fontWeight: bold)),
            Text(
              'klik tombol yang bertuliskan clock in pada saat masuk dan clock out saat pulang lalu klik yes.',
              style: trueBlackTextStyle.copyWith(fontWeight: bold),
              textAlign: TextAlign.justify,
            ),
          ]),
          TableRow(
            children: [
              Text('3.', style: trueBlackTextStyle.copyWith(fontWeight: bold)),
              Text('Lalu klik yes.',
                  style: trueBlackTextStyle.copyWith(fontWeight: bold))
              // ]),
              // TableRow(children: [
              //   Text('4.', style: trueBlackTextStyle.copyWith(fontWeight: bold)),
              //   Text(
              //       'Pilih Periode libur sesuai dengan waktu yang sudah disepakati',
              //       style: trueBlackTextStyle.copyWith(fontWeight: bold))
              // ]),
              // TableRow(children: [
              //   Text('5.', style: trueBlackTextStyle.copyWith(fontWeight: bold)),
              //   Text('Tambahkan bukti Izin jika diperlukan',
              //       style: trueBlackTextStyle.copyWith(fontWeight: bold))
              // ]),
              // TableRow(children: [
              //   Text('6.', style: trueBlackTextStyle.copyWith(fontWeight: bold)),
              //   Text(
              //       'Klik SUBMIT maka izin akan diproses dan tinggal menunggu persetujuan dari Admin',
              //       style: trueBlackTextStyle.copyWith(fontWeight: bold))
              // ]),
            ],
          ),
        ]));
  }
}
