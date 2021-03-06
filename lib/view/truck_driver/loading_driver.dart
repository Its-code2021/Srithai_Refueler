import 'package:cpac/controller/driver_employee.dart';
import 'package:cpac/view/truck_driver/change_driver.dart';
import 'package:cpac/view/truck_driver/change_driver_select.dart';
import 'package:cpac/view/truck_driver/generate%20_qrcode.dart';
import 'package:cpac/view/truck_driver/login_truck_driver.dart';
import 'package:cpac/view/truck_driver/tabbar_driver_truck.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Loading_Driver extends StatefulWidget {
  Loading_Driver({Key? key}) : super(key: key);

  @override
  State<Loading_Driver> createState() => _Loading_DriverState();
}

class _Loading_DriverState extends State<Loading_Driver> {
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
      navigator: Tabbar_Driver(),
      durationInSeconds: 3,
      loaderColor: Colors.white,
    );
  }
}

class Loading_Driver_Coupon_Detail extends StatefulWidget {
  Loading_Driver_Coupon_Detail({Key? key}) : super(key: key);

  @override
  State<Loading_Driver_Coupon_Detail> createState() =>
      _Loading_Driver_Coupon_DetailState();
}

class _Loading_Driver_Coupon_DetailState
    extends State<Loading_Driver_Coupon_Detail> {
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
      navigator: Generate_QrCode(),
      durationInSeconds: 3,
      loaderColor: Colors.white,
    );
  }
}

class Loading_Chang_Password_Driver extends StatefulWidget {
  Loading_Chang_Password_Driver({Key? key}) : super(key: key);

  @override
  State<Loading_Chang_Password_Driver> createState() =>
      _Loading_Chang_Password_DriverState();
}

class _Loading_Chang_Password_DriverState
    extends State<Loading_Chang_Password_Driver> {
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
      navigator: Login_Truck_Driver(),
      durationInSeconds: 3,
      loaderColor: Colors.white,
    );
  }
}

class Loading_LogOut extends StatefulWidget {
  Loading_LogOut({Key? key}) : super(key: key);

  @override
  State<Loading_LogOut> createState() => _Loading_LogOutState();
}

class _Loading_LogOutState extends State<Loading_LogOut> {
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
      navigator: Login_Truck_Driver(),
      durationInSeconds: 3,
      loaderColor: Colors.white,
    );
  }
}

class Reload_Home extends StatefulWidget {
  Reload_Home({Key? key}) : super(key: key);

  @override
  State<Reload_Home> createState() => _Reload_HomeState();
}

class _Reload_HomeState extends State<Reload_Home> {
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
      navigator: Tabbar_Driver(),
      durationInSeconds: 3,
      loaderColor: Colors.white,
    );
  }
}

class Loading_Driver_List extends StatefulWidget {
  Loading_Driver_List({Key? key}) : super(key: key);

  @override
  State<Loading_Driver_List> createState() => _Loading_Driver_ListState();
}

class _Loading_Driver_ListState extends State<Loading_Driver_List> {
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
      navigator: Change_Driver(name, editDriverEmployee_id),
      durationInSeconds: 3,
      loaderColor: Colors.white,
    );
  }
}

class Loading_Change_Driver_Select extends StatefulWidget {
  Loading_Change_Driver_Select({Key? key}) : super(key: key);

  @override
  State<Loading_Change_Driver_Select> createState() =>
      _Loading_Change_Driver_SelectState();
}

class _Loading_Change_Driver_SelectState
    extends State<Loading_Change_Driver_Select> {
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
      navigator:
          //  Change_Driver_Select(
          //   name,
          // ),
          Change_Driver_Select(),
      durationInSeconds: 1,
      loaderColor: Colors.white,
    );
  }
}
