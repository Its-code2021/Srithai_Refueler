// ignore_for_file: prefer_const_constructors

import 'package:cpac/view/driver/tabel_all.dart';

import 'package:flutter/material.dart';

class Coupon_Detail extends StatefulWidget {
  Coupon_Detail({Key? key}) : super(key: key);

  @override
  _Coupon_DetailState createState() => _Coupon_DetailState();
}

class _Coupon_DetailState extends State<Coupon_Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('images/002.png', fit: BoxFit.cover),
        centerTitle: true,
        backgroundColor: Color(0xff438EB9),
      ),
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
                'รายละเอียด คูปอง',
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
            Tabel_Coupon_detail(),
          ],
        ),
      ),

      // This trailing comma makes auto-formatting nicer f
    );
  }
}
