import 'package:cpac/controller/gas_qr_code.dart';
import 'package:cpac/controller/qr_code.dart';
import 'package:cpac/server/api.dart';
import 'package:cpac/utility/date_time.dart';
import 'package:cpac/utility/my_alert.dart';
import 'package:cpac/view/driver/tabbar_driver_home.dart';
import 'package:cpac/view/frist_user_login.dart';
import 'package:cpac/view/gas_station/tabbar_gas%20home.dart';
import 'package:cpac/view/loading_chang_password.dart';
import 'package:cpac/view/login_pump_gas.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

var Profile;
Future<void> GetapiHeader(token) async {
  var dio = Dio();
  String url = apiUser;
  final response = await dio.get(url,
      options: Options(headers: {'Authorization': 'Token $token'}));
  var result = response.data['results'][0];
  Profile = result;
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
}

Future<void> GetapiPumpUser(BuildContext context, token) async {
  String url = apiUser;
  Dio dio = Dio();
  Response response = await dio.post(
    url,
    options: Options(headers: {'Authorization': 'Token $token'}),
  );
  print('Token::: $response');
  var result = response.data['results'][0];
  if (response.data['status_code'][0]['code'] == "200") {
    Profile = result;
    if (Profile['user_level'] == "D") {
      GetapiHeader(token); //pop dialog
      GetToken(token);
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => TabBar_Menu_Driver_Home()),
          (Route<dynamic> route) => false);
    } else if (Profile['user_level'] == "P") {
      GetapiHeader(token);
      GetToken(token);
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => TabBar_Menu_Gas_Home()),
          (Route<dynamic> route) => false);
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
    if (result['device_model'] == device_model_pump) {
      if (result['frist_login'] == 0) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (context) => Remember_Login_Pump(context, token)),
            (Route<dynamic> route) => false);
      } else {
        GetapiHeader(token); //pop dialog
        GetToken(token);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => Frist_User_Login()),
            (Route<dynamic> route) => false);
      }
    } else {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Loading_Chang_Password()),
          (Route<dynamic> route) => false);
    }
  }
  Profile = result;
  print(Profile);
  print('Token::: $token');
}
