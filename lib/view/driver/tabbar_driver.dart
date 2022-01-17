// ignore_for_file: deprecated_member_use, unnecessary_new

import 'package:cpac/view/driver/coupon_history.dart';
import 'package:cpac/view/driver/menu_user.dart';
import 'package:cpac/view/driver/notifications.dart';
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
    Coupon_History(),
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
                      MaterialPageRoute(builder: (context) => Notifications()),
                    );
                    print('แจ้งเตือน');
                  },
                  icon: Container(
                    child: const Icon(
                      Icons.notifications,
                      size: 30,
                    ),
                  ),
                ),
                // ignore: unnecessary_new
                new Positioned(
                  top: 1.0,
                  right: 0.0,
                  child: new Stack(
                    children: <Widget>[
                      new Icon(Icons.brightness_1,
                          size: 25.0, color: Colors.red),
                      new Positioned(
                        top: 7.0,
                        right: 7.0,
                        child: new Text('50',
                            // ignore: prefer_const_constructors
                            style: new TextStyle(
                                color: Colors.white,
                                fontSize: 12.0,
                                fontWeight: FontWeight.w500)),
                      )
                    ],
                  ),
                ),
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
                Icons.home,
                size: 25,
                color: Colors.grey,
              ),
              title: Text(
                'หน้าหลัก',
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
            // BottomNavigationBarItem(
            //   icon: Icon(
            //     Icons.notifications,
            //     size: 25,
            //     color: Colors.grey,
            //   ),
            //   title: Text(
            //     'การแจ้งเตือน',
            //     style: TextStyle(
            //         color: Colors.black,
            //         fontSize: 12,
            //         fontWeight: FontWeight.bold),
            //     textAlign: TextAlign.center,
            //   ),
            //   activeIcon: Icon(
            //     Icons.notifications_active,
            //     size: 25,
            //     color: Color(0xff438EB9),
            //   ),
            // ),
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
