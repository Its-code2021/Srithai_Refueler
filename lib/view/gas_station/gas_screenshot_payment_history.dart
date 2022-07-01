// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:cpac/controller/gas_qr_code.dart';
import 'package:cpac/view/gas_station/gas_loading_page.dart';
import 'package:cpac/view/gas_station/tabbar_gas%20home.dart';
import 'package:cpac/view/gas_station/tabbar_gas_home_payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart'; // In order to use RepaintBoundary, RenderRepaintBoundary

import 'dart:ui' as ui;
import 'dart:typed_data';

// This package is used to save screenshots to the gallery
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:intl/intl.dart';

class Gas_Screenshot_Payment_History extends StatefulWidget {
  const Gas_Screenshot_Payment_History(bin_detail_id, {Key? key})
      : super(key: key);

  @override
  _Gas_Screenshot_Payment_HistoryState createState() =>
      _Gas_Screenshot_Payment_HistoryState();
}

class _Gas_Screenshot_Payment_HistoryState
    extends State<Gas_Screenshot_Payment_History> {
  // This key is used for the RepaintBoundary widget
  final GlobalKey _key = GlobalKey();

  String _message = 'บันทึกใบจ่ายเงิน';

  // This function will be triggered when the button is pressed
  void _takeScreenshot() async {
    RenderRepaintBoundary boundary =
        _key.currentContext!.findRenderObject() as RenderRepaintBoundary;

    ui.Image image = await boundary.toImage();
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    if (byteData != null) {
      Uint8List pngBytes = byteData.buffer.asUint8List();

      // Saving the screenshot to the gallery
      final result = await ImageGallerySaver.saveImage(
          Uint8List.fromList(pngBytes),
          quality: 90,
          name: 'screenshot-${DateTime.now()}.png');

      if (result != "") {
        print('$result TEST+++');
        _canShowButton2 = true;
        AlertBinDoneS();
        GetPump_Paymant_List();
        GetPump_Paymant_List_History();
        Future.delayed(Duration(seconds: 2), () {
          setState(() {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (context) => Loading_Gas_List_Payment_History()),
                (Route<dynamic> route) => false);
          });
        });
      }

      setState(() {
        _message = 'บันทึกใบจ่ายเงินเรียบร้อย';
      });
    }
  }

  @override
  // void initState() {
  //   hideWidget();
  //   super.initState();
  // }

  bool _canShowButton = true;
  bool _canShowButton2 = false;
  bool _canShowButton4 = false;
  void hideWidget() {
    setState(() {
      _canShowButton = !_canShowButton;
      if (_canShowButton == false) {
        Future.delayed(Duration(seconds: 1), () {
          _takeScreenshot();
        });
      }
    });
  }

  void BtnBacks() {
    setState(() {
      _canShowButton4 = !_canShowButton4;
      if (_canShowButton4 == true) {
        print('testsssss $_canShowButton4');
        _canShowButton4 == true;
      }
    });
  }

  Future<void> AlertBinDoneS() async {
    showDialog(
      context: context,
      builder: (context) => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
        child: AlertDialog(
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Icon(
                    Icons.check_circle_outline,
                    color: Colors.green,
                    size: 40,
                  ),
                  Center(
                    child: Text(
                      'บันทึกใบจ่ายเงินสำเร็จ',
                      style: TextStyle(fontWeight: FontWeight.bold),
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

  Widget BtnBack() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.blue[900],
            minimumSize: const Size.fromHeight(
              50,
            ),
            //
          ),
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (context) => TabBar_Menu_Gas_Home_Payment()),
                (Route<dynamic> route) => false);
            print('กลับหน้าหลัก');
          },
          child: Text(
            'กลับหน้าหลัก',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: _key,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 10,
                ),
                Image.asset(
                  'images/001.png',
                ),
                // ignore: unnecessary_new
                new Padding(padding: EdgeInsets.all(8.0), child: new Divider()),
                // ignore: prefer_const_constructors
                Text(
                  'ใบจ่ายเงิน',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 10,
                ),
                Table(
                  columnWidths: const {
                    0: FlexColumnWidth(4),
                    1: FlexColumnWidth(4),
                  },
                  children: [
                    TableRow(children: [
                      Text(
                        'เลขที่:',
                        textAlign: TextAlign.end,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text(
                          Paymant_List_History_Detail['id'].toString(),
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff438EB9)),
                        ),
                      ),
                    ]),
                    TableRow(children: const [
                      Text(
                        '',
                      ),
                      Text(
                        '',
                      ),
                    ]),
                    TableRow(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'หน่วยงาน/กิจการ:',
                            textAlign: TextAlign.left,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Container(
                        width: 150,
                        padding: const EdgeInsets.only(
                          left: 5,
                        ),
                        child: Text(
                          Paymant_List_History_Detail['Site_name'].toString() +
                              '/' +
                              Paymant_List_History_Detail['Business_name']
                                  .toString(),
                          textAlign: TextAlign.start,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff438EB9)),
                        ),
                      ),
                    ]),
                    TableRow(children: const [
                      Text(
                        '',
                      ),
                      Text(
                        '',
                      ),
                    ]),
                    TableRow(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const [
                          Text(
                            'บริษัท:',
                            textAlign: TextAlign.right,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            width: 150,
                            padding: const EdgeInsets.only(
                              left: 5,
                            ),
                            child: Text(
                              Paymant_List_History_Detail['Company_name']
                                  .toString(),
                              textAlign: TextAlign.start,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff438EB9)),
                            ),
                          ),
                        ],
                      ),
                    ]),
                    TableRow(children: const [
                      Text(
                        '',
                      ),
                      Text(
                        '',
                      ),
                    ]),
                    TableRow(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const [
                          Text(
                            'วันที่เติมน้ำมัน:',
                            textAlign: TextAlign.right,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            width: 150,
                            padding: const EdgeInsets.only(
                              left: 5,
                            ),
                            child: Text(
                              Paymant_List_History_Detail['sdate'].toString() +
                                  ' ถึง ' +
                                  Paymant_List_History_Detail['edate']
                                      .toString(),
                              textAlign: TextAlign.start,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff438EB9)),
                            ),
                          ),
                        ],
                      ),
                    ]),
                    TableRow(children: const [
                      Text(
                        '',
                      ),
                      Text(
                        '',
                      ),
                    ]),
                    TableRow(children: [
                      Text(
                        'จำนวนเงิน:',
                        textAlign: TextAlign.right,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text(
                          NumberFormat("#,###.##").format(
                              Paymant_List_History_Detail['bill_amount']),
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff438EB9)),
                        ),
                      ),
                    ]),
                    TableRow(children: const [
                      Text(
                        '',
                      ),
                      Text(
                        '',
                      ),
                    ]),
                    TableRow(children: [
                      Text(
                        'ผู้แจ้งยอด(บัญชี):',
                        textAlign: TextAlign.right,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text(
                          Paymant_List_History_Detail['created_name']
                              .toString(),
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff438EB9)),
                        ),
                      ),
                    ]),
                    TableRow(children: const [
                      Text(
                        '',
                      ),
                      Text(
                        '',
                      ),
                    ]),
                    TableRow(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'ชำระด้วย:',
                            textAlign: TextAlign.left,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          if (Paymant_List_History_Detail['payment_method'] ==
                              "1") ...{
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(
                                    left: 5,
                                  ),
                                  child: Text(
                                    'เงินสด',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff438EB9)),
                                  ),
                                ),
                              ],
                            ),
                          } else ...{
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(
                                    left: 5,
                                  ),
                                  child: Text(
                                    'บัตรเครดิต',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff438EB9)),
                                  ),
                                ),
                              ],
                            ),
                            // Row(
                            //   children: [
                            //     Container(
                            //       padding: const EdgeInsets.only(
                            //         left: 5,
                            //       ),
                            //       child: Text(
                            //         Paymant_List_History_Detail['card_no']
                            //             .toString(),
                            //         textAlign: TextAlign.start,
                            //         style: TextStyle(
                            //             fontWeight: FontWeight.bold,
                            //             color: Color(0xff438EB9)),
                            //       ),
                            //     ),
                            //   ],
                            // ),
                          }
                        ],
                      ),
                    ]),
                    TableRow(children: const [
                      Text(
                        '',
                      ),
                      Text(
                        '',
                      ),
                    ]),
                    TableRow(children: [
                      Text(
                        'ผู้รับเงิน(ปั้ม):',
                        textAlign: TextAlign.right,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 5,
                        ),
                        child: Text(
                          Paymant_List_History_Detail['fullname'].toString(),
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff438EB9)),
                        ),
                      ),
                    ]),
                  ],
                ),
                Container(
                  height: 10,
                ),

                Container(
                  width: double.maxFinite,
                  height: 50,
                  child: !_canShowButton
                      ? const SizedBox.shrink()
                      : ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xffCA4242),
                          ),
                          onPressed: () {
                            hideWidget();
                            //_number();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Text(_message),
                              Icon(Icons.save),
                            ],
                          )),
                ),
                if (_canShowButton4 == true) ...{
                  BtnBack(),
                }
              ],
            ),
          ),
        ),
      ),
    );
  }
}
