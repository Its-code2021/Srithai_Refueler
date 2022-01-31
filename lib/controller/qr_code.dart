import 'package:cpac/controller/user_profile.dart';
import 'package:cpac/server/api.dart';
import 'package:cpac/utility/my_alert.dart';
import 'package:cpac/utility/status_all.dart';
import 'package:cpac/view/driver/loading_page.dart';
import 'package:cpac/view/driver/qr_code.dart';
import 'package:cpac/view/driver/refueling_all.dart';
import 'package:cpac/view/driver/staff_done.dart';
import 'package:cpac/view/driver/tabel_all.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

var QrCode;
Future<void> GetapiQrCode(qrcode, BuildContext context) async {
  String url = apiQrCode;
  try {
    Dio dio = new Dio();
    Response response = await dio.post(url,
        options: Options(headers: {'Authorization': 'Token $Tokens_all'}),
        data: {
          "code": qrcode,
        });
    var status_code = response.data["status_code"][0]["code"];
    var result = response.data['results'][0];
    if (status_code == '200') {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Loading_pang()),
          (Route<dynamic> route) => false);
      QrCode = result;
    } else if (status_code == '404') {
      AlertScanQrcode(context);
    } else if (status_code == '201') {
      var OilDetail_id = result;
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Loading_pang_Detail()),
          (Route<dynamic> route) => false);
      PostQrcode_Agein(OilDetail_id);
    }
  } on Exception catch (e) {
    print(e);
  }
}

Future<void> PostapiQrCodeNumber(qrcode, BuildContext context) async {
  String url = apiQrCodeNumber;
  try {
    Dio dio = new Dio();
    Response response = await dio.post(url,
        options: Options(headers: {'Authorization': 'Token $Tokens_all'}),
        data: {
          "code": qrcode,
        });
    var status_code = response.data["status_code"][0]["code"];
    var result = response.data['results'][0];
    if (status_code == '200') {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Loading_pang()),
          (Route<dynamic> route) => false);
      QrCode = result;
    } else if (status_code == '404') {
      AlertQrCodeMessage_Error(context);
    } else if (status_code == '201') {
      var OilDetail_id = result;
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Loading_pang_Detail()),
          (Route<dynamic> route) => false);
      PostQrcode_Agein(OilDetail_id);
    }
  } on Exception catch (e) {
    print(e);
  }
}

var Oil_Details;
var OilDetail_id;
Future<void> PostOilConfrim_ADD(Qr_confrim) async {
  String url = apiConfrimRefulOil;
  Dio dio = new Dio();
  Response response = await dio.post(url,
      options: Options(headers: {'Authorization': 'Token $Tokens_all'}),
      data: {
        "code": Qr_confrim,
      });

  print("response $response");
  var result = response.data['results'][0];
  OilDetail_id = result;
  if (OilDetail_id != null) {
    String url = '$apiRefuelDetail$OilDetail_id';
    Dio dio = new Dio();
    Response response = await dio.get(
      url,
      options: Options(headers: {'Authorization': 'Token $Tokens_all'}),
    );
    print("response $response");
    print("OilConfrim::::$Tokens_all");
    var result = response.data['results'][0];
    Oil_Details = result;
    Tabel_Staff_detail();
  }
}

var ConfirmRefuel;
Future<void> PostConfirmRefuelAmount(BuildContext context, String id,
    String refuel_amount, String images) async {
  String url = apiConfirmRefuelAmount;

  Dio dio = new Dio();
  Response response = await dio.post(url,
      options: Options(headers: {'Authorization': 'Token $Tokens_all'}),
      data: {
        "id": id,
        "refuel_amount": refuel_amount,
        "images": images,
      });
  var result = response.data['results'][0];
  var status_code = response.data['status_code'][0];
  if (status_code['code'] == '200') {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => Staff_Done()),
        (Route<dynamic> route) => false);
  }
  print('status_code:::::$status_code');
  ConfirmRefuel = result;
}

Future<void> PostQrcode_Agein(OilDetail_id) async {
  String url = '$apiRefuelDetail$OilDetail_id';
  Dio dio = new Dio();
  Response response = await dio.get(
    url,
    options: Options(headers: {'Authorization': 'Token $Tokens_all'}),
  );
  var result = response.data['results'][0];
  Oil_Details = result;
  Tabel_Staff_detail();
}
