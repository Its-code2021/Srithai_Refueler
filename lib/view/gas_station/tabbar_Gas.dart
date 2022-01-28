// ignore_for_file: deprecated_member_use, unnecessary_new

import 'package:cpac/view/gas_station/gas_menu_user.dart';
import 'package:cpac/view/gas_station/gas_qr_code.dart';
import 'package:cpac/view/gas_station/gas_user_profile.dart';
import 'package:flutter/material.dart';

import 'gas__oil_all.dart';

class TabBar_Menu_Gas extends StatefulWidget {
  @override
  _TabBar_Menu_GasState createState() => _TabBar_Menu_GasState();
}

class _TabBar_Menu_GasState extends State<TabBar_Menu_Gas> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    Gas_Oil_All(),
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
                      MaterialPageRoute(builder: (context) => Gas_Qr_Code()),
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
