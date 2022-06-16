// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cpac/controller/user_profile.dart';
import 'package:cpac/view/change_password.dart';

import 'package:cpac/view/splash_page.dart';
import 'package:cpac/view/truck_driver/login_truck_driver.dart';
import 'package:flutter/material.dart';

import '../login_pump_gas.dart';

class User_Profile extends StatefulWidget {
  User_Profile({Key? key}) : super(key: key);

  @override
  _User_ProfileState createState() => _User_ProfileState();
}

class _User_ProfileState extends State<User_Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
                'ข้อมูลส่วนตัว',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
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
                  Profile['fullname'].toString(),
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
                  Profile['username'].toString(),
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
                  'หน่วยงาน:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                title: Text(
                  Profile['site_name'].toString(),
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
                  'กิจการ:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                title: Text(
                  Profile['business_name'].toString(),
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
                  Profile['telephone'].toString(),
                  style: TextStyle(
                    color: Color(0xff438EB9),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              height: 10,
            ),
            Text(
              'เวอร์ชั่นปัจจุบัน :1.0.29',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            Container(
              height: 10,
            ),
            Container(
              width: 250,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(
                    50,
                  ),
                  primary: Colors.blue[900],
                  // fromHeight use double.infinity as width and 40 is the height
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Change_Password()),
                  );
                  print('เปลี่ยนรหัสผ่าน');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'เปลี่ยนรหัสผ่าน ',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Icon(
                      Icons.lock,
                      size: 25,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 20,
            ),
            Btn_LogoutS(context),
          ],
        ),
      ),
    );
  }
}
