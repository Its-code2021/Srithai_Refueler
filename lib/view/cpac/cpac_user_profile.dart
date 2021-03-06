// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cpac/controller/driver_employee.dart';
import 'package:cpac/controller/user_profile.dart';
import 'package:cpac/server/api.dart';
import 'package:cpac/view/change_password.dart';
import 'package:cpac/view/truck_driver/login_truck_driver.dart';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class Cpac_User_Profile extends StatefulWidget {
  Cpac_User_Profile({Key? key}) : super(key: key);

  @override
  _Cpac_User_ProfileState createState() => _Cpac_User_ProfileState();
}

class _Cpac_User_ProfileState extends State<Cpac_User_Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:
              Center(child: Image.asset('images/002.png', fit: BoxFit.cover)),
          backgroundColor: const Color(0xff438EB9),
        ),
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
                color: const Color(0xff438EB9),
                child: const Text(
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
                    Driver_ProfileUser['fullname'].toString(),
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
                    Driver_ProfileUser['username'].toString(),
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
                    'เบอร์โทรศัพท์:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  title: Text(
                    Driver_ProfileUser['telephone'].toString(),
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
                    'อีเมล:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  title: Text(
                    Driver_ProfileUser['email'].toString(),
                    style: TextStyle(
                      color: Color(0xff438EB9),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              // Card(
              //   child: ListTile(
              //     leading: Text(
              //       'หน่วยงาน:',
              //       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              //     ),
              //     title: Text(
              //       Profile['site_name'].toString(),
              //       style: TextStyle(
              //         color: Color(0xff438EB9),
              //         fontWeight: FontWeight.bold,
              //       ),
              //     ),
              //   ),
              // ),
              // Card(
              //   child: ListTile(
              //     leading: Text(
              //       'กิจการ:',
              //       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              //     ),
              //     title: Text(
              //       Profile['business_name'].toString(),
              //       style: TextStyle(
              //         color: Color(0xff438EB9),
              //         fontWeight: FontWeight.bold,
              //       ),
              //     ),
              //   ),
              // ),
              // Card(
              //   child: ListTile(
              //     leading: Text(
              //       'โทรศัพท์:',
              //       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              //     ),
              //     title: Text(
              //       Profile['telephone'].toString(),
              //       style: TextStyle(
              //         color: Color(0xff438EB9),
              //         fontWeight: FontWeight.bold,
              //       ),
              //     ),
              //   ),
              // ),
              Container(
                height: 20,
              ),
              Text(
                'เวอร์ชั่นปัจจุบัน : $versions',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              Container(
                height: 20,
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
                      MaterialPageRoute(
                          builder: (context) => Change_Password()),
                    );
                    print('ออกจากระบบ');
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
              Btn_Logout(context),
              Container(
                height: 30,
              ),
            ],
          ),
        )

        // This trailing comma makes auto-formatting nicer f
        );
  }
}
