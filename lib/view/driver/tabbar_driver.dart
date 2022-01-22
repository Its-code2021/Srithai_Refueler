// ignore_for_file: deprecated_member_use, unnecessary_new

import 'package:cpac/view/driver/coupon_history.dart';
import 'package:cpac/view/driver/menu_user.dart';
import 'package:cpac/view/driver/notifications.dart';
import 'package:cpac/view/driver/qr_code.dart';
import 'package:cpac/view/driver/refueling_all.dart';
import 'package:cpac/view/splash_page.dart';

import 'package:flutter/material.dart';

class TabBar_Menu_Driver extends StatefulWidget {
  @override
  _TabBar_Menu_DriverState createState() => _TabBar_Menu_DriverState();
}

class _TabBar_Menu_DriverState extends State<TabBar_Menu_Driver> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    Refueling_All(),
    Menu_User(),
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
          title: Image.asset('images/002.png', fit: BoxFit.cover),
          backgroundColor: const Color(0xff438EB9),
          actions: [
            // ignore: unnecessary_new
            new Stack(
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Qr_code()),
                    );
                    print('Qr_code');
                  },
                  icon: Container(
                    child: const Icon(
                      Icons.qr_code_scanner_outlined,
                      size: 30,
                    ),
                  ),
                ),
                // ignore: unnecessary_new
              ],
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          backgroundColor: Colors.white70,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.local_gas_station_rounded,
                size: 25,
                color: Colors.grey,
              ),
              title: Text(
                'รายละเอียดการเติมน้ำมัน',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              activeIcon: Icon(
                Icons.local_gas_station_rounded,
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
