// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:cpac/utility/my_alert.dart';
import 'package:cpac/view/gas_station/gas_done.dart';
import 'package:cpac/view/gas_station/gas_history.dart';
import 'package:cpac/view/gas_station/gas_tabel_all.dart';
import 'package:cpac/view/gas_station/tabbar_Gas.dart';
import 'package:flutter/material.dart';

class Gas_Summary extends StatefulWidget {
  Gas_Summary({Key? key}) : super(key: key);

  @override
  _Gas_SummaryState createState() => _Gas_SummaryState();
}

showAlertDialog(BuildContext context) {
  // set up the buttons
  Widget cancelButton = ElevatedButton(
    style: ElevatedButton.styleFrom(
      primary: Colors.red,
      elevation: 5,
    ),
    child: const Text("ยกเลิก"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  Widget continueButton = ElevatedButton(
    style: ElevatedButton.styleFrom(
      primary: Colors.blue[900],
      elevation: 5,
    ),
    child: const Text("ยืนยัน"),
    onPressed: () {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Gas_Done()),
          (Route<dynamic> route) => false);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Column(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        const Text(
          "โปรดยืนยัน หลังจากยืนยันแล้วจะไม่สามารถแก้ไขได้ ",
          style: TextStyle(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        Container(
          height: 10,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text(
              "จำนวนลิตร: ",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const Text(
              "142 ",
              style: TextStyle(fontSize: 18, color: Colors.green),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text(
              "จำนวนเงินทั้งหมด: ",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const Text(
              "4,237.28 ",
              style: TextStyle(fontSize: 18, color: Colors.green),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ],
    ),
    actions: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: 130,
            child: continueButton,
          ),
          Container(
            width: 130,
            child: cancelButton,
          ),
        ],
      ),
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

class _Gas_SummaryState extends State<Gas_Summary> {
  Widget Btn_Confirm() {
    return Container(
      width: 200,
      height: 50,
      alignment: Alignment.bottomCenter,
      child: Align(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: const Color(0xff438EB9),
              minimumSize: const Size.fromHeight(
                50,
              ),
              // fromHeight use double.infinity as width and 40 is the height
              elevation: 5),
          child: const Text(
            'ยืนยัน',
            style: TextStyle(fontSize: 20),
          ),
          onPressed: () {
            showAlertDialog(context);
            print('ยืนยัน');
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
        backgroundColor: const Color(0xff438EB9),
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
            color: const Color(0xff438EB9),
            child: const Text(
              'กรอกจำนวนเงินน้ำมันที่เติม',
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
          Tabel_Gas_Summary(),
          Container(
            height: 20,
          ),
          Btn_Confirm(),
        ],
      )),
    );
  }
}
