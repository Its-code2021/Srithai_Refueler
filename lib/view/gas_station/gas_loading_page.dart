import 'package:cpac/view/gas_station/gas_bill_amount.dart';
import 'package:cpac/view/gas_station/gas_draw_user.dart';
import 'package:cpac/view/gas_station/gas_history_detail.dart';
import 'package:cpac/view/gas_station/gas_qr_code.dart';
import 'package:cpac/view/gas_station/tabbar_Gas.dart';
import 'package:cpac/view/gas_station/tabbar_gas%20home.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';

class Gas_Loading_Page extends StatefulWidget {
  Gas_Loading_Page({Key? key}) : super(key: key);

  @override
  State<Gas_Loading_Page> createState() => _Gas_Loading_PageState();
}

class _Gas_Loading_PageState extends State<Gas_Loading_Page> {
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
      navigator: TabBar_Menu_Gas(),
      durationInSeconds: 3,
      loaderColor: Colors.white,
    );
  }
}

class Loading_Page_Gas_QqCode extends StatefulWidget {
  Loading_Page_Gas_QqCode({Key? key}) : super(key: key);

  @override
  State<Loading_Page_Gas_QqCode> createState() =>
      _Loading_Page_Gas_QqCodeState();
}

class _Loading_Page_Gas_QqCodeState extends State<Loading_Page_Gas_QqCode> {
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
      navigator: Gas_Qr_Code(),
      durationInSeconds: 3,
      loaderColor: Colors.white,
    );
  }
}

class Loading_Page_Detail_Gas extends StatefulWidget {
  @override
  _Loading_Page_Detail_GasState createState() =>
      _Loading_Page_Detail_GasState();
}

class _Loading_Page_Detail_GasState extends State<Loading_Page_Detail_Gas> {
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
      navigator: Gas_Draw_User(),
      durationInSeconds: 2,
      loaderColor: Colors.white,
    );
  }
}

class Loading_Page_Bill_Amount extends StatefulWidget {
  @override
  _Loading_Page_Bill_AmountState createState() =>
      _Loading_Page_Bill_AmountState();
}

class _Loading_Page_Bill_AmountState extends State<Loading_Page_Bill_Amount> {
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
      navigator: Gas_Bill_Amount(),
      durationInSeconds: 2,
      loaderColor: Colors.white,
    );
  }
}

class Loading_Page_Date extends StatefulWidget {
  @override
  _Loading_Page_DateState createState() => _Loading_Page_DateState();
}

class _Loading_Page_DateState extends State<Loading_Page_Date> {
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
      navigator: TabBar_Menu_Gas_Home(),
      durationInSeconds: 2,
      loaderColor: Colors.white,
    );
  }
}

class Loading_Page_History_Detail extends StatefulWidget {
  @override
  _Loading_Page_History_DetailState createState() =>
      _Loading_Page_History_DetailState();
}

class _Loading_Page_History_DetailState
    extends State<Loading_Page_History_Detail> {
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
      navigator: History_Detail_Gas(),
      durationInSeconds: 2,
      loaderColor: Colors.white,
    );
  }
}
