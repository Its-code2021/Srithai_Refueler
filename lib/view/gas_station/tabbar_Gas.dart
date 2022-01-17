// ignore_for_file: deprecated_member_use, unnecessary_new, use_key_in_widget_constructors, unused_import, duplicate_ignore, avoid_print, avoid_unnecessary_containers, camel_case_types, file_names

import 'package:cpac/view/driver/coupon_history.dart';
import 'package:cpac/view/driver/menu_user.dart';
import 'package:cpac/view/driver/notifications.dart';
import 'package:cpac/view/gas_station/gas_history.dart';
import 'package:cpac/view/gas_station/gas_menu_user.dart';
import 'package:cpac/view/gas_station/gas_notifications.dart';
import 'package:cpac/view/gas_station/gas_qr_code.dart';

import 'package:cpac/view/gas_station/gas_station_all.dart';
import 'package:cpac/view/gas_station/gas_tab_qrcode.dart';

import 'package:flutter/material.dart';

class TabBar_Menu_Gas extends StatefulWidget {
  @override
  _TabBar_Menu_GasState createState() => _TabBar_Menu_GasState();
}

// ignore: camel_case_types
class _TabBar_Menu_GasState extends State<TabBar_Menu_Gas> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    Gas_History(),
    Gas_Menu_User(),
    // SplashPage(),
  ];

  @override
  Widget build(BuildContext context) {
    Future<bool> showExitPopup() async {
      return await showDialog(
            //show confirm dialogue
            context: context,
            builder: (context) => AlertDialog(
              title: const Text(
                'คุณแน่ใจหรือไม่ที่จะปิดแอปพลิเคชัน',
                style: TextStyle(fontSize: 18),
              ),
              actions: [
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: const Text('ยืนยัน'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey,
                  ),
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text('ยกเลิก'),
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
          title: new Center(
            child: Image.asset('images/002.png', fit: BoxFit.cover),
          ),
          backgroundColor: const Color(0xff438EB9),
          // ignore: duplicate_ignore, duplicate_ignore, duplicate_ignore
          actions: [
            // ignore: unnecessary_new
            new Stack(
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Gas_QrCode()),
                    );
                    print('แจ้งเตือน');
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
                Icons.list_alt,
                size: 25,
                color: Colors.grey,
              ),
              title: Text(
                'ประวัติการเติมน้ำมัน',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              activeIcon: Icon(
                Icons.list_alt,
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
