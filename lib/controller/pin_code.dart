import 'package:cpac/controller/gas_qr_code.dart';
import 'package:cpac/server/api.dart';
import 'package:cpac/utility/my_alert.dart';
import 'package:cpac/view/driver/deiver_pin_code/driver_forgot_pint_code.dart';
import 'package:cpac/view/driver/tabbar_driver.dart';
import 'package:cpac/view/driver/tabbar_driver_home.dart';
import 'package:cpac/view/gas_station/pin_code/forgot_pint_code.dart';
import 'package:cpac/view/gas_station/pin_code/gas_create_confirm_pin_code.dart';
import 'package:cpac/view/gas_station/pin_code/gas_create_pin_code.dart';
import 'package:cpac/view/gas_station/tabbar_gas%20home.dart';
import 'package:cpac/view/login_pin_code.dart';
import 'package:cpac/view/login_pump_gas.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'user_profile.dart';

var Password_check_pin;
//เช็ครหัสผ่านเพื่อเปลี่ยน Pin
Future<void> PostPump_Check_Password_Pin(
    BuildContext context, String password) async {
  String url = apiPump_Check_Password_Pin;
  Dio dio = new Dio();
  Response response = await dio.post(url,
      options: Options(headers: {'Authorization': 'Token $Tokens_all'}),
      data: {"password": password});

  var result = response.data['results'];
  print('Password_check_pin:s::::$result');
  var status_code = response.data["status_code"][0]["code"];
  if (result != null && result != '') {
    if (status_code == '200') {
      Password_check_pin = result[0];
      print('Password_check_pin:::::$Password_check_pin');
      GetapiHeader(token);
      GetToken(token);
      GetPump_Paymant_List();
      GetPump_Paymant_List_History();
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Forgot_Pin_Code()),
          (Route<dynamic> route) => false);
    } else {}
  } else {
    AlertPassword_Confrim_Chang_PinCode(context);
  }
}

//สร้าง Pin
var Password_pin;
Future<void> PostAuth_Check_Created_Pin(
    BuildContext context, String currentText, String id_pin) async {
  String url = apiUser_Created_Pin;
  Dio dio = new Dio();
  Response response = await dio.post(url,
      options: Options(headers: {'Authorization': 'Token $Tokens_all'}),
      data: {"is_pin": 1, "pin_code": currentText, "id": id_pin});

  var result = response.data['results'][0];
  print('Password_check_pin:::::$result');
  var status_code = response.data["status_code"][0]["code"];
  if (status_code == '200') {
    Password_pin = result;
    print('Password_pin:::::$Password_pin');
    GetapiHeader(token);
    GetToken(token);
    GetPump_Paymant_List();
    GetPump_Paymant_List_History();
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => TabBar_Menu_Gas_Home()),
        (Route<dynamic> route) => false);
  } else {}
}

//เปลี่ยนรหัส Pin
var Change_pin;
Future<void> PostAuth_Change_Pin(BuildContext context,
    String currentText_Chang_Pin, String id_pin_confirm) async {
  String url = apiUser_Change_Pin;
  Dio dio = new Dio();
  Response response = await dio.post(url,
      options: Options(headers: {'Authorization': 'Token $Tokens_all'}),
      data: {"pin_code": currentText_Chang_Pin, "id": id_pin_confirm});

  var result = response.data['results'][0];
  print('Password_Change_pin:::::$result');
  var status_code = response.data["status_code"][0]["code"];
  if (status_code == '200') {
    Change_pin = result;

    GetapiHeader(token);
    GetToken(token);
    GetPump_Paymant_List();
    GetPump_Paymant_List_History();
    Future.delayed(Duration(seconds: 1), () {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => TabBar_Menu_Gas_Home()),
          (Route<dynamic> route) => false);
    });
  } else {}
}

//สร้าง Pin First Login
var First_Password_pin;
Future<void> PostAuth_First_Created_Pin(BuildContext context,
    String currentText_FirstLogin_Number, String First_id_pin) async {
  String url = apiUser_Created_Pin;
  Dio dio = new Dio();
  Response response = await dio.post(url,
      options: Options(headers: {'Authorization': 'Token $Tokens_all'}),
      data: {
        "is_pin": 1,
        "pin_code": currentText_FirstLogin_Number,
        "id": First_id_pin
      });

  var result = response.data['results'][0];
  print('Password_check_pin:::::$result');
  var status_code = response.data["status_code"][0]["code"];
  if (status_code == '200') {
    First_Password_pin = result;
    print('Password_pin:::::$First_Password_pin');
    // GetTokenPIN(context, token);
    GetapiHeader(token);
    GetToken(token);
    GetPump_Paymant_List();
    GetPump_Paymant_List_History();
    Future.delayed(Duration(seconds: 1), () {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Login_Pump_Gas()),
          (Route<dynamic> route) => false);
    });
  } else {}
}

////Driver////
///
/////สร้าง Pin
var Driver_Password_pin;
Future<void> PostAuth_Driver_Check_Created_Pin(
    BuildContext context, String currentText, String id_pin) async {
  String url = apiUser_Created_Pin;
  Dio dio = new Dio();
  Response response = await dio.post(url,
      options: Options(headers: {'Authorization': 'Token $Tokens_all'}),
      data: {"is_pin": 1, "pin_code": currentText, "id": id_pin});

  var result = response.data['results'][0];
  print('Password_check_pin:::::$result');
  var status_code = response.data["status_code"][0]["code"];
  if (status_code == '200') {
    Driver_Password_pin = result;
    print('Password_pin:::::$Driver_Password_pin');
    GetapiHeader(token);
    GetToken(token);
    GetPump_Paymant_List();
    GetPump_Paymant_List_History();
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => TabBar_Menu_Driver_Home()),
        (Route<dynamic> route) => false);
  } else {}
}

var Driver_Password_check_pin;
//เช็ครหัสผ่านเพื่อเปลี่ยน Pin
Future<void> PostDriver_Check_Password_Pin(
    BuildContext context, String password) async {
  String url = apiPump_Check_Password_Pin;
  Dio dio = new Dio();
  Response response = await dio.post(url,
      options: Options(headers: {'Authorization': 'Token $Tokens_all'}),
      data: {"password": password});

  var result = response.data['results'];
  print('Password_check_pin:s::::$result');
  var status_code = response.data["status_code"][0]["code"];
  if (result != null && result != '') {
    if (status_code == '200') {
      Driver_Password_check_pin = result[0];
      print('Password_check_pin:::::$Driver_Password_check_pin');
      GetapiHeader(token);
      GetToken(token);
      GetPump_Paymant_List();
      GetPump_Paymant_List_History();
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Driver_Forgot_Pin_Code()),
          (Route<dynamic> route) => false);
    } else {}
  } else {
    AlertPassword_Confrim_Chang_PinCode(context);
  }
}

//เปลี่ยนรหัส Pin
var Driver_Change_pin;
Future<void> PostAuth_Driver_Change_Pin(BuildContext context,
    String Driver_currentText_Chang_Pin, String id_pin_confirm) async {
  String url = apiUser_Change_Pin;
  Dio dio = new Dio();
  Response response = await dio.post(url,
      options: Options(headers: {'Authorization': 'Token $Tokens_all'}),
      data: {"pin_code": Driver_currentText_Chang_Pin, "id": id_pin_confirm});

  var result = response.data['results'][0];
  print('Password_Change_pin:::::$result');
  var status_code = response.data["status_code"][0]["code"];
  if (status_code == '200') {
    Driver_Change_pin = result;

    GetapiHeader(token);
    GetToken(token);
    GetPump_Paymant_List();
    GetPump_Paymant_List_History();
    Future.delayed(Duration(seconds: 1), () {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => TabBar_Menu_Driver_Home()),
          (Route<dynamic> route) => false);
    });
  } else {}
}
