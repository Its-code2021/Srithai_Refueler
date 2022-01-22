import 'package:cpac/view/driver/qr_code.dart';
import 'package:cpac/view/driver/staff_draw_user.dart';
import 'package:cpac/view/driver/tabbar_driver.dart';

import 'package:cpac/view/select_menu.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';

class Loading_pang extends StatefulWidget {
  @override
  _Loading_pangState createState() => _Loading_pangState();
}

class _Loading_pangState extends State<Loading_pang> {
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset(
        'images/loading.gif',
        fit: BoxFit.cover,
        alignment: Alignment.center,
      ),
      backgroundColor: Colors.white,
      showLoader: true,
      navigator: TabBar_Menu_Driver(),
      durationInSeconds: 3,
      loaderColor: Colors.white,
    );
  }
}

class Loading_pang_Detail extends StatefulWidget {
  @override
  _Loading_pang_DetailState createState() => _Loading_pang_DetailState();
}

class _Loading_pang_DetailState extends State<Loading_pang_Detail> {
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset(
        'images/loading.gif',
        fit: BoxFit.cover,
        alignment: Alignment.center,
      ),
      backgroundColor: Colors.white,
      showLoader: true,
      navigator: Staff_Draw_User(),
      durationInSeconds: 2,
      loaderColor: Colors.white,
    );
  }
}

class Loading_pang_QqCode extends StatefulWidget {
  @override
  _Loading_pang_QqCodeState createState() => _Loading_pang_QqCodeState();
}

class _Loading_pang_QqCodeState extends State<Loading_pang_QqCode> {
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset(
        'images/loading.gif',
        fit: BoxFit.cover,
        alignment: Alignment.center,
      ),
      backgroundColor: Colors.white,
      showLoader: true,
      navigator: Qr_code(),
      durationInSeconds: 2,
      loaderColor: Colors.white,
    );
  }
}
