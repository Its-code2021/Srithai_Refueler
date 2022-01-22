// ignore_for_file: prefer_const_constructors

import 'package:cpac/controller/qr_code.dart';
import 'package:cpac/view/driver/loading_page.dart';
import 'package:cpac/view/driver/staff_draw_user.dart';
import 'package:cpac/view/driver/tabel_all.dart';
import 'package:cpac/view/gas_station/gas_draw_user.dart';
import 'package:cpac/view/gas_station/gas_summary.dart';
import 'package:cpac/view/gas_station/gas_tabel_all.dart';

import 'package:flutter/material.dart';

class Refueling_All extends StatefulWidget {
  Refueling_All({Key? key}) : super(key: key);

  @override
  _Refueling_AllState createState() => _Refueling_AllState();
}

class _Refueling_AllState extends State<Refueling_All> {
  Widget Add_Oil() {
    return Container(
      width: 200,
      height: 50,
      alignment: Alignment.bottomCenter,
      child: Align(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Color(0xff438EB9),
              minimumSize: Size.fromHeight(
                50,
              ),
              // fromHeight use double.infinity as width and 40 is the height
              elevation: 5),
          child: Text(
            'เติมน้ำมัน',
            style: TextStyle(fontSize: 20),
          ),
          onPressed: () {
            var Qr_confrim = QrCode['qr_code'];

            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => Loading_pang_Detail()),
                (Route<dynamic> route) => false);
            PostOilConfrim_ADD(Qr_confrim);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 10,
            ),
            Container(
              width: double.infinity,
              height: 60,
              alignment: Alignment.center,
              color: Color(0xff438EB9),
              child: Text(
                'รายละเอียดการเติมน้ำมัน',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            Container(
              height: 10,
            ),
            Tabel_Staff_detail(),
            Container(
              height: 20,
            ),
            Add_Oil(),
          ],
        ),
      ),
    );
  }
}
