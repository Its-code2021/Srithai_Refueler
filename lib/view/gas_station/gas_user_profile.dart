// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class Gas_User_Profile extends StatefulWidget {
  Gas_User_Profile({Key? key}) : super(key: key);

  @override
  _Gas_User_ProfileState createState() => _Gas_User_ProfileState();
}

class _Gas_User_ProfileState extends State<Gas_User_Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'ข้อมูลส่วนตัว',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          centerTitle: true,
          backgroundColor: Color(0xff438EB9),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 5,
            ),
            Card(
              child: ListTile(
                leading: Text(
                  'ชื่อ:',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                title: Text(
                  'Mr.PTT',
                  style: TextStyle(
                    color: Color(0xff438EB9),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Card(
              child: ListTile(
                leading: Text(
                  'ชื่อผู้ใช้งาน:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                title: Text(
                  'ptt',
                  style: TextStyle(
                    color: Color(0xff438EB9),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Card(
              child: ListTile(
                leading: Text(
                  'โทรศัพท์:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                title: Text(
                  '089-XXX-XXXX',
                  style: TextStyle(
                    color: Color(0xff438EB9),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        )

        // This trailing comma makes auto-formatting nicer f
        );
  }
}
