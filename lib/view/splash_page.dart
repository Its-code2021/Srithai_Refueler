import 'package:cpac/view/gas_station/login_gas.dart';
import 'package:cpac/view/select_menu.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
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
      navigator: Login_Gas(),
      durationInSeconds: 3,
      loaderColor: Colors.red,
    );
  }
}
