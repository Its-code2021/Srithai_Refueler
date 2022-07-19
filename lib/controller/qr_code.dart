import 'package:cpac/controller/user_profile.dart';
import 'package:cpac/server/api.dart';
import 'package:cpac/utility/my_alert.dart';
import 'package:cpac/utility/status_all.dart';
import 'package:cpac/view/driver/inpump_screenshot_bin.dart';
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
    var generator = response.data['generator'];
    if (status_code == '200') {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Loading_pang()),
          (Route<dynamic> route) => false);
      QrCode = result;
    } else if (status_code == '404') {
      AlertScanQrcode(context);
    } else if (status_code == '201') {
      var OilDetail_id = result;
      if (generator == 0) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => Loading_pang_Detail()),
            (Route<dynamic> route) => false);
        PostQrcode_Agein(OilDetail_id);
      } else {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => Loading_pang_Detail_GEN()),
            (Route<dynamic> route) => false);
        PostQrcode_Agein(OilDetail_id);
      }
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
    var generator = response.data['generator'];
    if (status_code == '200') {
      print("test:: $QrCode");
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Loading_pang()),
          (Route<dynamic> route) => false);
      QrCode = result;
    } else if (status_code == '404') {
      AlertQrCodeMessage_Error(context);
    } else if (status_code == '201') {
      var OilDetail_id = result;
      if (generator == 0) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => Loading_pang_Detail()),
            (Route<dynamic> route) => false);
        PostQrcode_Agein(OilDetail_id);
      } else {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => Loading_pang_Detail_GEN()),
            (Route<dynamic> route) => false);
        PostQrcode_Agein(OilDetail_id);
      }
    }
  } on Exception catch (e) {
    print(e);
  }
}

var Oil_Details;
var OilDetail_id;
Future<void> PostOilConfrim_ADD(BuildContext context, Qr_confrim) async {
  String url = apiConfrimRefulOil;
  Dio dio = new Dio();
  Response response = await dio.post(url,
      options: Options(headers: {'Authorization': 'Token $Tokens_all'}),
      data: {
        "code": Qr_confrim,
      });

  print("response $response");

  var status_code = response.data['status_code'][0];
  if (status_code['code'] == "200") {
    var result = response.data['results'][0];
    OilDetail_id = result;
    if (OilDetail_id != null) {
      String url = '$apiRefuelDetail$OilDetail_id';
      Dio dio = new Dio();
      Response response = await dio.get(
        url,
        options: Options(headers: {'Authorization': 'Token $Tokens_all'}),
      );
      print("responseTEST::: $response");
      print("OilConfrim::::$Tokens_all");
      var result = response.data['results'][0];
      Oil_Details = result;
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Loading_pang_Detail()),
          (Route<dynamic> route) => false);
      Tabel_Staff_detail();
    }
  } else {
    Counpon_OilRefuel_PumpIn(context, "คูปองนี้ได้ถูกกดเติมไปแล้ว");
    print('ERROR');
  }
}

Future<void> PostOilConfrim_ADD_GEN(BuildContext context, Qr_confrim) async {
  String url = apiConfrimRefulOil;
  Dio dio = new Dio();
  Response response = await dio.post(url,
      options: Options(headers: {'Authorization': 'Token $Tokens_all'}),
      data: {
        "code": Qr_confrim,
      });

  print("response $response");

  var status_code = response.data['status_code'][0];
  if (status_code['code'] == "200") {
    var result = response.data['results'][0];
    OilDetail_id = result;
    if (OilDetail_id != null) {
      String url = '$apiRefuelDetail$OilDetail_id';
      Dio dio = new Dio();
      Response response = await dio.get(
        url,
        options: Options(headers: {'Authorization': 'Token $Tokens_all'}),
      );

      print("OilConfrim::::$Tokens_all");
      var result = response.data['results'][0];
      Oil_Details = result;
      print("responseTEST::: $Oil_Details");
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Loading_pang_Detail_GEN()),
          (Route<dynamic> route) => false);
      Tabel_Staff_detail();
    }
  } else {
    Counpon_OilRefuel_PumpIn(context, "คูปองนี้ได้ถูกกดเติมไปแล้ว");
    print('ERROR');
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
  var pump_detail_id = id;
  if (status_code['code'] == '200') {
    GetBin_Detail_Pump(context, pump_detail_id);
  }
  print('status_code:::::$status_code');
  ConfirmRefuel = result;
}

Future<void> PostConfirmRefuelAmount_GEN(
    BuildContext context,
    String id,
    String refuel_gen,
    String refuel_truck,
    String refuel_amount,
    String images) async {
  String url = apiConfirmRefuelAmount_GEN;

  Dio dio = new Dio();
  Response response = await dio.post(url,
      options: Options(headers: {'Authorization': 'Token $Tokens_all'}),
      data: {
        "id": id,
        "refuel_gen": refuel_gen,
        "refuel_truck": refuel_truck,
        "refuel_amount": refuel_amount,
        "images": images,
      });
  var result = response.data['results'][0];
  var status_code = response.data['status_code'][0];
  var pump_detail_id = id;
  if (status_code['code'] == '200') {
    GetBin_Detail_Pump(context, pump_detail_id);
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

var Bin_Detail_pump;
Future<void> GetBin_Detail_Pump(BuildContext context, pump_detail_id) async {
  String url = '$apiPumprefuelBillDetail$pump_detail_id';
  Dio dio = new Dio();
  Response response = await dio.get(
    url,
    options: Options(headers: {'Authorization': 'Token $Tokens_all'}),
  );
  var result = response.data['results'][0];
  var status_code = response.data["status_code"][0]["code"];
  if (status_code == '200') {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
            builder: (context) => inpump_screenshot_bin(pump_detail_id)),
        (Route<dynamic> route) => false);
    Bin_Detail_pump = result;
  }
  print('Bin_Detail:::::$Bin_Detail_pump');
}
