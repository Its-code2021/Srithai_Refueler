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
  var results = response.data['results'][0];
  var status_code = response.data['status_code'][0];
  if (status_code['code'] == '200') {
    if (results != null && results != '') {
      print('results::::$results');
      GetapiHeader(token);
      GetToken(token);
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Loading_Page_Bill_Amount()),
          (Route<dynamic> route) => false);
    } else {}
  }
  GetBilDetail_Gas(id);
  print('sest:::::$results');
  print('status_code:::::$status_code');
  print(GetBilDetail_Gas(id));
  ConfirmRefuel = results;
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
      Gas_Details();
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

// รายการรับชำระเงิน
var Paymant_List;
Future<void> GetPump_Paymant_List() async {
  String url = '$apiPump_Paymant_List';
  Dio dio = new Dio();
  Response response = await dio.get(
    url,
    options: Options(headers: {'Authorization': 'Token $Tokens_all'}),
  );
  var result = response.data['results'];
  if (response.data['status_code'][0]['code'] == "200") {
    Paymant_List = result;
  } else {
    Paymant_List = "";

    // Driver_CouponDetail =
    //     Counpon_Null(context, 'คูปองได้ถูกใช้ไปเรียบร้อยแล้ว!!!');
  }
  print('Paymant_List:::::$Paymant_List');
}

Future<void> GetPump_Paymant_List_Again(BuildContext context) async {
  String url = '$apiPump_Paymant_List';
  Dio dio = new Dio();
  Response response = await dio.get(
    url,
    options: Options(headers: {'Authorization': 'Token $Tokens_all'}),
  );
  var result = response.data['results'];
  if (response.data['status_code'][0]['code'] == "200") {
    Paymant_List = result;
    GetPump_Paymant_List();
    GetPump_Paymant_List_History();
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
            builder: (context) => Loading_Gas_TabBar_Menu_Gas_Home_Payment()),
        (Route<dynamic> route) => false);
  } else {
    Paymant_List = "";
  }
  print('Paymant_List:::::$Paymant_List');
}

Future<void> GetPump_Paymant_List_BTN(BuildContext context) async {
  String url = '$apiPump_Paymant_List';
  Dio dio = new Dio();
  Response response = await dio.get(
    url,
    options: Options(headers: {'Authorization': 'Token $Tokens_all'}),
  );
  var result = response.data['results'];
  if (response.data['status_code'][0]['code'] == "200") {
    Paymant_List = result;
    GetPump_Paymant_List();
    GetPump_Paymant_List_History();
    AlertPaymeny_History(context);
    Future.delayed(
      Duration(seconds: 3),
      () {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (context) =>
                    Loading_Gas_TabBar_Menu_Gas_Home_Payment()),
            (Route<dynamic> route) => false);
      },
    );
  } else {
    Paymant_List = "";
    AlertPaymeny_History_Not(context);
    // Driver_CouponDetail =
    //     Counpon_Null(context, 'คูปองได้ถูกใช้ไปเรียบร้อยแล้ว!!!');
  }
  print('Paymant_List:::::$Paymant_List');
}

// รายละเอียดการชำระเงิน
var Paymant_List_Detail;
Future<void> GetPump_Paymant_List_Detail(
    BuildContext context, Paymant_List_Ids) async {
  String url = '$apiPump_Paymant_List_Detail$Paymant_List_Ids';
  Dio dio = new Dio();
  Response response = await dio.get(
    url,
    options: Options(headers: {'Authorization': 'Token $Tokens_all'}),
  );
  var result = response.data['results'][0];
  var status_code = response.data["status_code"][0]["code"];
  if (status_code == '200') {
    Paymant_List_Detail = result;
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => Loading_Gas_List_Payment_Detail()));
    print('Paymant_List_Id:::::$Paymant_List_Detail');
  } else {}
}

// ประวัติรายการรับชำระเงิน
var Paymant_List_History;
Future<void> GetPump_Paymant_List_History() async {
  String url = '$apiPump_Paymant_History';
  Dio dio = new Dio();
  Response response = await dio.get(
    url,
    options: Options(headers: {'Authorization': 'Token $Tokens_all'}),
  );
  var result = response.data['results'];
  if (response.data['status_code'][0]['code'] == "200") {
    Paymant_List_History = result;
  } else {
    Paymant_List_History = "";
  }
  print('Paymant_List_History:::::$Paymant_List_History');
}

// ประวัติรายละเอียดการชำระเงิน
var Paymant_List_History_Detail;
Future<void> GetPump_Paymant_List_History_Detail(
    BuildContext context, String paymant_list_history_ids) async {
  String url = '$apiPump_Paymant_History_Detail$paymant_list_history_ids';
  Dio dio = new Dio();
  Response response = await dio.get(
    url,
    options: Options(headers: {'Authorization': 'Token $Tokens_all'}),
  );
  var result = response.data['results'][0];
  var status_code = response.data["status_code"][0]["code"];
  if (status_code == '200') {
    Paymant_List_History_Detail = result;
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => Loading_Gas_List_Screenshot_Payment_History()));
    print('Paymant_List_History_Detail:::::$Paymant_List_History_Detail');
  } else {}
}

var Paymant_Update_Id;

Future<void> PostPumpPaymantUpdate(
  BuildContext context,
  Paymant_List_Detail_id,
) async {
  // ignore: unnecessary_string_interpolations
  String url = apiPump_Paymant_Update;
  print('$url');
  Dio dio = new Dio();
  Response response = await dio.post(url,
      options: Options(headers: {'Authorization': 'Token $Tokens_all'}),
      data: {
        "id": Paymant_List_Detail_id,
      });

  var result = response.data['results'];
  var status_code = response.data["status_code"][0]["code"];
  if (status_code == '200') {
    Paymant_Update_Id = result[0];
    GetPump_Paymant_Slip(context, Paymant_Update_Id);
    print('Paymant_List_Detail_id:::::$Paymant_Update_Id');
  } else {}
}

var Paymant_Slip_Detail;
Future<void> GetPump_Paymant_Slip(
    BuildContext context, Paymant_Update_Id) async {
  String url = '$apiPump_Paymant_Slip$Paymant_Update_Id';
  Dio dio = new Dio();
  Response response = await dio.get(
    url,
    options: Options(headers: {'Authorization': 'Token $Tokens_all'}),
  );
  var result = response.data['results'];
  if (response.data['status_code'][0]['code'] == "200") {
    Paymant_Slip_Detail = result;
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
            builder: (context) => Loading_Gas_List_Screenshot_Payment()),
        (Route<dynamic> route) => false);
  } else {
    Paymant_Slip_Detail = "";

    // Driver_CouponDetail =
    //     Counpon_Null(context, 'คูปองได้ถูกใช้ไปเรียบร้อยแล้ว!!!');
  }
  print('Paymant_Slip_Detail:::::$Paymant_Slip_Detail');
}

var Paymant_Slip_History_Detail;
Future<void> GetPump_Paymant_Slip_History(
    BuildContext context, Paymant_Update_Id) async {
  String url = '$apiPump_Paymant_Slip$Paymant_Update_Id';
  Dio dio = new Dio();
  Response response = await dio.get(
    url,
    options: Options(headers: {'Authorization': 'Token $Tokens_all'}),
  );
  var result = response.data['results'];
  if (response.data['status_code'][0]['code'] == "200") {
    Paymant_Slip_History_Detail = result;
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
            builder: (context) => Loading_Gas_List_Screenshot_Payment()),
        (Route<dynamic> route) => false);
  } else {
    Paymant_Slip_History_Detail = "";

    // Driver_CouponDetail =
    //     Counpon_Null(context, 'คูปองได้ถูกใช้ไปเรียบร้อยแล้ว!!!');
  }
  print('Paymant_Slip_Detail:::::$Paymant_Slip_Detail');
}

Future<void> AlertPaymeny_History(BuildContext context) async {
  showDialog(
    context: context,
    builder: (context) => MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
      child: AlertDialog(
        actions: [
          Column(
            children: [
              Container(
                height: 10,
              ),
              Center(child: CircularProgressIndicator()),
              Container(
                height: 10,
              ),
              const Text(
                'กรุณารอสักครู่',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ],
          )
        ],
      ),
    ),
  );
}

Future<void> AlertPaymeny_History_Not(BuildContext context) async {
  showDialog(
    context: context,
    builder: (context) => MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
      child: AlertDialog(
        actions: [
          Column(
            children: [
              Icon(
                Icons.error_outline,
                size: 50,
                color: Colors.red,
              ),
              Container(
                height: 10,
              ),
              const Text(
                'ไม่พบรายการรับชำระเงินค่าน้ำมัน',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                textAlign: TextAlign.center,
              ),
              Container(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Center(
                    child: Text(
                  'ตกลง',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
              ),
            ],
          )
        ],
      ),
    ),
  );
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
