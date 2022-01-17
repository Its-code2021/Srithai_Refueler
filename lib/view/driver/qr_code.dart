// ignore_for_file: prefer_const_constructors

import 'package:cpac/view/driver/tabel_all.dart';
import 'package:flutter/material.dart';

class Qr_code extends StatefulWidget {
  Qr_code({Key? key}) : super(key: key);

  @override
  _Qr_codeState createState() => _Qr_codeState();
}

class _Qr_codeState extends State<Qr_code> {
  Widget Csonfirm_Oil() {
    return Container(
      width: double.infinity,
      height: 50,
      padding: EdgeInsets.symmetric(horizontal: 80),
      child: ElevatedButton(
          onPressed: () {
            print('ยืนยัน');
          },
          child: Text(
            'ยืนยัน',
            style: TextStyle(fontSize: 20),
          )),
    );
  }

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
                'สรุปรายละเอียด คูปอง : SRT21120001 ',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            Container(
              height: 10,
            ),
            Tabel_Detailed_Summary(),
            Container(
              height: 10,
            ),
            Csonfirm_Oil()
          ],
        ),
      ),
    );
  }
}
