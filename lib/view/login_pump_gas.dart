import 'dart:io';

import 'package:cpac/controller/chang_password.dart';
import 'package:cpac/controller/driver_employee.dart';
import 'package:cpac/controller/user_profile.dart';
import 'package:cpac/server/api.dart';
import 'package:cpac/utility/my_alert.dart';
import 'package:cpac/view/loading_chang_password.dart';
import 'package:cpac/view/select_menu.dart';
import 'package:cpac/view/splash_page.dart';
import 'package:cpac/view/truck_driver/driver_profile.dart';
import 'package:cpac/view/truck_driver/home_driver.dart';
import 'package:cpac/view/truck_driver/loading_driver.dart';
import 'package:cpac/view/truck_driver/login_truck_driver.dart';
import 'package:cpac/view/truck_driver/tabbar_driver_truck.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_redirect/store_redirect.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:version_check/version_check.dart';

import 'login_pin_code.dart';

class Login_Pump_Gas extends StatefulWidget {
  @override
  _Login_Pump_GasState createState() => _Login_Pump_GasState();
}

String token = "";
bool _isChecked_DriverPump = true;
TextEditingController _usernameController = TextEditingController();
TextEditingController _passwordController = TextEditingController();
var password_chang;
var username_chang;
var device_model_pump;
var versions;
String password = "";

class _Login_Pump_GasState extends State<Login_Pump_Gas> {
  bool _isChecked = false;
  bool showPassword = true;
  String token = "";
  String? version = '';
  String? storeVersion = '';
  String? storeUrl = '';
  String? packageName = '';
  @override
  void initState() {
    checkVersion();
    _loadUserEmailPassword();
    super.initState();
  }

  final versionCheck = VersionCheck(
    packageName:
        Platform.isIOS ? 'com.srithai.refuelers' : 'com.srithai.refuelers',
    packageVersion: versions,
    showUpdateDialog: customShowUpdateDialog_Pump,
  );

  Future checkVersion() async {
    await versionCheck.checkVersion(context);
    setState(() {
      version = versionCheck.packageVersion;
      packageName = versionCheck.packageName;
      storeVersion = versionCheck.storeVersion;
      storeUrl = versionCheck.storeUrl;
    });
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
                    child: const Text('???????????????????????????????????????....')),
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

  Future<Null> login() async {
    String url = apiLogin;
    try {
      Dio dio = new Dio();
      Response response = await dio.post(url, data: {
        "username": _usernameController.text,
        "password": _passwordController.text,
        "device_model": device_model_pump.toString()
      });

      if (response.data['status_code'][0]['code'] == "200") {
        var result = response.data['results'][0];
        token = result;
        String username = _usernameController.text.toString();
        password = _passwordController.text.toString();
        username_chang = username;
        password_chang = password;
        DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
        if (Platform.isAndroid) {
          AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
          PackageInfo packageInfo = await PackageInfo.fromPlatform();
          versions = packageInfo.version;
          // GetapiPumpUser(context, token);
          GetConfrimRememberPumpUser(context, token, device_model_pump);
          _Btn_PumpCheck(_isChecked_DriverPump);
        } else if (Platform.isIOS) {
          IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
          device_model = iosDeviceInfo.identifierForVendor.toString();
          print('device_model IOS:::$device_model');
        }

        // GetapiDriverDouponList(context, token);
      } else {
        myAlert_2(context, "?????????????????????????????????????????????????????????????????????????????????????????????????????????");
      }
    } catch (e) {
      print(e);
      print('??????????????????????????????');
      myAlert_2(context, "??????????????????????????????????????????????????????!!");
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
                      fit: BoxFit.cover,
                    ),
                    Container(height: 30),
                    const Text(
                      '????????????????????????????????? ??????????????????????????????',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(height: 30),
                    Container(
                      child: const SizedBox(
                        width: double.infinity,
                        child: Text(
                          '???????????????????????????????????????',
                          textAlign: TextAlign.left,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(height: 10),
                    TextField(
                        controller: _usernameController,
                        onChanged: (value) => updateButtonState(value),
                        decoration: InputDecoration(
                          labelStyle: const TextStyle(
                            fontSize: 20,
                          ),
                          isDense: true,
                          border: myinputborder(),
                          enabledBorder: myinputborder(),
                          focusedBorder: myfocusborder(),
                        )),
                    Container(height: 10),
                    Container(
                      child: const SizedBox(
                        width: double.infinity,
                        child: Text(
                          '????????????????????????',
                          textAlign: TextAlign.left,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(height: 10),
                    TextField(
                      maxLength: 16,
                      controller: _passwordController,
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
                    Container(height: 50),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue[900],
                        minimumSize: const Size.fromHeight(
                          50,
                        ), //
                      ),
                      onPressed: () async {
                        if ((_usernameController.text != "" &&
                            _passwordController.text != "")) {
                          DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
                          if (Platform.isAndroid) {
                            AndroidDeviceInfo androidInfo =
                                await deviceInfo.androidInfo;
                            device_model_pump = androidInfo.model.toString();
                            login();
                            print('device_model Android:::$device_model_pump');
                          } else if (Platform.isIOS) {
                            IosDeviceInfo iosDeviceInfo =
                                await deviceInfo.iosInfo;
                            device_model_pump =
                                iosDeviceInfo.identifierForVendor.toString();
                            login();
                            print('device_model IOS:::$device_model_pump');
                          }
                        } else {
                          myAlert_2(
                              context, '?????????????????????????????????????????????????????????????????????????????????????????????????????????');
                        }
                        print("username = " +
                            _usernameController.text +
                            " password = " +
                            _passwordController.text);
                      },
                      child: const Text('?????????????????????????????????'),
                    ),
                    Container(
                      height: 20,
                    ),
                    Text(
                      'V.$version',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ]),
            ),
          ),
        ));
  }

  void _Btn_PumpCheck(value) {
    print("_isChecked_DriverPump $_isChecked_DriverPump");

    _isChecked_DriverPump = value;
    SharedPreferences.getInstance().then(
      (prefs) {
        prefs.setBool("remember_me", value);
        prefs.setString('username', _usernameController.text);
        // prefs.setString('password', _passwordController.text);
        prefs.setString('token', token);
      },
    );
    void setState(value) {
      _isChecked_DriverPump = value;
      token;
    }
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

  void _loadUserEmailPassword() async {
    print("Load Username");
    try {
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      var _username = _prefs.getString("username") ?? "";
      var _password = _prefs.getString("password") ?? "";
      var _token = _prefs.getString("token") ?? "";
      var _remeberMe = _prefs.getBool("remember_me") ?? false;

      print(_remeberMe);
      print(_username);
      print(_password);
      print(_token);
      if (_remeberMe) {
        setState(() {
          // _onLoading();
          if (token != null || token != '') {
            token;
            GetConfrimRememberPumpUser(context, token, device_model_pump);
            // GetTokenPIN(context, token);
            _Btn_PumpCheck(_isChecked_DriverPump);
            print('??????????????????????????????????????????????????????:::::::: $_isChecked_DriverPump');
            print('??????????????????????????????????????????????????????:::::::: $token');
          } else {}
          _isChecked = true;
          _isChecked_DriverPump = true;
        });
        _usernameController.text = _username;
        _passwordController.text = _password;
        token = _token;
      }
    } catch (e) {
      print(e);
    }
  }
}

void customShowUpdateDialog_Pump(
    BuildContext context, VersionCheck versionCheck) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => AlertDialog(
      title: Center(child: Text('?????????????????????????????????????????????????????????????????????????????????????????????????????????!')),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              child: Text(
                '??????????????????',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
              ),
              onPressed: () async {
                StoreRedirect.redirect(
                    // androidAppId: "com.srithai.refuelers",
                    //// iOSAppId: "585027354",
                    );
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
              ),
              child: Text(
                '????????????',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ],
    ),
  );
}

var Btn_PumpCheckS;
bool _isChecked_Pump = true;
Widget Btn_LogoutS(BuildContext context) {
  return Container(
      width: 250,
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
          bool _isChecked_Pump = true;
          _Btn_PumpRemeberme(_isChecked_Pump);
          _usernameController.clear();
          _passwordController.clear();
          token = '';
          Tokens_all = '';
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => Loading_Chang_Password()),
              (Route<dynamic> route) => false);

          print('?????????????????????????????? $token');
          print('?????????????????????????????? $Logout');
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Text(
              '??????????????????????????????',
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
                '????????????????????????????????????????????????????????????????????????',
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
                      PosapiChangPassword(context, _oldpasswordControllers,
                          _newpasswordControllers);
                      _Btn_PumpRemeberme(_isChecked_Pump);
                      _usernameController.clear();
                      _passwordController.clear();
                      token = '';
                      print('???????????? $_oldpasswordControllers');
                      print('???????????? $_newpasswordControllers');
                    },
                    child: const Center(
                        child: Text(
                      '????????????',
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
                      '??????????????????',
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

void _Btn_PumpRemeberme(value) {
  print("Btn_Pump");
  _isChecked_Pump = value;
  SharedPreferences.getInstance().then(
    (prefs) {
      prefs.setString('Btn_Pump', Btn_Pump.toString());
    },
  );
  _isChecked_Pump = value;
}

Future<Null> login_Remember_pump(
    BuildContext context, _username, _password) async {
  String url = apiLogin;
  try {
    Dio dio = new Dio();
    Response response = await dio.post(url, data: {
      "username": _username,
      "password": _password,
    });
    if (response.data['status_code'][0]['code'] == "200") {
      var result = response.data['results'][0];
      token = result;
      GetapiPumpUser(context, token);
    } else {
      // myAlert_2(context, "?????????????????????????????????????????????????????????????????????????????????????????????????????????");
    }
  } catch (e) {
    print(e);
    print('??????????????????????????????');
    myAlert_2(context, "??????????????????????????????????????????????????????!!");
  }
}

// Widget Remember_Login_Pump(BuildContext context, token) {
//   @override
//   void _Btn_PumpCheck(value) {
//     print("_isChecked_DriverPump");
//     print("_isChecked_DriverPump $token");
//     _isChecked_DriverPump = value;
//     SharedPreferences.getInstance().then(
//       (prefs) {
//         prefs.setBool("remember_me", value);
//         prefs.setString('username', _usernameController.text);
//         // prefs.setString('password', _passwordController.text);
//         // prefs.setString('token', token);
//       },
//     );
//     void setState(value) {
//       _isChecked_DriverPump = value;
//       token;
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
//           GetapiPumpUser(context, token);
//           // GetapiDriverDouponList(context, token);
//         },
//         label: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             const Text(
//               '????????????',
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
//               '?????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????',
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
//                 token;
//                 GetapiPumpUser(context, token);
//                 // GetapiDriverDouponList(context, token);
//                 token;
//                 _Btn_PumpCheck(_isChecked_DriverPump);
//                 print('??????????????????????????????????????????????????????:::::::: $_isChecked_DriverPump');
//                 print('??????????????????????????????????????????????????????:::::::: $token');
//               },
//               child: Text('??????????????????????????????????????????????????????'),
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
// }
