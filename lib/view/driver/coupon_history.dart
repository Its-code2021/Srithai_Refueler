// ignore_for_file: prefer_const_constructors

import 'package:cpac/view/driver/tabel_all.dart';
import 'package:flutter/material.dart';

class Coupon_History extends StatefulWidget {
  Coupon_History({Key? key}) : super(key: key);

  @override
  _Coupon_HistoryState createState() => _Coupon_HistoryState();
}

class _Coupon_HistoryState extends State<Coupon_History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: 10,
          ),
          Container(
            width: double.infinity,
            height: 60,
            alignment: Alignment.center,
            color: Color(0xff438EB9),
            child: Text(
              'ประวัติการเติมน้ำมัน',
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
          Tabel_Header_Coupon_History(),
          Tabel_Body_Coupon_History(context),
        ]),
      ),
    );
  }
}
