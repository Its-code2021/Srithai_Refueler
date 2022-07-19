// ignore_for_file: prefer_const_constructors

import 'package:cpac/controller/qr_code.dart';
import 'package:cpac/view/driver/loading_page.dart';
import 'package:cpac/view/driver/staff_draw_user.dart';
import 'package:cpac/view/driver/tabel_all.dart';

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
            if (QrCode['oil_gen'] == 0) {
              PostOilConfrim_ADD(context, Qr_confrim);
            } else {
              PostOilConfrim_ADD_GEN(context, Qr_confrim);
            }
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '*หมายเหตุ: กรุณาตรวจสอบทะเบียนรถ ให้ตรงกันกับทะเบียนรถที่ระบุในคูปอง',
                style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ),
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
