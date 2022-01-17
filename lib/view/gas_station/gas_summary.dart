import 'package:cpac/view/gas_station/gas_history.dart';
import 'package:cpac/view/gas_station/gas_tabel_all.dart';
import 'package:cpac/view/gas_station/tabbar_Gas.dart';
import 'package:flutter/material.dart';

class Gas_Summary extends StatefulWidget {
  Gas_Summary({Key? key}) : super(key: key);

  @override
  _Gas_SummaryState createState() => _Gas_SummaryState();
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
              primary: Color(0xff438EB9),
              minimumSize: Size.fromHeight(
                50,
              ),
              // fromHeight use double.infinity as width and 40 is the height
              elevation: 5),
          child: Text(
            'ยืนยัน',
            style: TextStyle(fontSize: 20),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TabBar_Menu_Gas()),
            );
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
