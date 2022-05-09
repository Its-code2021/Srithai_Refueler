// ignore_for_file: avoid_unnecessary_containers

import 'package:cpac/controller/driver_employee.dart';
import 'package:cpac/controller/user_profile.dart';
import 'package:cpac/server/api.dart';
import 'package:cpac/utility/my_alert.dart';
import 'package:cpac/view/driver/loading_page.dart';
import 'package:cpac/view/driver/tabbar_driver_home.dart';
import 'package:cpac/view/login_pump_gas.dart';

import 'package:cpac/view/select_menu.dart';
import 'package:cpac/view/truck_driver/loading_driver.dart';
import 'package:cpac/view/truck_driver/login_truck_driver.dart';
import 'package:cpac/view/truck_driver/tabbar_driver_truck.dart';
import 'package:dio/dio.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage_New extends StatefulWidget {
  @override
  _SplashPage_NewState createState() => _SplashPage_NewState();
}

class _SplashPage_NewState extends State<SplashPage_New> {
  void _loadUserEmailPassword() async {
    print("Load Username");
    try {
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      var _username = _prefs.getString("username") ?? "";
      var _password = _prefs.getString("password") ?? "";
      var _result_token = _prefs.getString("result_token") ?? "";
      var _token = _prefs.getString("token") ?? "";
      var _remeberMe = _prefs.getBool("remember_me") ?? false;

      print(_remeberMe);
      print(_username);
      print(_password);
      print(_token);
      print(_result_token);
      if (_remeberMe) {
        setState(() {
          if (result_token != null && result_token != '') {
            login_Remember(context, _username, _password);
          } else if (token != null && token != '') {
            // Remember_Login_Pump(context, token);
          }
        });
        result_token = _result_token;
        token = _token;
      }
    } catch (e) {
      print(e);
    }
  }

  void initState() {
    _loadUserEmailPassword();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      Check_Splash();
      GetapiDriverDouponList(context, result_token);
      GetapiDriverUser(context, result_token, device_model_pump);
      GetapiPumpUser(context, token);
      GetToken(token);
    });
    return Check_Splash();
  }

  Widget Check_Splash() {
    if (result_token != null && result_token != '') {
      return Container(
        child: EasySplashScreen(
          logo: Image.asset(
            'images/001.png',
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),
          backgroundColor: Colors.white,
          logoSize: 180,
          showLoader: true,
          // ignore: prefer_const_constructors
          loadingText: Text(
            "โปรดรอสักครู่...",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
          ),
          navigator: Loading_Driver(),
          durationInSeconds: 3,
          loaderColor: Colors.red,
        ),
      );
    } else {
      return Container(
        child: EasySplashScreen(
          logo: Image.asset(
            'images/001.png',
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),
          backgroundColor: Colors.white,
          logoSize: 180,
          showLoader: true,
          // ignore: prefer_const_constructors
          loadingText: Text(
            "โปรดรอสักครู่...",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
          ),
          navigator: Select_User(),
          durationInSeconds: 3,
          loaderColor: Colors.red,
        ),
      );
    }
  }

  Widget Splash_Select() {
    return Container(
      child: EasySplashScreen(
        logo: Image.asset(
          'images/001.png',
          fit: BoxFit.cover,
          alignment: Alignment.center,
        ),
        backgroundColor: Colors.white,
        logoSize: 180,
        showLoader: true,
        // ignore: prefer_const_constructors
        loadingText: Text(
          "โปรดรอสักครู่...",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
        ),
        navigator: Select_User(),
        durationInSeconds: 3,
        loaderColor: Colors.red,
      ),
    );
  }
}
