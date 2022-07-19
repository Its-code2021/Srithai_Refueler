import 'package:cpac/controller/gas_qr_code.dart';
import 'package:cpac/controller/qr_code.dart';
import 'package:cpac/server/api.dart';
import 'package:cpac/utility/date_time.dart';
import 'package:cpac/utility/my_alert.dart';
import 'package:cpac/view/cpac/tabbar_cpac_home.dart';
import 'package:cpac/view/driver/deiver_pin_code/driver_login_pin_code.dart';
import 'package:cpac/view/driver/deiver_pin_code/driver_pin_convenience_detail.dart';
import 'package:cpac/view/driver/tabbar_driver_home.dart';
import 'package:cpac/view/frist_user_login.dart';
import 'package:cpac/view/gas_station/pin_code/gas_confirm_password_change_pin_code.dart';
import 'package:cpac/view/gas_station/pin_code/gas_create_pin_code.dart';
import 'package:cpac/view/gas_station/gas_loading_page.dart';
import 'package:cpac/view/gas_station/pin_code/gas_first_login_create_pin_code.dart';
import 'package:cpac/view/gas_station/pin_code/gas_pin_convenience_detail.dart';
import 'package:cpac/view/gas_station/tabbar_gas%20home.dart';
import 'package:cpac/view/loading_chang_password.dart';
import 'package:cpac/view/login_pin_code.dart';
import 'package:cpac/view/login_pump_gas.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:store_redirect/store_redirect.dart';

import 'driver_employee.dart';

String ver = "1.2.8";

var Profile;
var Tokens_Pin_All;
Future<void> GetapiHeader(token) async {
  var dio = Dio();
  String url = apiUser;
  final response = await dio.get(url,
      options: Options(headers: {'Authorization': 'Token $token'}));
  var result = response.data['results'][0];
  Profile = result;
  Tokens_Pin_All = token;
}

var Tokens_all;
Future<void> GetToken(token) async {
  String url = apiUser;
  Dio dio = new Dio();
  Response response = await dio.post(
    url,
    options: Options(headers: {'Authorization': 'Token $token'}),
  );
  var result = token;
  Tokens_all = result;
  PostPumpHistoryRefue(startdate, enddate);
  GetPump_Paymant_List();
  GetPump_Paymant_List_History();
}

Future<void> GetapiPumpUser(BuildContext context, token) async {
  String url = apiUser;
  Dio dio = Dio();
  Response response = await dio.post(
    url,
    options: Options(headers: {'Authorization': 'Token $token'}),
  );
  var Tokens_PIN = token;
  print('Token::: $response');
  var result = response.data['results'][0];
  if (response.data['status_code'][0]['code'] == "200") {
    Profile = result;
    if (Profile['user_level'] == "D") {
      if (Profile['is_pin'] == 1) {
        GetapiHeader(token);
        GetToken(token);
        // GetTokenPIN(context, Tokens_PIN);
        PostPumpHistoryRefue(startdate, enddate);
        GetPump_Paymant_List();
        GetPump_Paymant_List_History();
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => Driver_Login_Pin_Code()),
            (Route<dynamic> route) => false);
      } else {
        GetapiHeader(token);
        GetToken(token);
        PostPumpHistoryRefue(startdate, enddate);
        GetPump_Paymant_List();
        GetPump_Paymant_List_History();
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (context) => Driver_Pin_ConvenienceDetail()),
            (Route<dynamic> route) => false);
        print('PIN CODE::: 0');
      }
    } else if (Profile['user_level'] == "P") {
      if (Profile['is_pin'] == 1) {
        GetapiHeader(token);
        GetToken(token);
        // GetTokenPIN(context, Tokens_PIN);
        PostPumpHistoryRefue(startdate, enddate);
        GetPump_Paymant_List();
        GetPump_Paymant_List_History();
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => Login_Pin_Code()),
            (Route<dynamic> route) => false);
      } else {
        GetapiHeader(token);
        GetToken(token);
        PostPumpHistoryRefue(startdate, enddate);
        GetPump_Paymant_List();
        GetPump_Paymant_List_History();
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (context) => Gas_Pin_ConvenienceDetail()),
            (Route<dynamic> route) => false);
        print('PIN CODE::: 0');
      }
    }
  }

  print('Profile::: $Profile');
  print('Token::: $token');
}

Future<void> GetConfrimRememberPumpUser(
    BuildContext context, token, device_model_pump) async {
  var dio = Dio();
  String url = apiUser;
  final response = await dio.get(url,
      options: Options(headers: {'Authorization': 'Token $token'}));
  var result = response.data['results'][0];

  if (response.data['status_code'][0]['code'] == "200") {
    // if (result['device_model'] == device_model_pump) {
    if (result['frist_login'] == 0) {
      Profile = result;
      if (Profile['user_level'] == "D") {
        if (Profile['is_pin'] == 1) {
          GetapiHeader(token);
          GetToken(token);
          // GetTokenPIN(context, Tokens_PIN);
          PostPumpHistoryRefue(startdate, enddate);
          GetPump_Paymant_List();
          GetPump_Paymant_List_History();
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => Driver_Login_Pin_Code()),
              (Route<dynamic> route) => false);
        } else {
          GetapiHeader(token);
          GetToken(token);
          PostPumpHistoryRefue(startdate, enddate);
          GetPump_Paymant_List();
          GetPump_Paymant_List_History();
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (context) => Driver_Pin_ConvenienceDetail()),
              (Route<dynamic> route) => false);
          print('PIN CODE::: 0');
        }
      } else if (Profile['user_level'] == "P") {
        if (result['is_pin'] == 1) {
          GetapiHeader(token);
          GetToken(token);
          // GetTokenPIN(context, Tokens_PIN);
          PostPumpHistoryRefue(startdate, enddate);
          GetPump_Paymant_List();
          GetPump_Paymant_List_History();
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => Login_Pin_Code()),
              (Route<dynamic> route) => false);
        } else {
          GetapiHeader(token);
          GetToken(token);
          PostPumpHistoryRefue(startdate, enddate);
          GetPump_Paymant_List();
          GetPump_Paymant_List_History();
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (context) => Gas_Pin_ConvenienceDetail()),
              (Route<dynamic> route) => false);
          print('PIN CODE::: 0');
        }
      }
      print(Profile);
    } else {
      GetapiHeader(token);
      GetToken(token);
      // GetTokenPIN(context, token);
      PostPumpHistoryRefue(startdate, enddate);
      GetPump_Paymant_List();
      GetPump_Paymant_List_History();
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Frist_User_Login()),
          (Route<dynamic> route) => false);
    }
  }

  print('Token::: $token');
}
