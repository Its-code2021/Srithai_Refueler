// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:cpac/utility/my_alert.dart';
import 'package:cpac/view/login_pump_gas.dart';
import 'package:cpac/view/splash_page.dart';
import 'package:cpac/view/test_version.dart';

import 'package:cpac/view/truck_driver/login_truck_driver.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_version_checker/flutter_app_version_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unique_identifier/unique_identifier.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class Select_User extends StatefulWidget {
  Select_User({Key? key}) : super(key: key);

  @override
  _Select_UserState createState() => _Select_UserState();
}

bool _isChecked_Btn = false;
bool _isChecked_Pump = false;
var Btn_Driver = 1;
var Btn_Pump = 2;
String storeVersions = '1.0.21';

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

  final Uri _url = Uri.parse(
      'https://play.google.com/store/apps/details?id=com.srithai.refuelers');
  void _launchUrl() async {
    if (!await launchUrl(_url)) throw 'Could not launch $_url';
  }

  Future<void> AlertUpdate_App(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
        child: AlertDialog(
          actions: [
            Column(
              children: [
                Icon(
                  Icons.error_outline,
                  size: 50,
                  color: Colors.red,
                ),
                Container(
                  height: 10,
                ),
                const Text(
                  'กรุณาอัพเดตแอปเวอร์ชั่นใหม่',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                Container(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                      ),
                      onPressed: () {
                        Btn_Driver;
                        _isChecked_Btn;
                        _Btn_DriverRemeberme(_isChecked_Btn);
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => Login_Truck_Driver()),
                            (Route<dynamic> route) => false);
                      },
                      child: const Center(
                          child: Text(
                        'ข้าม',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                      ),
                      onPressed: () {
                        _launchUrl();
                        Navigator.of(context).pop();
                      },
                      child: const Center(
                          child: Text(
                        'อัพเดท',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<void> AlertUpdate_App_pump(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
        child: AlertDialog(
          actions: [
            Column(
              children: [
                Icon(
                  Icons.error_outline,
                  size: 50,
                  color: Colors.red,
                ),
                Container(
                  height: 10,
                ),
                const Text(
                  'กรุณาอัพเดตแอปเวอร์ชั่นใหม่',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                Container(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                      ),
                      onPressed: () {
                        Btn_Pump;
                        _isChecked_Pump;
                        _Btn_DriverRemeberme_Pump(_isChecked_Pump);
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => Login_Pump_Gas()),
                            (Route<dynamic> route) => false);
                      },
                      child: const Center(
                          child: Text(
                        'ข้าม',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                      ),
                      onPressed: () {
                        _launchUrl();
                        Navigator.of(context).pop();
                      },
                      child: const Center(
                          child: Text(
                        'อัพเดท',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
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
                      ),
                    ),
                    onPressed: () async {
                      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
                      if (Platform.isAndroid) {
                        AndroidDeviceInfo androidInfo =
                            await deviceInfo.androidInfo;
                        PackageInfo packageInfo =
                            await PackageInfo.fromPlatform();
                        String versions = packageInfo.version;
                        if (versions == storeVersions.toString()) {
                          Btn_Driver;
                          _isChecked_Btn;
                          _Btn_DriverRemeberme(_isChecked_Btn);
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => Login_Truck_Driver()),
                              (Route<dynamic> route) => false);
                        } else {
                          AlertUpdate_App(context);
                          print("เวอร์ชั้นเก่า $versions");
                          print(storeVersions);
                        }
                        print('พนักงานขับรถ');
                        print('Btn_Driver $Btn_Driver');
                      } else if (Platform.isIOS) {
                        IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
                        device_model =
                            iosDeviceInfo.identifierForVendor.toString();
                        print('device_model IOS:::$device_model');
                      }
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
                    onPressed: () async {
                      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
                      if (Platform.isAndroid) {
                        AndroidDeviceInfo androidInfo =
                            await deviceInfo.androidInfo;
                        PackageInfo packageInfo =
                            await PackageInfo.fromPlatform();
                        String versions = packageInfo.version;
                        if (versions == storeVersions.toString()) {
                          Btn_Pump;
                          _isChecked_Pump;
                          _Btn_DriverRemeberme_Pump(_isChecked_Pump);
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => Login_Pump_Gas()),
                              (Route<dynamic> route) => false);
                        } else {
                          AlertUpdate_App_pump(context);
                          print("เวอร์ชั้นเก่า $versions");
                          print(storeVersions);
                        }
                        print('พนักงานขับรถ');
                        print('Btn_Driver $Btn_Driver');
                      } else if (Platform.isIOS) {
                        IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
                        device_model =
                            iosDeviceInfo.identifierForVendor.toString();
                        print('device_model IOS:::$device_model');
                      }

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
