import 'package:cpac/controller/user_profile.dart';
import 'package:cpac/view/gas_station/gas_bill_amount.dart';
import 'package:cpac/view/gas_station/gas_draw_user.dart';
import 'package:cpac/view/gas_station/gas_history_detail.dart';
import 'package:cpac/view/gas_station/gas_list_payment_detail.dart';
import 'package:cpac/view/gas_station/gas_list_payment_history_detail.dart';
import 'package:cpac/view/gas_station/gas_qr_code.dart';
import 'package:cpac/view/gas_station/gas_screenshot_bin_agin_history.dart';
import 'package:cpac/view/gas_station/gas_screenshot_bin_history.dart';
import 'package:cpac/view/gas_station/gas_screenshot_payment.dart';
import 'package:cpac/view/gas_station/gas_screenshot_payment_history.dart';
import 'package:cpac/view/gas_station/tabbar_Gas.dart';
import 'package:cpac/view/gas_station/tabbar_gas%20home.dart';
import 'package:cpac/view/gas_station/tabbar_gas_home_payment.dart';
import 'package:cpac/view/login_pump_gas.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';

import 'gas_bill_amount_history.dart';
import 'gas_list_payment_history.dart';
import 'gas_screenshot_bin.dart';

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

class Loading_Bin_History_Detail extends StatefulWidget {
  @override
  _Loading_Bin_History_DetailState createState() =>
      _Loading_Bin_History_DetailState();
}

class _Loading_Bin_History_DetailState
    extends State<Loading_Bin_History_Detail> {
  @override
  Widget build(BuildContext context) {
    var Bin_Detail_id;
    return EasySplashScreen(
      logo: Image.asset(
        'images/loading.gif',
        fit: BoxFit.cover,
        alignment: Alignment.center,
      ),
      backgroundColor: Colors.white,
      showLoader: true,
      navigator: gas_screenshot_bin(Bin_Detail_id),
      durationInSeconds: 2,
      loaderColor: Colors.white,
    );
  }
}

class Loading_Bin_History_Detail_Again extends StatefulWidget {
  @override
  _Loading_Bin_History_Detail_AgainState createState() =>
      _Loading_Bin_History_Detail_AgainState();
}

class _Loading_Bin_History_Detail_AgainState
    extends State<Loading_Bin_History_Detail_Again> {
  @override
  Widget build(BuildContext context) {
    var Bin_Detail_id;
    return EasySplashScreen(
      logo: Image.asset(
        'images/loading.gif',
        fit: BoxFit.cover,
        alignment: Alignment.center,
      ),
      backgroundColor: Colors.white,
      showLoader: true,
      navigator: gas_screenshot_bin_agin_history(Bin_Detail_id),
      durationInSeconds: 2,
      loaderColor: Colors.white,
    );
  }
}

class Loading_Bin__Detail extends StatefulWidget {
  @override
  _Loading_Bin__DetailState createState() => _Loading_Bin__DetailState();
}

class _Loading_Bin__DetailState extends State<Loading_Bin__Detail> {
  @override
  Widget build(BuildContext context) {
    var Bin_history_id;
    return EasySplashScreen(
      logo: Image.asset(
        'images/loading.gif',
        fit: BoxFit.cover,
        alignment: Alignment.center,
      ),
      backgroundColor: Colors.white,
      showLoader: true,
      navigator: gas_screenshot_bin_history(Bin_history_id),
      durationInSeconds: 2,
      loaderColor: Colors.white,
    );
  }
}

class Loading_Bin_Amount_History extends StatefulWidget {
  @override
  _Loading_Bin_Amount_HistoryState createState() =>
      _Loading_Bin_Amount_HistoryState();
}

class _Loading_Bin_Amount_HistoryState
    extends State<Loading_Bin_Amount_History> {
  @override
  Widget build(BuildContext context) {
    var Bin_history_id;
    return EasySplashScreen(
      logo: Image.asset(
        'images/loading.gif',
        fit: BoxFit.cover,
        alignment: Alignment.center,
      ),
      backgroundColor: Colors.white,
      showLoader: true,
      navigator: Gas_Bill_Amount_Hstory(Bin_history_id),
      durationInSeconds: 2,
      loaderColor: Colors.white,
    );
  }
}

class Loading_Gas_List_Payment_Detail extends StatefulWidget {
  @override
  _Loading_Gas_List_Payment_DetailState createState() =>
      _Loading_Gas_List_Payment_DetailState();
}

class _Loading_Gas_List_Payment_DetailState
    extends State<Loading_Gas_List_Payment_Detail> {
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
      navigator: Gas_List_Payment_Detail(),
      durationInSeconds: 2,
      loaderColor: Colors.white,
    );
  }
}

class Loading_Gas_List_Payment_History extends StatefulWidget {
  @override
  _Loading_Gas_List_Payment_HistoryState createState() =>
      _Loading_Gas_List_Payment_HistoryState();
}

class _Loading_Gas_List_Payment_HistoryState
    extends State<Loading_Gas_List_Payment_History> {
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
      navigator: Gas_List_Payment_History(),
      durationInSeconds: 2,
      loaderColor: Colors.white,
    );
  }
}

class Loading_Gas_List_Payment_History_Detail extends StatefulWidget {
  @override
  _Loading_Gas_List_Payment_History_DetailState createState() =>
      _Loading_Gas_List_Payment_History_DetailState();
}

class _Loading_Gas_List_Payment_History_DetailState
    extends State<Loading_Gas_List_Payment_History_Detail> {
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
      navigator: Gas_List_Payment_History_Detail(),
      durationInSeconds: 2,
      loaderColor: Colors.white,
    );
  }
}

class Loading_Gas_List_Screenshot_Payment extends StatefulWidget {
  @override
  _Loading_Gas_List_Screenshot_PaymentState createState() =>
      _Loading_Gas_List_Screenshot_PaymentState();
}

class _Loading_Gas_List_Screenshot_PaymentState
    extends State<Loading_Gas_List_Screenshot_Payment> {
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
      navigator: Gas_Screenshot_Payment(context),
      durationInSeconds: 2,
      loaderColor: Colors.white,
    );
  }
}

class Loading_Gas_List_Screenshot_Payment_History extends StatefulWidget {
  @override
  _Loading_Gas_List_Screenshot_Payment_HistoryState createState() =>
      _Loading_Gas_List_Screenshot_Payment_HistoryState();
}

class _Loading_Gas_List_Screenshot_Payment_HistoryState
    extends State<Loading_Gas_List_Screenshot_Payment_History> {
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
      navigator: Gas_Screenshot_Payment_History(context),
      durationInSeconds: 2,
      loaderColor: Colors.white,
    );
  }
}

class Loading_Gas_TabBar_Menu_Gas_Home_Payment extends StatefulWidget {
  @override
  _Loading_Gas_TabBar_Menu_Gas_Home_PaymentState createState() =>
      _Loading_Gas_TabBar_Menu_Gas_Home_PaymentState();
}

class _Loading_Gas_TabBar_Menu_Gas_Home_PaymentState
    extends State<Loading_Gas_TabBar_Menu_Gas_Home_Payment> {
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
      navigator: TabBar_Menu_Gas_Home_Payment(),
      durationInSeconds: 2,
      loaderColor: Colors.white,
    );
  }
}
