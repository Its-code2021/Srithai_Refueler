// ignore_for_file: deprecated_member_use, unnecessary_new

import 'package:cpac/view/driver/coupon_history.dart';
import 'package:cpac/view/driver/menu_user.dart';
import 'package:cpac/view/driver/notifications.dart';
import 'package:cpac/view/driver/qr_code.dart';
import 'package:cpac/view/driver/refueling_all.dart';
import 'package:cpac/view/driver/staff_refueling.dart';
import 'package:cpac/view/driver/user_profile.dart';
import 'package:cpac/view/splash_page.dart';

import 'package:flutter/material.dart';

class TabBar_Menu_Driver_Home extends StatefulWidget {
  @override
  _TabBar_Menu_Driver_HomeState createState() =>
      _TabBar_Menu_Driver_HomeState();
}

class _TabBar_Menu_Driver_HomeState extends State<TabBar_Menu_Driver_Home> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    Staff_Refueling(),
    User_Profile(),
    // SplashPage(),
  ];

  @override
  Widget build(BuildContext context) {
    Future<bool> showExitPopup() async {
      return await showDialog(
            //show confirm dialogue
            context: context,
            builder: (context) => AlertDialog(
              title: Text(
                'คุณแน่ใจหรือไม่ที่จะปิดแอปพลิเคชัน',
                style: TextStyle(fontSize: 18),
              ),
              actions: [
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: Text('ยืนยัน'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey,
                  ),
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text('ยกเลิก'),
                ),
              ],
            ),
          ) ??
          false;
    }

    return WillPopScope(
      onWillPop: showExitPopup, //call function on back button press
      child: Scaffold(
        appBar: AppBar(
          title:
              Center(child: Image.asset('images/002.png', fit: BoxFit.cover)),
          backgroundColor: const Color(0xff438EB9),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          backgroundColor: Colors.white70,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                size: 25,
                color: Colors.grey,
              ),
              title: Text(
                'หนักแรก',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              activeIcon: Icon(
                Icons.home,
                size: 25,
                color: Color(0xff438EB9),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: 25,
                color: Colors.grey,
              ),
              title: Text(
                'บัญชีของฉัน',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              activeIcon: Icon(
                Icons.person,
                size: 25,
                color: Color(0xff438EB9),
              ),
            ),
          ],
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
        body: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }
}
