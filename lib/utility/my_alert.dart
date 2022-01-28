import 'package:cpac/controller/gas_qr_code.dart';
import 'package:cpac/controller/qr_code.dart';
import 'package:cpac/view/driver/loading_page.dart';
import 'package:cpac/view/driver/qr_code.dart';
import 'package:cpac/view/driver/staff_draw_user.dart';
import 'package:cpac/view/gas_station/gas_loading_page.dart';
import 'package:flutter/material.dart';

Future<void> myAlert_2(BuildContext context, String message) async {
  showDialog(
      context: context,
      builder: (context) => MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
            child: AlertDialog(
              content: Text(message),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('ยืนยัน'),
                )
              ],
            ),
          ));
}

Future<void> AlertScanQrcode(BuildContext context) async {
  var OilDetail_id = null;
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
                      'คูปองนี้ไม่สามารถเติมได้',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                    Container(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => Loading_pang_QqCode()),
                            (Route<dynamic> route) => false);
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
          ));
}

Future<void> AlertScanQrcode_Gas(BuildContext context) async {
  var OilDetail_id = null;
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
                      'คูปองนี้ไม่สามารถเติมได้',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                    Container(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) =>
                                    Loading_Page_Gas_QqCode()),
                            (Route<dynamic> route) => false);
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
          ));
}

Future<void> AlertQrcodeScanAgin(BuildContext context, result) async {
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
                      'คูปองนี้ไม่สามารถเติมได้',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                    Container(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        var OilDetail_id = result;
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => Loading_pang_Detail()),
                            (Route<dynamic> route) => false);
                        PostQrcode_Agein(OilDetail_id);
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
          ));
}

Future<void> AlertDetailDraw(BuildContext context) async {
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
                      'กรุณากรอกจะจำนวนลิตรที่เติมจริง',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
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
          ));
}

Future<void> AlertQrCodeMessage(BuildContext context) async {
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
                      'กรุณากรอกเลขคิวอาร์โค้ด',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
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
          ));
}

Future<void> AlertQrCodeMessage_Error(BuildContext context) async {
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
                'คูปองนี้ไม่สามารถเติมได้',
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

Future<void> AlertDetailDrawGas(BuildContext context) async {
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
                      'กรุณาให้พนักงานขับรถลงชื่อรับทราบ',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
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
          ));
}

Future<void> AlertBillAmount_Null(BuildContext context) async {
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
                'กรุณากรอกจำนวนเงิน',
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
