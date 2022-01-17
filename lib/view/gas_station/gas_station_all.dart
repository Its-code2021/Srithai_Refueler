// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new

import 'package:cpac/view/gas_station/gas_tabel_all.dart';
import 'package:flutter/material.dart';

class Gas_Station_All extends StatefulWidget {
  Gas_Station_All({Key? key}) : super(key: key);

  @override
  _Gas_Station_AllState createState() => _Gas_Station_AllState();
}

class _Gas_Station_AllState extends State<Gas_Station_All> {
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
                'รายการ DP ที่รอเติมน้ำมัน',
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
            TabelGas_Header_DpOil(),
            TabelGas_Header_DpOil_Body(context),
            Container(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
