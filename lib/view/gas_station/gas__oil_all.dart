// ignore_for_file: prefer_const_constructors

import 'package:cpac/controller/gas_qr_code.dart';
import 'package:cpac/view/driver/loading_page.dart';
import 'package:cpac/view/driver/staff_draw_user.dart';
import 'package:cpac/view/driver/tabel_all.dart';
import 'package:cpac/view/gas_station/gas_tabel_all.dart';

import 'package:flutter/material.dart';

import 'gas_loading_page.dart';

class Gas_Oil_All extends StatefulWidget {
  Gas_Oil_All({Key? key}) : super(key: key);

  @override
  _Gas_Oil_AllState createState() => _Gas_Oil_AllState();
}

class _Gas_Oil_AllState extends State<Gas_Oil_All> {
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

            GetBilDetail_Gas(OilDetail_id);
            PostOilConfrimGas_ADD(context, Qr_confrim);
            print(Qr_confrim);
            print(GetBilDetail_Gas(OilDetail_id));
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
            Tabel_Gas_detail(),
            Container(
              height: 10,
            ),
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
