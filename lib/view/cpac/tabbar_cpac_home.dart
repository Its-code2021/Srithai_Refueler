import 'package:cpac/view/cpac/cpac_user_profile.dart';
import 'package:flutter/material.dart';

import 'cpac_coupong.dart';
import 'cpac_home.dart';

class TabBar_Cpac_Home extends StatefulWidget {
  @override
  _TabBar_Cpac_HomeState createState() => _TabBar_Cpac_HomeState();
}

class _TabBar_Cpac_HomeState extends State<TabBar_Cpac_Home> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    Cpac_Home(),
    Cpac_Coupong(),
    Cpac_User_Profile(),
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
                Icons.ballot_outlined,
                size: 25,
                color: Colors.grey,
              ),
              title: Text(
                'รายการคูปอง',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              activeIcon: Icon(
                Icons.ballot_rounded,
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
