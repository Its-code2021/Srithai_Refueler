// ignore_for_file: prefer_const_constructors

import 'package:cpac/view/login_pump_gas.dart';

import 'package:cpac/view/truck_driver/login_truck_driver.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Select_User extends StatefulWidget {
  Select_User({Key? key}) : super(key: key);

  @override
  _Select_UserState createState() => _Select_UserState();
}

bool _isChecked_Btn = false;
bool _isChecked_Pump = false;
var Btn_Driver = 1;
var Btn_Pump = 2;

class _Select_UserState extends State<Select_User> {
  @override
  void initState() {
    _load_Btn_DriverRemeberme();
    super.initState();
  }

  void _Btn_DriverRemeberme(value) {
    print("Btn_Driver");
    _isChecked_Btn = value;
    SharedPreferences.getInstance().then(
      (prefs) {
        prefs.setString('Btn_Driver', Btn_Driver.toString());
      },
    );
    setState(() {
      _isChecked_Btn = value;
    });
  }

  void _Btn_DriverRemeberme_Pump(value) {
    print("Btn_Pump");
    _isChecked_Pump = value;
    SharedPreferences.getInstance().then(
      (prefs) {
        prefs.setString('Btn_Pump', Btn_Pump.toString());
      },
    );
    setState(() {
      _isChecked_Pump = value;
    });
  }

  void _load_Btn_DriverRemeberme() async {
    try {
      SharedPreferences _pref = await SharedPreferences.getInstance();
      var _Btn_Driver = _pref.getString("Btn_Driver") ?? "";
      var _Btn_Pump = _pref.getString("Btn_Pump") ?? "";
      var _remeberMe = _pref.getBool("remember_me") ?? true;

      print(_remeberMe);
      print('$_Btn_Driver ');
      print('$_Btn_Pump ');

      if (_remeberMe != false) {
        setState(() {
          // _isChecked_Btn = true;
          // _isChecked_Pump = true;
          if (_Btn_Driver == '1') {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => Login_Truck_Driver()),
                (Route<dynamic> route) => false);
          } else if (_Btn_Pump == '2') {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => Login_Pump_Gas()),
                (Route<dynamic> route) => false);
          }
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: <Widget>[
                  Image.asset(
                    'images/001.png',
                  ),
                  Container(height: 80),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue[900],
                      minimumSize: Size.fromHeight(
                        50,
                      ), // fromHeight use double.infinity as width and 40 is the height
                    ),
                    onPressed: () {
                      Btn_Driver;
                      _isChecked_Btn;
                      _Btn_DriverRemeberme(_isChecked_Btn);
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => Login_Truck_Driver()),
                          (Route<dynamic> route) => false);

                      print('พนักงานขับรถ');
                      print('Btn_Driver $Btn_Driver');
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text(
                          'พนักงานขับรถ ',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.local_shipping_sharp,
                          size: 30,
                        )
                      ],
                    ),
                  ),
                  Container(height: 30),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue[900],
                      minimumSize: Size.fromHeight(
                        50,
                      ), // fromHeight use double.infinity as width and 40 is the height
                    ),
                    onPressed: () {
                      Btn_Pump;
                      _isChecked_Pump;
                      _Btn_DriverRemeberme_Pump(_isChecked_Pump);
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => Login_Pump_Gas()),
                          (Route<dynamic> route) => false);
                      print('Btn_Pump $Btn_Pump');
                      print('เข้าสู่ระบบ ปั้มน้ำมัน');
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text(
                          'ปั้มน้ำมัน',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.local_gas_station,
                          size: 30,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
