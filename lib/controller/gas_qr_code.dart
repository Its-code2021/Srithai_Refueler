// ignore_for_file: non_constant_identifier_names
import 'package:cpac/controller/user_profile.dart';
import 'package:cpac/server/api.dart';
import 'package:cpac/utility/date_time.dart';
import 'package:cpac/utility/my_alert.dart';
import 'package:cpac/view/gas_station/gas_loading_page.dart';
import 'package:cpac/view/gas_station/gas_tabel_all.dart';
import 'package:cpac/view/login_pump_gas.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

var QrCode;
Future<void> GetapiQrCodeGas(qrcode, BuildContext context) async {
  String url = apiQrCodePump;
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
      print(result);
      print(Profile['fullname']);
      Profile['fullname'];
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Gas_Loading_Page()),
          (Route<dynamic> route) => false);
      QrCode = result;
    } else if (status_code == '404') {
      AlertScanQrcode_Gas(context);
    } else if (status_code == '201') {
      var OilDetail_id = result;
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Loading_Page_Detail_Gas()),
          (Route<dynamic> route) => false);
      GetBilDetail_Gas(OilDetail_id);
      PostQrcodeGas_Agein(OilDetail_id);
    }
  } on Exception catch (e) {
    print(e);
  }
}

Future<void> PostapiGasQrCodeNumber(qrcode, BuildContext context) async {
  String url = apiQrCodeNumberPump;
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
      print(Profile['fullname']);
      Profile['fullname'];
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Gas_Loading_Page()),
          (Route<dynamic> route) => false);
      QrCode = result;
    } else if (status_code == '404') {
      AlertQrCodeMessage_Error(context);
    } else if (status_code == '201') {
      var OilDetail_id = result;
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Loading_Page_Detail_Gas()),
          (Route<dynamic> route) => false);
      PostQrcodeGas_Agein(OilDetail_id);
    }
  } on Exception catch (e) {
    print(e);
  }
}

var Gas_Details;
var OilDetail_id;
Future<void> PostOilConfrimGas_ADD(BuildContext context, Qr_confrim) async {
  String url = apiConfrimRefulOilPump;
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
      String url = '$apiRefuelDetailPump$OilDetail_id';
      Dio dio = new Dio();
      Response response = await dio.get(
        url,
        options: Options(headers: {'Authorization': 'Token $Tokens_all'}),
      );
      print("response $response");
      print("OilConfrim::::$Tokens_all");
      print("OilDetail_id::::$OilDetail_id");
      var result = response.data['results'][0];
      Gas_Details = result;
      // Tabel_Staff_detail();
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Loading_Page_Detail_Gas()),
          (Route<dynamic> route) => false);
    }
  } else if (status_code["code"] == "404") {
    Counpon_OilRefuel(context, "คูปองนี้ได้ถูกใช้เติมไปแล้ว");
    print('ERROR');
  }
  print('ERROR');
}

var ConfirmRefuel;
Future<void> PostGasConfirmRefuelAmount(
    BuildContext context, id, refuel_amount, images) async {
  String url = apiPumpConfirmRefuelAmount;
  Dio dio = Dio();
  Response response = await dio.post(url,
      options: Options(headers: {
        'Authorization': 'Token $Tokens_all',
      }),
      data: {
        "id": id,
        "refuel_amount": refuel_amount,
        "images": images,
      });
  print('response:::::$response');
  var result = response.data['results'][0];
  var status_code = response.data['status_code'][0];
  if (status_code['code'] == '200') {
    GetapiHeader(token);
    GetToken(token);
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => Loading_Page_Bill_Amount()),
        (Route<dynamic> route) => false);
  }
  GetBilDetail_Gas(id);
  print('sest:::::$result');
  print('status_code:::::$status_code');
  print(GetBilDetail_Gas(id));
  ConfirmRefuel = result;
}

Future<void> PostQrcodeGas_Agein(OilDetail_id) async {
  String url = '$apiRefuelDetailPump$OilDetail_id';
  Dio dio = new Dio();
  Response response = await dio.get(
    url,
    options: Options(headers: {'Authorization': 'Token $Tokens_all'}),
  );
  var result = response.data['results'][0];
  Gas_Details = result;
  Tabel_Gas_detail_draw();
}

Future<void> PostQrcodeGas_Agein_reload(
    BuildContext context, OilDetail_id) async {
  String url = '$apiRefuelDetailPump$OilDetail_id';
  Dio dio = new Dio();
  Response response = await dio.get(
    url,
    options: Options(headers: {'Authorization': 'Token $Tokens_all'}),
  );
  var result = response.data['results'][0];
  print(result);
  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => Loading_Page_Detail_Gas()),
      (Route<dynamic> route) => false);
  Gas_Details = result;
  Tabel_Gas_detail_draw();
}

var BilDetail;
Future<void> GetBilDetail_Gas(id) async {
  String url = '$apiPumprefuelBillDetail$id';
  Dio dio = new Dio();
  Response response = await dio.get(
    url,
    options: Options(headers: {'Authorization': 'Token $Tokens_all'}),
  );
  var result = response.data['results'][0];
  BilDetail = result;
  Tabel_Bill_Amount();
  print('Test:::::$BilDetail');
}

var ConfirmtBilAmount;
Future<void> PostConfirmtBilAmount(BuildContext context, String id,
    String bill_amount, String oil_rate) async {
  String url = apiPumpConfirmBillAmount;
  Dio dio = new Dio();
  Response response = await dio.post(url,
      options: Options(headers: {'Authorization': 'Token $Tokens_all'}),
      data: {"id": id, "bill_amount": bill_amount, "oil_rate": oil_rate});
  var result = response.data['results'][0];
  var status_code = response.data["status_code"][0]["code"];
  if (status_code == '200') {
    ConfirmtBilAmount = result;
    GetBin_Detail_Gas(id);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Loading_Bin_History_Detail()),
    );
  }

  print('bill_amount:::::$ConfirmtBilAmount');
}

Future<void> PostConfirmtBilAmount_History(BuildContext context, String id,
    String bill_amount, String oil_rate) async {
  String url = apiPumpConfirmBillAmount;
  Dio dio = new Dio();
  Response response = await dio.post(url,
      options: Options(headers: {'Authorization': 'Token $Tokens_all'}),
      data: {"id": id, "bill_amount": bill_amount, "oil_rate": oil_rate});
  var result = response.data['results'][0];
  var status_code = response.data["status_code"][0]["code"];
  if (status_code == '200') {
    ConfirmtBilAmount = result;
    GetBin_Detail_Gas(id);
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => Loading_Bin_History_Detail_Again()),
    );
  }

  print('bill_amount:::::$ConfirmtBilAmount');
}

var History_Refuel;
var BTW_date;
Future<void> PostPumpHistoryRefue(startdate, enddate) async {
  String url = apiPumpHistoryRefue;
  Dio dio = new Dio();
  Response response = await dio.post(url,
      options: Options(headers: {'Authorization': 'Token $Tokens_all'}),
      data: {
        "startdate": startdate,
        "enddate": enddate,
      });
  var result = response.data['results'];
  var result_date = response.data['data'];
  History_Refuel = result;
  BTW_date = result_date;
  print('History_Refuel:::::$History_Refuel');
  print('History_Refuel:::::$BTW_date');
}

var History_Detail;
Future<void> GetHistory_Detail_Gas(History_id) async {
  String url = '$apiPumprefuelBillDetail$History_id';
  Dio dio = new Dio();
  Response response = await dio.get(
    url,
    options: Options(headers: {'Authorization': 'Token $Tokens_all'}),
  );
  var result = response.data['results'][0];
  History_Detail = result;

  print('History_Detail:::::$History_Detail');
}

var Bin_Detail;
Future<void> GetBin_Detail_Gas(Bin_Detail_id) async {
  String url = '$apiPumprefuelBillDetail$Bin_Detail_id';
  Dio dio = new Dio();
  Response response = await dio.get(
    url,
    options: Options(headers: {'Authorization': 'Token $Tokens_all'}),
  );
  var result = response.data['results'][0];
  var status_code = response.data["status_code"][0]["code"];
  if (status_code == '200') {
    Bin_Detail = result;
  }
  print('Bin_Detail:::::$Bin_Detail');
}

var Bin_history_detail;
Future<void> GetBin_history_detail_Gas(
    BuildContext context, Bin_history_id, Bin_Amount) async {
  String url = '$apiPumprefuelBillDetail$Bin_history_id';
  Dio dio = new Dio();
  Response response = await dio.get(
    url,
    options: Options(headers: {'Authorization': 'Token $Tokens_all'}),
  );
  var result = response.data['results'][0];
  var status_code = response.data["status_code"][0]["code"];
  if (status_code == '200') {
    if (Bin_Amount != 0 && Bin_Amount != '0') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Loading_Bin__Detail()),
      );
    } else {
      OilDetail_id = Bin_history_id;
      GetBilDetail_Gas(Bin_history_id);
      PostQrcodeGas_Agein(OilDetail_id);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Loading_Bin_Amount_History()),
      );
    }
    Bin_history_detail = result;
  }
  print('Bin_Detail:::::$Bin_Amount');
  print('Bin_Detail:::::$Bin_history_detail');
}

Future<void> GetBin_history_detail_Gas_reload(
    BuildContext context, Bin_history_id, Bin_Amount) async {
  String url = '$apiPumprefuelBillDetail$Bin_history_id';
  Dio dio = new Dio();
  Response response = await dio.get(
    url,
    options: Options(headers: {'Authorization': 'Token $Tokens_all'}),
  );
  var result = response.data['results'][0];
  var status_code = response.data["status_code"][0]["code"];
  if (status_code == '200') {
    if (Bin_Amount != 0 && Bin_Amount != '0') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Loading_Bin__Detail()),
      );
    } else {
      OilDetail_id = Bin_history_id;
      GetBilDetail_Gas(Bin_history_id);
      PostQrcodeGas_Agein(OilDetail_id);
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Loading_Page_Bill_Amount()),
          (Route<dynamic> route) => false);
    }
    Bin_history_detail = result;
  }
  print('Bin_Detail:::::$Bin_Amount');
  print('Bin_Detail:::::$Bin_history_detail');
}

var SendMail;
Future<void> GetSendMail_Gas(BuildContext context, startdates, enddates) async {
  String url = '$apiSendEmail&sdate=$startdates&edate=$enddates';
  Dio dio = Dio();
  Response response = await dio.get(
    url,
    options: Options(headers: {'Authorization': 'Token $Tokens_all'}),
  );
  var result = response.data;
  if (result != '') {
    AlertSendDone(context);
    Future.delayed(Duration(seconds: 1), () {
      Navigator.pop(context);
    });

    print('result:::::$result');
  }
}

Future<void> AlertSendDone(BuildContext context) async {
  showDialog(
    context: context,
    builder: (context) => MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
      child: AlertDialog(
        actions: [
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Column(
              children: [
                Center(
                  child: Column(
                    children: [
                      const Icon(
                        Icons.check_circle_outline,
                        color: Colors.green,
                        size: 40,
                      ),
                      const Text(
                        'ส่งเมลไปยัง ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Container(
                        height: 5,
                      ),
                      Text(Profile['email'].toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[900])),
                      Container(
                        height: 5,
                      ),
                      const Text(
                        'สำเสร็จ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
