import 'dart:async';
import 'dart:io';

import 'package:cpac/controller/gas_qr_code.dart';
import 'package:cpac/controller/pin_code.dart';
import 'package:cpac/controller/user_profile.dart';
import 'package:cpac/server/api.dart';
import 'package:cpac/utility/date_time.dart';
import 'package:cpac/utility/my_alert.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:store_redirect/store_redirect.dart';
import 'package:version_check/version_check.dart';

import 'gas_station/gas_tabel_all.dart';
import 'gas_station/pin_code/gas_confirm_password_change_pin_code.dart';
import 'gas_station/tabbar_gas home.dart';
import 'login_pump_gas.dart';

void main() => runApp(Login_Pin_Code());

// ignore: use_key_in_widget_constructors
class Login_Pin_Code extends StatelessWidget {
  // This widget is the root of your application.
  @override
  void initState() {
    PostPumpHistoryRefue(startdate, enddate);
    GetapiHeader(token);
    GetToken(token);
    GetPump_Paymant_List();
    GetPump_Paymant_List_History();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
      ),
      home:
          const PinCodeVerificationScreen(), // a random number, please don't call xD
    );
  }
}

class PinCodeVerificationScreen extends StatefulWidget {
  final String? phoneNumber;

  const PinCodeVerificationScreen({
    Key? key,
    this.phoneNumber,
  }) : super(key: key);

  @override
  _PinCodeVerificationScreenState createState() =>
      _PinCodeVerificationScreenState();
}

class _PinCodeVerificationScreenState extends State<PinCodeVerificationScreen> {
  TextEditingController textEditingController = TextEditingController();
  // ..text = "123456";

  // ignore: close_sinks
  StreamController<ErrorAnimationType>? errorController;
  String token = "";
  String? version = '';
  String? storeVersion = '';
  String? storeUrl = '';
  String? packageName = '';
  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();
  var User_check_Pin;
  Future<void> PostAuth_Check_Pin(
    BuildContext context,
    String currentText_Login,
  ) async {
    String url = apiUser_check_Pin;
    Dio dio = new Dio();
    Response response = await dio.post(url,
        options: Options(headers: {'Authorization': 'Token $Tokens_all'}),
        data: {
          "pin_code": currentText_Login,
        });

    var result = response.data['results'];

    print('User_check_Pin:::::$result');
    var status_code = response.data["status_code"][0]["code"];
    if (result != null && result != '') {
      if (status_code == '200') {
        User_check_Pin = result[0];
        print('User_check_Pin:::::$User_check_Pin');
        Future.delayed(Duration(seconds: 1), () {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => TabBar_Menu_Gas_Home()),
              (Route<dynamic> route) => false);
        });
      } else {}
    } else {
      textEditingController.clear();
      AlertPassword_Confrim_PinCode(context);
    }
  }

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    checkVersion();
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();

    super.dispose();
  }

  final versionCheck = VersionCheck(
    packageName:
        Platform.isIOS ? 'com.srithai.refuelers' : 'com.srithai.refuelers',
    packageVersion: versions,
    showUpdateDialog: customShowUpdateDialog_Pump_Pin,
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

  // snackBar Widget
  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {},
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            children: <Widget>[
              Container(height: 30),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'images/logo.png',
                      fit: BoxFit.cover,
                      scale: 25,
                    ),
                  ),
                  Container(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'ชื่อผู้ใช้งาน: ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        Profile['username'].toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue[900]),
                      )
                    ],
                  ),
                ],
              ),
              Container(height: 20),
              Form(
                key: formKey,
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 1.0, horizontal: 30),
                    child: PinCodeTextField(
                      appContext: context,
                      autoFocus: true,
                      backgroundColor: Colors.white,
                      pastedTextStyle: TextStyle(
                        color: Colors.green.shade600,
                        fontWeight: FontWeight.bold,
                      ),
                      length: 6,
                      obscureText: true,
                      obscuringCharacter: '*',
                      blinkWhenObscuring: true,
                      animationType: AnimationType.fade,
                      validator: (v) {
                        if (v!.length < 3) {
                          return "";
                        } else {
                          return null;
                        }
                      },
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(5),
                        activeFillColor: Colors.white,
                      ),
                      cursorColor: Colors.black,
                      animationDuration: const Duration(milliseconds: 300),
                      enableActiveFill: true,
                      errorAnimationController: errorController,
                      controller: textEditingController,
                      keyboardType: TextInputType.number,
                      onCompleted: (v) {
                        var currentText_Login = currentText;
                        PostAuth_Check_Pin(context, currentText_Login);
                        PostPumpHistoryRefue(startdate, enddate);
                      },
                      onChanged: (value) {
                        debugPrint(value);
                        setState(() {
                          currentText = value;
                        });
                      },
                      beforeTextPaste: (text) {
                        debugPrint("Allowing to paste $text");
                        return true;
                      },
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  hasError ? "*รหัสผ่านไม่ถูกต้อง" : "",
                  style: const TextStyle(
                      color: Colors.red,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Center(
                child: Text(
                  'กรุณาใส่รหัส PIN  6 หลัก ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                height: 20,
              ),
              Center(
                child: Text(
                  'V.$ver',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void customShowUpdateDialog_Pump_Pin(
    BuildContext context, VersionCheck versionCheck) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => AlertDialog(
      title: Center(child: Text('กรุณาอัพเดตแอปพลิเคชันเวอร์ชั่นใหม่!')),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              child: Text(
                'อัพเดท',
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
                'ข้าม',
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
