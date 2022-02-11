import 'package:cpac/server/api.dart';
import 'package:cpac/utility/my_alert.dart';
import 'package:cpac/view/truck_driver/loading_driver.dart';
import 'package:cpac/view/truck_driver/login_truck_driver.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

var Driver_ProfileUser;
Future<void> GetapiDriverUser(BuildContext context, result_token) async {
  var dio = Dio();
  String url = apiDriverUser;
  final response = await dio.get(url,
      options: Options(headers: {'Authorization': 'Token $result_token'}));
  var result = response.data['results'][0];
  if (response.data['status_code'][0]['code'] == "200") {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => Loading_Driver()),
        (Route<dynamic> route) => false);
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

    Driver_CouponDetail = result;
    if (Driver_CouponDetail['is_refuel'] == 0) {
      Status_GasStation = '(เติมอู่)';
    } else {
      Status_GasStation = '(เติมปั๊มนอก)';
    }
  } else {
    Driver_CouponDetail =
        Counpon_Null(context, 'คูปองได้ถูกใช้ไปเรียบรอยแล้ว!!!');
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
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (context) => Loading_Chang_Password_Driver()),
          (Route<dynamic> route) => false);
    }
  } on Exception catch (e) {
    print(e);
  }
}
