import 'package:absen_lite/theme.dart';
import 'package:flutter/material.dart';

class GuidePermissionTable extends StatelessWidget {
  const GuidePermissionTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Table(
        columnWidths: {0: FlexColumnWidth(1), 1: FlexColumnWidth(19)},
        children: [
          TableRow(children: [
            Text(
              '1.',
              style: trueBlackTextStyle.copyWith(fontWeight: bold),
            ),
            Text('klik logo izin pada beranda',
                style: trueBlackTextStyle.copyWith(fontWeight: bold))
          ]),
          TableRow(children: [
            Text('2.', style: trueBlackTextStyle.copyWith(fontWeight: bold)),
            Text('pilih ajukan Izin untuk memilih jenis Izin absen tersebut',
                style: trueBlackTextStyle.copyWith(fontWeight: bold)),
          ]),
          TableRow(children: [
            Text('3.', style: trueBlackTextStyle.copyWith(fontWeight: bold)),
            Text(
                'Masukan alasan di dalam kotak opsi MASUKAN PESAN untuk alasan libur kantor',
                style: trueBlackTextStyle.copyWith(fontWeight: bold))
          ]),
          TableRow(children: [
            Text('4.', style: trueBlackTextStyle.copyWith(fontWeight: bold)),
            Text(
                'Pilih Periode libur sesuai dengan waktu yang sudah disepakati',
                style: trueBlackTextStyle.copyWith(fontWeight: bold))
          ]),
          TableRow(children: [
            Text('5.', style: trueBlackTextStyle.copyWith(fontWeight: bold)),
            Text('Tambahkan bukti Izin jika diperlukan',
                style: trueBlackTextStyle.copyWith(fontWeight: bold))
          ]),
          TableRow(children: [
            Text('6.', style: trueBlackTextStyle.copyWith(fontWeight: bold)),
            Text(
                'Klik SUBMIT maka izin akan diproses dan tinggal menunggu persetujuan dari Admin',
                style: trueBlackTextStyle.copyWith(fontWeight: bold))
          ]),
        ],
      ),
    );
  }
}
