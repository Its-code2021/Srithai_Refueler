import 'package:cpac/view/driver/qr_code.dart';
import 'package:cpac/view/driver/staff_refueling.dart';
import 'package:cpac/view/driver/tabbar_coupon_history.dart';
import 'package:cpac/view/driver/tabbar_driver.dart';

import 'package:flutter/material.dart';

class Staff_Done extends StatefulWidget {
  Staff_Done({Key? key}) : super(key: key);

  @override
  _Staff_DoneState createState() => _Staff_DoneState();
}

class _Staff_DoneState extends State<Staff_Done> {
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
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => Staff_Refueling()),
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
                        MaterialPageRoute(builder: (context) => Qr_code()),
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
