import 'package:cpac/view/gas_station/gas_tabel_all.dart';
import 'package:flutter/material.dart';

class Gas_History_Detail extends StatefulWidget {
  Gas_History_Detail({Key? key}) : super(key: key);

  @override
  _Gas_History_DetailState createState() => _Gas_History_DetailState();
}

class _Gas_History_DetailState extends State<Gas_History_Detail> {
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
            // ignore: prefer_const_constructors
            child: Text(
              'ดูรายละเอียดประวัติการเติมน้ำมัน',
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          Container(
            height: 10,
          ),
          Tabel_Gas_History_Detail()
        ],
      )),
    );
  }
}
