// ignore_for_file: prefer_const_constructors

import 'package:cpac/view/driver/tabel_all.dart';
import 'package:cpac/view/gas_station/gas_draw_user.dart';
import 'package:cpac/view/gas_station/gas_summary.dart';
import 'package:cpac/view/gas_station/gas_tabel_all.dart';

import 'package:flutter/material.dart';

class Gas_Detail extends StatefulWidget {
  Gas_Detail({Key? key}) : super(key: key);

  @override
  _Gas_DetailState createState() => _Gas_DetailState();
}

class _Gas_DetailState extends State<Gas_Detail> {
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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ExamplePage()),
            );
            print('เติมน้ำมัน');
          },
        ),
      ),
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
              height: 20,
            ),
            Add_Oil(),
          ],
        ),
      ),

      // This trailing comma makes auto-formatting nicer f
    );
  }
}
