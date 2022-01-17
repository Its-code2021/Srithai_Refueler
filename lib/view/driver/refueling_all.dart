// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new

import 'package:cpac/view/driver/coupon_detail.dart';
import 'package:cpac/view/driver/qr_code.dart';
import 'package:cpac/view/driver/tabel_all.dart';
import 'package:cpac/view/splash_page.dart';
import 'package:flutter/material.dart';

class Refueling_All extends StatefulWidget {
  Refueling_All({Key? key}) : super(key: key);

  @override
  _Refueling_AllState createState() => _Refueling_AllState();
}

class _Refueling_AllState extends State<Refueling_All> {
  /// DropDown Oil
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(
          child: Text(
            "เลือกปั้มน้ำมัน",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          value: "เลือกปั้มน้ำมัน"),
      DropdownMenuItem(
          child: Text(
            "PTT",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          value: "PTT"),
      DropdownMenuItem(
          child: Text(
            "PT",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          value: "PT"),
      DropdownMenuItem(
          child: Text(
            "ESSO",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          value: "ESSO"),
      DropdownMenuItem(
          child: Text(
            "SHELL",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          value: "SHELL"),
    ];
    return menuItems;
  }

  Widget DropDown(BuildContext context) {
    String selectedValue = "เลือกปั้มน้ำมัน";
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.0),
      child: DropdownButtonFormField(
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xff438EB9), width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xff438EB9), width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
            filled: true,
            fillColor: Colors.white,
          ),
          dropdownColor: Colors.white,
          value: selectedValue,
          onChanged: (String? newValue) {
            setState(() {
              selectedValue = newValue!;
            });
            print(newValue);
          },
          items: dropdownItems),
    );
  }

  /// End DropDown Oil
  ///
  /// BT Add_Oil
  Widget Add_Oil() {
    return Container(
      width: double.infinity,
      height: 50,
      padding: EdgeInsets.symmetric(horizontal: 80),
      child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Qr_code()),
            );
            print('เติมน้ำมัน');
          },
          child: Text(
            'เติมน้ำมัน',
            style: TextStyle(fontSize: 20),
          )),
    );
  }

  /// End BT Add_Oil
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
            Tabel_Header_DpOil(),
            Tabel_Header_DpOil_Body(),
            Container(
              height: 10,
            ),
            DropDown(context),
            Container(
              height: 10,
            ),
            Add_Oil(),
            Container(
              height: 10,
            ),
            Container(
              width: double.infinity,
              height: 60,
              alignment: Alignment.center,
              color: Color(0xff438EB9),
              child: Text(
                'รายละเอียด DP ทั้งหมด',
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
            Tabel_Header_Row(),
          ],
        ),
      ),
    );
  }
}
