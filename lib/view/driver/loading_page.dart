import 'package:cpac/view/driver/qr_code.dart';
import 'package:cpac/view/driver/staff_draw_user.dart';
import 'package:cpac/view/driver/staff_draw_user_gen.dart';
import 'package:cpac/view/driver/tabbar_driver.dart';
import 'package:cpac/view/driver/tabbar_driver_home.dart';

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

class Loading_page_Home extends StatefulWidget {
  @override
  _Loading_page_HomeState createState() => _Loading_page_HomeState();
}

class _Loading_page_HomeState extends State<Loading_page_Home> {
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
      navigator: TabBar_Menu_Driver_Home(),
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

class Loading_pang_Detail_GEN extends StatefulWidget {
  @override
  _Loading_pang_Detail_GENState createState() =>
      _Loading_pang_Detail_GENState();
}

class _Loading_pang_Detail_GENState extends State<Loading_pang_Detail_GEN> {
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
      navigator: Staff_Draw_User_GEN(),
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

class Loading_Remeber_Login extends StatefulWidget {
  @override
  _Loading_Remeber_LoginState createState() => _Loading_Remeber_LoginState();
}

class _Loading_Remeber_LoginState extends State<Loading_Remeber_Login> {
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
      navigator: Check_Level_User(),
      durationInSeconds: 2,
      loaderColor: Colors.white,
    );
  }

  Widget Check_Level_User() {
    return Container();
  }
}
