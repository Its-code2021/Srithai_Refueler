// ignore_for_file: deprecated_member_use, unnecessary_new, use_key_in_widget_constructors, avoid_print, avoid_unnecessary_containers, file_names, prefer_const_constructors, duplicate_ignore

import 'package:cpac/view/gas_station/gas_history.dart';
import 'package:cpac/view/gas_station/gas_menu_user.dart';
import 'package:cpac/view/gas_station/gas_qr_code.dart';
import 'package:cpac/view/gas_station/gas_select.dart';
import 'package:cpac/view/gas_station/gas_user_profile.dart';
import 'package:flutter/material.dart';

import 'gas__oil_all.dart';
import 'gas_list_payment.dart';

class TabBar_Menu_Gas_Home_Payment extends StatefulWidget {
  @override
  _TabBar_Menu_Gas_Home_PaymentState createState() =>
      _TabBar_Menu_Gas_Home_PaymentState();
}

class _TabBar_Menu_Gas_Home_PaymentState
    extends State<TabBar_Menu_Gas_Home_Payment> {
  int _selectedIndex = 2;

  final List<Widget> _widgetOptions = <Widget>[
    Gas_Select(),
    Gas_History(),
    Gas_List_Payment(),
    Gas_User_Profile(),
    // SplashPage(),
  ];

  @override
  Widget build(BuildContext context) {
    Future<bool> showExitPopup() async {
      return await showDialog(
            //show confirm dialogue
            context: context,
            builder: (context) => AlertDialog(
              // ignore: prefer_const_constructors
              title: Text(
                'คุณแน่ใจหรือไม่ที่จะปิดแอปพลิเคชัน',
                style: TextStyle(fontSize: 18),
              ),
              actions: [
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  // ignore: prefer_const_constructors
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
                'หน้าแรก',
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
                Icons.history_outlined,
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
                Icons.history,
                size: 25,
                color: Color(0xff438EB9),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.payment_outlined,
                size: 25,
                color: Colors.grey,
              ),
              title: Text(
                'รับชำระเงิน',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              activeIcon: Icon(
                Icons.payment,
                size: 25,
                color: Color(0xff438EB9),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline,
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
