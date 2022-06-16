import 'package:cpac/controller/driver_employee.dart';
import 'package:cpac/controller/gas_qr_code.dart';
import 'package:cpac/controller/qr_code.dart';
import 'package:cpac/view/driver/loading_page.dart';
import 'package:cpac/view/driver/qr_code.dart';
import 'package:cpac/view/driver/staff_draw_user.dart';
import 'package:cpac/view/driver/tabbar_driver_home.dart';
import 'package:cpac/view/gas_station/gas_loading_page.dart';
import 'package:cpac/view/truck_driver/change_driver.dart';
import 'package:cpac/view/truck_driver/change_driver_select.dart';
import 'package:cpac/view/truck_driver/loading_driver.dart';
import 'package:cpac/view/truck_driver/login_truck_driver.dart';
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
                'กรุณากรอกจำนวนลิตร',
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

Future<void> AlertOilTotal_Null(BuildContext context) async {
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
                'กรุณากรอกจำนวนลิตรที่เติมจริง',
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

Future<void> AlertOilRate_Null(BuildContext context) async {
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
                'ไม่สามารถกรอกจำนวนลิตรที่เติมจริงเกินที่กำหนดได้',
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

Future<void> chang_password_new(BuildContext context, String message) async {
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

Future<void> chang_password_old(BuildContext context, String message) async {
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

Future<void> Counpon_Null(BuildContext context, String message) async {
  showDialog(
      context: context,
      builder: (context) => MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
            child: AlertDialog(
              content: Text(
                message,
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
              ),
              actions: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue[900],
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Center(child: Text('ยืนยัน')),
                )
              ],
            ),
          ));
}

Future<void> Counpon_OilRefuel(BuildContext context, String message) async {
  showDialog(
      context: context,
      builder: (context) => MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
            child: AlertDialog(
              content: Text(
                message,
                textAlign: TextAlign.center,
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
              ),
              actions: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue[900],
                  ),
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => Loading_Page_Date()),
                        (Route<dynamic> route) => false);
                  },
                  child: Center(child: Text('ยืนยัน')),
                )
              ],
            ),
          ));
}

Future<void> Counpon_OilRefuel_PumpIn(
    BuildContext context, String message) async {
  showDialog(
      context: context,
      builder: (context) => MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
            child: AlertDialog(
              content: Text(
                message,
                textAlign: TextAlign.center,
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
              ),
              actions: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue[900],
                  ),
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => TabBar_Menu_Driver_Home()),
                        (Route<dynamic> route) => false);
                  },
                  child: Center(child: Text('ยืนยัน')),
                )
              ],
            ),
          ));
}

Future<void> AlertDriver_list(BuildContext context) async {
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
                'ไม่สามารถเปลี่ยน พขร ได้เนื่องจากไม่มี พขร แทน',
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

// Future<void> AlertDriver_list_Select(BuildContext context) async {
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: Center(child: Text('เลือก พขร')),
//         content: Change_Driver_Select(),
//       );
//     },
//   );
// }

Future<void> AlertDriver_Remark(BuildContext context) async {
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
                'กรุณาระบุหมายเหตุที่เปลี่ยน พขร.',
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

Future<void> AlertDriver_Select_Driver(BuildContext context) async {
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
                'กรุณาเลือก พขร. ',
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

Future<void> AlertDriver_Change_Done(BuildContext context) async {
  showDialog(
    context: context,
    builder: (context) => MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
      child: AlertDialog(
        actions: [
          Column(
            children: [
              Icon(
                Icons.check,
                size: 50,
                color: Colors.green,
              ),
              Container(
                height: 10,
              ),
              const Text(
                'เปลี่ยน พขร. สำเร็จ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                textAlign: TextAlign.center,
              ),
              Container(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  GetapiDriverUser(context, result_token, device_model);
                  GetapiDriverDouponList(context, result_token);
                  // Navigator.of(context).pushAndRemoveUntil(
                  //     MaterialPageRoute(builder: (context) => Loading_Driver()),
                  //     (Route<dynamic> route) => false);
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
