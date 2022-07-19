// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cpac/controller/user_profile.dart';
import 'package:cpac/server/api.dart';
import 'package:cpac/view/change_password.dart';
import 'package:cpac/view/login_pump_gas.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'pin_code/gas_confirm_password_change_pin_code.dart';

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
                    'เบอร์โทรศัพท์:',
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
              Card(
                child: ListTile(
                  leading: Text(
                    'อีเมล:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  title: Text(
                    Profile['email'].toString(),
                    style: TextStyle(
                      color: Color(0xff438EB9),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                height: 20,
              ),
              Text(
                'เวอร์ชั่นปัจจุบัน :$ver',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              Container(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue[900],

                        // fromHeight use double.infinity as width and 40 is the height
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Change_Password()),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'เปลี่ยนรหัสผ่าน ',
                            style: TextStyle(
                              fontSize: 16,
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
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue[900],
                      ),
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) =>
                                    Gas_ConfirmPassword_ChangePinCode()),
                            (Route<dynamic> route) => false);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'เปลี่ยนรหัส PIN ',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: 20,
              ),
              Btn_LogoutS(context),
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
