// ignore_for_file: deprecated_member_use, unnecessary_new, use_key_in_widget_constructors, unused_import, duplicate_ignore, avoid_print, avoid_unnecessary_containers, camel_case_types, file_names

import 'package:cpac/view/driver/coupon_history.dart';
import 'package:cpac/view/driver/menu_user.dart';
import 'package:cpac/view/driver/notifications.dart';
import 'package:cpac/view/gas_station/gas_history.dart';
import 'package:cpac/view/gas_station/gas_menu_user.dart';
import 'package:cpac/view/gas_station/gas_notifications.dart';
import 'package:cpac/view/gas_station/gas_qr_code.dart';
import 'package:cpac/view/gas_station/gas_reference_number.dart';

import 'package:cpac/view/gas_station/gas_station_all.dart';

import 'package:flutter/material.dart';

class Gas_Tab_QrCode extends StatefulWidget {
  @override
  _Gas_Tab_QrCodeState createState() => _Gas_Tab_QrCodeState();
}

// ignore: camel_case_types
class _Gas_Tab_QrCodeState extends State<Gas_Tab_QrCode> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    Gas_QrCode(),
    Gas_Reference_Number(),
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
                'ยืนยันการออกจากการ Scan QrCode หรือไม่',
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
                'Scan QrCode',
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
                Icons.border_color,
                size: 25,
                color: Colors.grey,
              ),
              title: Text(
                'ใส่หมายเลขอ้างอิง',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              activeIcon: Icon(
                Icons.border_color,
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
