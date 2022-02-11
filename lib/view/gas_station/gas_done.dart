import 'package:cpac/controller/gas_qr_code.dart';
import 'package:cpac/utility/date_time.dart';
import 'package:cpac/view/gas_station/gas_qr_code.dart';
import 'package:cpac/view/gas_station/tabbar_gas%20home.dart';

import 'package:flutter/material.dart';

class Gas_Done extends StatefulWidget {
  Gas_Done({Key? key}) : super(key: key);

  @override
  _Gas_DoneState createState() => _Gas_DoneState();
}

class _Gas_DoneState extends State<Gas_Done> {
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
              'ดำเนินการเสร็จสิ้น',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          Container(
            height: 100,
          ),
          Image.asset('images/true.png', fit: BoxFit.cover),
          Container(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff4782D2),
                  ),
                  onPressed: () {
                    PostPumpHistoryRefue(startdate, enddate);
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => TabBar_Menu_Gas_Home()),
                        (Route<dynamic> route) => false);
                    print('กลับหน้าหลัก');
                  },
                  child: Text(
                    'กลับหน้าหลัก',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff4782D2),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => Gas_Qr_Code()),
                        (Route<dynamic> route) => false);
                  },
                  child: Text(
                    'Scan QRCode',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
