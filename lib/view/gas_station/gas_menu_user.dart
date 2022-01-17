// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cpac/view/driver/coupon_history.dart';
import 'package:cpac/view/driver/login_driver.dart';
import 'package:cpac/view/driver/user_profile.dart';
import 'package:cpac/view/gas_station/gas_notifications.dart';
import 'package:cpac/view/gas_station/gas_user_profile.dart';
import 'package:cpac/view/gas_station/login_gas.dart';
import 'package:flutter/material.dart';

class Gas_Menu_User extends StatefulWidget {
  Gas_Menu_User({Key? key}) : super(key: key);

  @override
  _Gas_Menu_UserState createState() => _Gas_Menu_UserState();
}

class _Gas_Menu_UserState extends State<Gas_Menu_User> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: ListView(
          children: <Widget>[
            Container(
              height: 5,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Color(0xff438EB9),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0))),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.account_circle_rounded,
                    size: 100,
                    color: Colors.white,
                  ),
                  Text(
                    'Mr.PTT',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20),
                  ),
                ],
              ),
            ),
            Container(
              height: 5,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  side: BorderSide(
                    width: 2.0,
                    color: Colors.grey,
                  ),
                  primary: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  textStyle:
                      TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Gas_User_Profile()),
                );
                print('บัญชีของฉัน');
              },
              child: ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.person,
                          color: Color(0xff438EB9),
                          size: 35,
                        ),
                        Text(
                          '  บัญชีของฉัน',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 5,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  side: BorderSide(
                    width: 2.0,
                    color: Colors.grey,
                  ),
                  primary: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  textStyle:
                      TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Gas_Notifications()),
                );
                print('รายการแจ้งเตือน');
              },
              child: ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.edit_notifications_rounded,
                          color: Color(0xff438EB9),
                          size: 35,
                        ),
                        Text(
                          '  รายการแจ้งเตือน',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 5,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  side: BorderSide(
                    width: 2.0,
                    color: Colors.grey,
                  ),
                  primary: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  textStyle:
                      TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => Login_Gas()),
                    (Route<dynamic> route) => false);
                print('ออกจากระบบ');
              },
              child: ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.logout,
                          color: Color(0xff438EB9),
                          size: 35,
                        ),
                        Text(
                          '  ออกจากระบบ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
