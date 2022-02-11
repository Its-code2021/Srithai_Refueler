import 'package:cpac/view/truck_driver/driver_profile.dart';
import 'package:cpac/view/truck_driver/home_driver.dart';
import 'package:flutter/material.dart';

class Tabbar_Driver extends StatefulWidget {
  Tabbar_Driver({Key? key}) : super(key: key);

  @override
  State<Tabbar_Driver> createState() => _Tabbar_DriverState();
}

class _Tabbar_DriverState extends State<Tabbar_Driver> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    Home_Coupon_Driver(),
    Driver_Profile(),
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
