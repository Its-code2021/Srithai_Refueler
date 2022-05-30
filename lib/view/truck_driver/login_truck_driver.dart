import 'dart:io';

import 'package:cpac/controller/driver_employee.dart';
import 'package:cpac/controller/user_profile.dart';
import 'package:cpac/server/api.dart';
import 'package:cpac/utility/my_alert.dart';
import 'package:cpac/view/select_menu.dart';
import 'package:cpac/view/splash_page.dart';
import 'package:cpac/view/truck_driver/driver_profile.dart';
import 'package:cpac/view/truck_driver/home_driver.dart';
import 'package:cpac/view/truck_driver/loading_driver.dart';
import 'package:cpac/view/truck_driver/tabbar_driver_truck.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unique_identifier/unique_identifier.dart';
import 'package:url_launcher/url_launcher.dart';

class Login_Truck_Driver extends StatefulWidget {
  @override
  _Login_Truck_DriverState createState() => _Login_Truck_DriverState();
}

String result_token = "";
bool _isChecked_Driver = true;
TextEditingController _usernameControllers = TextEditingController();
TextEditingController _passwordControllers = TextEditingController();
String model_device_android = "";
String model_device_ios = "";
var password_chang_driver;
var username_chang_driver;
var _username;
var _password;
var device_model;
String storeVersions = '1.0.21';

class _Login_Truck_DriverState extends State<Login_Truck_Driver> {
  bool _isChecked = false;
  bool showPassword = true;
  String token = "";

  @override
  void initState() {
    _loadUserEmailPassword();
    super.initState();
  }

  void _onLoading() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            // ignore: unnecessary_new
            child: new Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircularProgressIndicator(),
                Container(
                    margin: const EdgeInsets.only(left: 5),
                    child: const Text('โปรดรอสักครู่....')),
              ],
            ),
          ),
        );
      },
    );
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
                        Navigator.of(context);
                        GetapiDriverUser(context, result_token, device_model);

                        result_token;
                        _Btn_DriverCheck(_isChecked_Driver);
                        GetapiDriverDouponList(context, result_token);
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

  Future<Null> login() async {
    String url = apiLoginDriver;
    try {
      Dio dio = new Dio();
      Response response = await dio.post(url, data: {
        "username": _usernameControllers.text,
        "password": _passwordControllers.text,
        "device_model": device_model.toString()
      });

      if (response.data['status_code'][0]['code'] == "200") {
        var result = response.data['results'][0];
        result_token = result;
        String username = _usernameControllers.text.toString();
        String password = _passwordControllers.text.toString();
        username_chang_driver = username;
        password_chang_driver = password;
        DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
        if (Platform.isAndroid) {
          AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
          PackageInfo packageInfo = await PackageInfo.fromPlatform();
          String versions = packageInfo.version;
          if (versions != storeVersions) {
            AlertUpdate_App(context);
            print("เวอร์ชั้นเก่า $versions");
            print("เวอร์ชั้นใหม่ $storeVersions");
          } else {
            GetapiDriverUser(context, result_token, device_model);

            result_token;
            _Btn_DriverCheck(_isChecked_Driver);
            GetapiDriverDouponList(context, result_token);
          }
        } else if (Platform.isIOS) {
          IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
          device_model = iosDeviceInfo.identifierForVendor.toString();
          print('device_model IOS:::$device_model');
        }
        // GetConfrimRememberDriverUser(context, result_token, device_model);

      } else {
        myAlert_2(context, "รหัสผ่านหรือชื่อผู้ใช้งานไม่ถูกต้อง");
      }
    } catch (e) {
      print(e);
      print('รหัสไม่ถูก');
      myAlert_2(context, "รหัสผ่านไม่ถูกต้อง!!");
    }
  }

  OutlineInputBorder myinputborder() {
    //return type is OutlineInputBorder
    return const OutlineInputBorder(
        //Outline border type for TextFeild
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(
          color: Colors.grey,
          width: 3,
        ));
  }

  OutlineInputBorder myfocusborder() {
    return const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(
          color: Colors.grey,
          width: 3,
        ));
  }

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.blue;
    }

    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(height: 60),
                    Image.asset(
                      'images/001.png',
                    ),
                    Container(height: 10),
                    const Text(
                      'เข้าสู่ระบบ สำหรับพนักงานขับรถเท่านั้น',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(height: 20),
                    Container(
                      child: const SizedBox(
                        width: double.infinity,
                        child: Text(
                          'ชื่อผู้ใช้งาน',
                          textAlign: TextAlign.left,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(height: 3),
                    TextField(
                        controller: _usernameControllers,
                        maxLength: 10,
                        onChanged: (value) => updateButtonState(value),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'[a-zA-Z0-9]')),
                        ],
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          labelStyle: const TextStyle(
                            fontSize: 20,
                          ),
                          isDense: true,
                          border: myinputborder(),
                          enabledBorder: myinputborder(),
                          focusedBorder: myfocusborder(),
                        )),
                    Container(height: 3),
                    Container(
                      child: const SizedBox(
                        width: double.infinity,
                        child: Text(
                          'รหัสผ่าน',
                          textAlign: TextAlign.left,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(height: 5),
                    TextField(
                      maxLength: 16,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'[a-zA-Z0-9]')),
                      ],
                      keyboardType: TextInputType.visiblePassword,
                      controller: _passwordControllers,
                      onChanged: (value) => updateButtonState(value),
                      obscureText: showPassword,
                      decoration: InputDecoration(
                          counterText: "",
                          labelStyle: const TextStyle(
                            fontSize: 20,
                          ),
                          isDense: true,
                          enabledBorder: myinputborder(),
                          focusedBorder: myfocusborder(),
                          suffixIcon: IconButton(
                              icon: Icon(showPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                setState(() =>
                                    {this.showPassword = !this.showPassword});
                              })),
                    ),
                    Container(height: 15),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue[900],
                        minimumSize: const Size.fromHeight(
                          50,
                        ), //
                      ),
                      onPressed: () async {
                        if ((_usernameControllers.text != "" &&
                            _passwordControllers.text != "")) {
                          DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
                          if (Platform.isAndroid) {
                            AndroidDeviceInfo androidInfo =
                                await deviceInfo.androidInfo;
                            // device_model = androidInfo.model.toString();
                            device_model = await UniqueIdentifier.serial;
                            // identifier = await UniqueIdentifier.serial;
                            login();
                            print('device_model Android:::$device_model');
                          } else if (Platform.isIOS) {
                            IosDeviceInfo iosDeviceInfo =
                                await deviceInfo.iosInfo;
                            device_model =
                                iosDeviceInfo.identifierForVendor.toString();
                            login();
                            print('device_model IOS:::$device_model');
                          }
                        } else {
                          myAlert_2(
                              context, 'ชื่อผู้ใช้งานหรือรหัสผ่านไม่ถูกต้อง');
                        }
                        print("username = " +
                            _usernameControllers.text +
                            " password = " +
                            _passwordControllers.text);
                      },
                      child: const Text('เข้าสู่ระบบ'),
                    ),
                    // ElevatedButton(
                    //     onPressed: () async {
                    //       DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
                    //       if (Platform.isAndroid) {
                    //         AndroidDeviceInfo androidInfo =
                    //             await deviceInfo.androidInfo;
                    //         model_device_android = androidInfo.model.toString();
                    //         print(
                    //             'Model Name Android ::: $model_device_android');
                    //       } else if (Platform.isIOS) {
                    //         IosDeviceInfo iosDeviceInfo =
                    //             await deviceInfo.iosInfo;
                    //         model_device_ios =
                    //             iosDeviceInfo.identifierForVendor.toString();
                    //         print('Model UUID IOS ::: $model_device_ios');
                    //       }
                    //     },
                    //     child: Text('Test Model Name'))
                  ]),
            ),
          ),
        ));
  }

  field(TextEditingController controller, Icon icon, String label) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [
            const BoxShadow(
              color: Colors.white,
              blurRadius: 5.0,
            ),
          ],
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: const Color(0xffECEBEB))),
      child: TextField(
          controller: controller,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(top: 8, left: 20),
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            border: InputBorder.none,
            suffixIcon: icon,
            labelText: label,
            labelStyle:
                const TextStyle(fontSize: 14, decoration: TextDecoration.none),
          )),
    );
  }

  void updateButtonState(String text) {
    if ((text == null || text.length == 0) && _isChecked) {
      setState(() {
        _isChecked = false;
      });
    } else if (text == text) {
      setState(() {
        _isChecked = false;
      });
    }
  }

  void _Btn_DriverCheck(value) {
    print("_isChecked_Driver");
    _isChecked_Driver = value;
    SharedPreferences.getInstance().then(
      (prefs) {
        prefs.setBool("remember_me", value);
        prefs.setString('username', _usernameControllers.text);
        // prefs.setString('password', _passwordControllers.text);
        // prefs.setString('result_token', result_token.toString());
      },
    );
    setState(() {
      _isChecked_Driver = value;
      result_token;
    });
  }

  void _loadUserEmailPassword() async {
    print("Load Username");
    try {
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      var _username = _prefs.getString("username") ?? "";
      var _password = _prefs.getString("password") ?? "";
      var _result_token = _prefs.getString("result_token") ?? "";
      var _remeberMe = _prefs.getBool("remember_me") ?? false;

      print(_remeberMe);
      print(_username);
      print(_password);
      print(_result_token);
      if (_remeberMe) {
        setState(() {
          // _onLoading();
          if (result_token != null || result_token != '') {
            GetapiDriverUser(context, result_token, device_model);
            // GetapiDriverDouponList(context, result_token);
          } else {}
          _isChecked = true;
          _isChecked_Driver = true;
        });
        _usernameControllers.text = _username;
        _passwordControllers.text = _password;
        result_token = _result_token;
      }
    } catch (e) {
      print(e);
    }
  }
}

var Btn_DriverCheckS;
bool _isChecked_Btn = true;
Widget Btn_Logout(BuildContext context) {
  return Container(
      width: 200,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.red[700],
          minimumSize: const Size.fromHeight(
            50,
          ),
        ),
        onPressed: () async {
          final _prefs = await SharedPreferences.getInstance();
          await _prefs.clear();
          bool _isChecked_Btn = true;
          _Btn_DriverRemeberme(_isChecked_Btn);
          _usernameControllers.clear();
          _passwordControllers.clear();
          result_token = '';
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => Loading_LogOut()),
              (Route<dynamic> route) => false);

          print('ออกจากระบบ $result_token');
          print('ออกจากระบบ $Logout');
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Text(
              'ออกจากระบบ',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Icon(
              Icons.logout_outlined,
              size: 30,
            ),
          ],
        ),
      ));
}

Future<void> AlertConfrimChangPassword(BuildContext context,
    _oldpasswordController, _newpasswordController) async {
  showDialog(
    context: context,
    builder: (context) => MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
      child: AlertDialog(
        actions: [
          Column(
            children: [
              Icon(
                Icons.warning,
                size: 50,
                color: Colors.red,
              ),
              Container(
                height: 5,
              ),
              Text(
                'ยืนยันการเปลี่ยนรหัสผ่าน',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Container(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      var _oldpasswordControllers = _oldpasswordController.text;
                      var _newpasswordControllers = _newpasswordController.text;
                      PosapiChangPasswordDriver(context,
                          _oldpasswordControllers, _newpasswordControllers);

                      print('เก่า $_oldpasswordControllers');
                      print('ใหม่ $_newpasswordControllers');
                    },
                    child: const Center(
                        child: Text(
                      'ตกลง',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Center(
                        child: Text(
                      'ยกเลิก',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

void _Btn_DriverRemeberme(value) {
  print("Btn_Driver");
  _isChecked_Btn = value;
  SharedPreferences.getInstance().then(
    (prefs) {
      prefs.setString('Btn_Driver', Btn_Driver.toString());
    },
  );
  _isChecked_Btn = value;
}

Future<Null> login_Remember(BuildContext context, _username, _password) async {
  String url = apiLoginDriver;
  try {
    Dio dio = new Dio();
    Response response = await dio.post(url, data: {
      "username": _username,
      "password": _password,
      "device_model": device_model.toString()
    });
    if (response.data['status_code'][0]['code'] == "200") {
      var result = response.data['results'][0];
      result_token = result;
      // GetapiDriverUser(context, result_token, device_model);
      GetapiDriverDouponList(context, result_token);
      print('device_model::: $device_model');
    } else {
      myAlert_2(context, "รหัสผ่านหรือชื่อผู้ใช้งานไม่ถูกต้อง");
    }
  } catch (e) {
    print(e);
    print('รหัสไม่ถูก');
    myAlert_2(context, "รหัสผ่านไม่ถูกต้อง!!");
  }
}

// Widget Remember_Login(BuildContext context) {
//   @override
//   void _Btn_DriverCheck(value) {
//     print("_isChecked_Driver");
//     _isChecked_Driver = value;
//     SharedPreferences.getInstance().then(
//       (prefs) {
//         prefs.setBool("remember_me", value);
//         prefs.setString('username', _usernameControllers.text);
//         prefs.setString('password', _passwordControllers.text);
//         prefs.setString('device_model', device_model.toString());
//         prefs.setString('result_token', result_token.toString());
//       },
//     );
//     void setState(value) {
//       _isChecked_Driver = value;
//       result_token;
//     }
//   }

//   return MediaQuery(
//     data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
//     child: Scaffold(
//       appBar: AppBar(
//         title: Image.asset('images/002.png', fit: BoxFit.cover),
//         centerTitle: true,
//         backgroundColor: Color(0xff438EB9),
//       ),
//       floatingActionButton: FloatingActionButton.extended(
//         elevation: 0.0,
//         onPressed: () {
//           GetapiDriverUser(context, result_token, device_model);
//           GetapiDriverDouponList(context, result_token);
//         },
//         label: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             const Text(
//               'ข้าม',
//               style:
//                   TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
//             ),
//             Icon(Icons.double_arrow, color: Colors.black),
//           ],
//         ),
//         backgroundColor: Colors.transparent,
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//       body: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(
//               Icons.lock,
//               color: Colors.black,
//               size: 100,
//             ),
//             Container(
//               height: 50,
//             ),
//             Text(
//               'คุณต้องการบันทึกรหัสผ่านและชื่อผู้ใช้หรือไม่?',
//               style:
//                   TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
//             ),
//             Container(
//               height: 50,
//             ),
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 primary: Colors.blue[900],
//               ),
//               onPressed: () {
//                 GetapiDriverUser(context, result_token, device_model);
//                 GetapiDriverDouponList(context, result_token);
//                 result_token;
//                 _Btn_DriverCheck(_isChecked_Driver);
//               },
//               child: Text('จดจำการเข้าสู่ระบบ'),
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
// }
