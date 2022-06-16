import 'dart:io';

import 'package:cpac/server/api.dart';
import 'package:cpac/utility/my_alert.dart';
import 'package:cpac/view/driver/staff_done.dart';
import 'package:cpac/view/truck_driver/change_driver_select.dart';
import 'package:cpac/view/truck_driver/frist_usertruck_login.dart';
import 'package:cpac/view/truck_driver/loading_driver.dart';
import 'package:cpac/view/truck_driver/login_truck_driver.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

var Driver_ProfileUser;
Future<void> GetapiDriverUser(
    BuildContext context, result_token, device_model) async {
  var dio = Dio();
  String url = apiDriverUser;
  final response = await dio.get(url,
      options: Options(headers: {'Authorization': 'Token $result_token'}));
  var result = response.data['results'][0];
  if (response.data['status_code'][0]['code'] == "200") {
    if (result['frist_login'] == 0) {
      if (result['device_model'] == device_model) {
        GetapiDriverDouponList(context, result_token);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => Loading_Driver()),
            (Route<dynamic> route) => false);
      } else {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => Btn_Logout(context)),
            (Route<dynamic> route) => false);
      }
    } else {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Frist_UserTruck_Login()),
          (Route<dynamic> route) => false);
    }
  }
  Driver_ProfileUser = result;
  print(Driver_ProfileUser);
  print('Token::: $result_token');
}

Future<void> GetConfrimRememberDriverUser(
    BuildContext context, result_token, device_model) async {
  var dio = Dio();
  String url = apiDriverUser;
  final response = await dio.get(url,
      options: Options(headers: {'Authorization': 'Token $result_token'}));
  var result = response.data['results'][0];
  if (response.data['status_code'][0]['code'] == "200") {
    if (result['device_model'] == device_model) {
      if (result['frist_login'] == 0) {
        GetapiDriverUser(context, result_token, device_model);
        // Navigator.of(context).pushAndRemoveUntil(
        //     MaterialPageRoute(builder: (context) => Loading_Driver()),
        //     (Route<dynamic> route) => false);
      } else {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => Frist_UserTruck_Login()),
            (Route<dynamic> route) => false);
      }
    }
  } else {
    myAlert_2(context, "เข้าสู่ระบบไม่ได้เนื่องจากมีอุปกรณ์อื่นใช้งานอยู่");
  }
  Driver_ProfileUser = result;
  print(Driver_ProfileUser);
  print('Token::: $result_token');
}

var status_code;
var Driver_CouponList;
Future<void> GetapiDriverDouponList(BuildContext context, result_token) async {
  var dio = Dio();
  String url = apiDriverCouponList;
  final response = await dio.get(url,
      options: Options(headers: {'Authorization': 'Token $result_token'}));
  var result = response.data['results'];
  status_code = response.data['status_code'][0]['code'];
  if (status_code == "200") {
    Driver_CouponList = result;
  } else if (response.data['status_code'][0]['code'] == "404") {
    Driver_CouponList[0] = 'ยังไม่มีรายการคูปอง';
  }
  print('Coupon:::: $Driver_CouponList');
}

Future<void> GetapiDriverDouponListReload(
    BuildContext context, result_token) async {
  var dio = Dio();
  String url = apiDriverCouponList;
  final response = await dio.get(url,
      options: Options(headers: {'Authorization': 'Token $result_token'}));
  var result = response.data['results'];
  status_code = response.data['status_code'][0]['code'];
  if (status_code == "200") {
    Driver_CouponList = result;
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => Reload_Home()),
        (route) => false);
  } else if (response.data['status_code'][0]['code'] == "404") {
    Driver_CouponList[0] = 'ยังไม่มีรายการคูปอง';
  }
  print('Coupon:::: $Driver_CouponList');
}

var Driver_CouponDetail;
var Status_GasStation;
Future<void> GetHistory_Detail_Gas(BuildContext context, Driver_id) async {
  String url = '$apiDriverCouponDetail$Driver_id';
  Dio dio = new Dio();
  Response response = await dio.get(
    url,
    options: Options(headers: {'Authorization': 'Token $result_token'}),
  );
  var result = response.data['results'][0];
  if (response.data['status_code'][0]['code'] == "200") {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => Loading_Driver_Coupon_Detail()),
        (route) => false);
    print('Driver_id:::::$Driver_id');
    Driver_CouponDetail = result;
    if (Driver_CouponDetail['is_refuel'] == 0) {
      Status_GasStation = 'ปั้มบริษัท(เติมอู่)';
    } else {
      Status_GasStation = '(เติมปั๊มนอก)';
    }
  } else {
    Driver_CouponDetail =
        Counpon_Null(context, 'คูปองได้ถูกใช้ไปเรียบร้อยแล้ว!!!');
  }
  print('Driver_id:::::$Driver_id');
  print('Driver_CouponDetail:::::$Driver_CouponDetail');
}

var RecheckRefuel_Driver;
Future<void> GetapiRecheckRefuel(BuildContext context, Driver_id) async {
  String url = '$apiRecheckRefuel$Driver_id';
  Dio dio = new Dio();
  Response response = await dio.get(
    url,
    options: Options(headers: {'Authorization': 'Token $result_token'}),
  );
  var result = response.data['results'];
  RecheckRefuel_Driver = result;
  if (response.data['status_code'][0]['code'] == "200") {
    GetapiDriverDouponList(context, result_token);
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => Loading_Driver()),
        (route) => false);
  } else {
    result = 0;
  }
}

Future<void> PosapiChangPasswordDriver(BuildContext context,
    String _oldpasswordControllers, String _newpasswordControllers) async {
  String url = apiChangPasswordDriver;
  TextEditingController _usernameControllers = TextEditingController();
  TextEditingController _passwordControllers = TextEditingController();
  bool _isChecked_Btn = true;
  var Btn_Driver = 1;
  void _Btn_DriverRemeberme(value) {
    print("Btn_Driver");
    _isChecked_Btn = value;
    SharedPreferences.getInstance().then(
      (prefs) {
        prefs.setString('Btn_Driver', Btn_Driver.toString());
      },
    );
    _isChecked_Btn = value;
  }

  try {
    Dio dio = new Dio();
    Response response = await dio.post(url,
        options: Options(headers: {'Authorization': 'Token $result_token'}),
        data: {
          "old_password": _oldpasswordControllers,
          "new_password": _newpasswordControllers,
        });
    var status_code = response.data["status_code"][0]["code"];
    var result = response.data['results'][0];
    print(status_code);
    if (status_code == '200') {
      print(result);
      final _prefs = await SharedPreferences.getInstance();
      await _prefs.clear();
      bool _isChecked_Btn = true;
      _Btn_DriverRemeberme(_isChecked_Btn);
      @override
      void initState() {
        _usernameControllers.clear();
        _passwordControllers.clear();
        result_token = '';
      }

      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (context) => Loading_Chang_Password_Driver()),
          (Route<dynamic> route) => false);
    }
  } on Exception catch (e) {
    print(e);
  }
}

Future<void> GetDevice() async {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  if (Platform.isAndroid) {
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    device_model = androidInfo.model.toString();

    print('device_model Android:::$device_model');
  } else if (Platform.isIOS) {
    IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
    device_model = iosDeviceInfo.identifierForVendor.toString();
    print('device_model IOS:::$device_model');
  }
}

var Driver_List_Chang;
Future<void> GetapiDriver_List(BuildContext context) async {
  String url = '$apiDriver_List';
  Dio dio = new Dio();
  Response response = await dio.get(
    url,
    options: Options(headers: {'Authorization': 'Token $result_token'}),
  );
  var result = response.data['results'];
  Driver_List_Chang = result;
  if (response.data['status_code'][0]['code'] == "200") {
    print('Driver_List::$Driver_List_Chang');
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => Loading_Driver_List()),
        (route) => false);
  } else {
    AlertDriver_list(context);
  }
}

var Search_Driver;
Future<void> GetapiSearch_Driver(BuildContext context, String text) async {
  String url = '$apiDriver_Search$text';
  Dio dio = new Dio();
  Response response = await dio.get(
    url,
    options: Options(headers: {'Authorization': 'Token $result_token'}),
  );
  var result = response.data['results'];
  Search_Driver = result;
  if (response.data['status_code'][0]['code'] == "200") {
    print('Search_Driver::$Search_Driver');
    Search_Driver;
  } else {
    AlertDriver_Search(context);
  }
}

Future<void> PostapiDriver_Change(
    BuildContext context,
    var DriverEmployee_id,
    var eDriverEmployee_id,
    String eDriver_remark,
    var eDriverEmployee_at,
    coupon_id_driver) async {
  String url = apiDriver_Change;
  Dio dio = new Dio();
  Response response = await dio.post(url,
      options: Options(headers: {'Authorization': 'Token $result_token'}),
      data: {
        "id": coupon_id_driver,
        "DriverEmployee_id": eDriverEmployee_id,
        "eDriverEmployee_id": DriverEmployee_id,
        "eDriver_remark": eDriver_remark,
        "eDriverEmployee_at": eDriverEmployee_at,
      });
  var result = response.data['results'][0];
  var status_code = response.data['status_code'][0];
  if (status_code['code'] == '200') {
    AlertDriver_Change_Done(context);
    GetapiDriverDouponList(context, result_token);
    // Navigator.of(context).pushAndRemoveUntil(
    //     MaterialPageRoute(builder: (context) => Staff_Done()),
    //     (Route<dynamic> route) => false);
    print(result);
  } else {
    print('พขร เก่า ($DriverEmployee_id)');
    print('พขร ใหม่ ($eDriverEmployee_id)');
    print('หมายเหตุ ($eDriver_remark)');
    print('วันที่เปลียน ($eDriverEmployee_at)');
  }
}
