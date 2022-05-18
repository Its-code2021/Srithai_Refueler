// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:cpac/controller/gas_qr_code.dart';
import 'package:cpac/controller/qr_code.dart';
import 'package:cpac/utility/date_time.dart';
import 'package:cpac/view/driver/staff_done.dart';
import 'package:cpac/view/gas_station/gas_done.dart';
import 'package:cpac/view/gas_station/gas_loading_page.dart';
import 'package:cpac/view/gas_station/gas_qr_code.dart';
import 'package:cpac/view/gas_station/tabbar_gas%20home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart'; // In order to use RepaintBoundary, RenderRepaintBoundary

import 'dart:ui' as ui;
import 'dart:typed_data';

// This package is used to save screenshots to the gallery
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:intl/intl.dart';

class inpump_screenshot_bin extends StatefulWidget {
  const inpump_screenshot_bin(pump_detail_id, {Key? key}) : super(key: key);

  @override
  _inpump_screenshot_binState createState() => _inpump_screenshot_binState();
}

class _inpump_screenshot_binState extends State<inpump_screenshot_bin> {
  // This key is used for the RepaintBoundary widget
  final GlobalKey _key = GlobalKey();

  String _message = 'บันทึกใบเติมน้ำมัน';

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
        Future.delayed(Duration(seconds: 2), () {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => Staff_Done()),
              (Route<dynamic> route) => false);
        });
      }

      setState(() {
        _message = 'บันทึกใบเติมน้ำมันเรียบร้อย';
      });
    }
  }

  bool _canShowButton = true;
  bool _canShowButton2 = false;
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
                      'บันทึกใบเติมน้ำมันสำเร็จ',
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
  // Widget BtnBack() {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceAround,
  //     children: [
  //       Container(
  //         height: 50,
  //         child: ElevatedButton(
  //           style: ElevatedButton.styleFrom(
  //             primary: Color(0xff4782D2),
  //           ),
  //           onPressed: () {
  //             PostPumpHistoryRefue(startdate, enddate);
  //             Navigator.of(context).pushAndRemoveUntil(
  //                 MaterialPageRoute(
  //                     builder: (context) => TabBar_Menu_Gas_Home()),
  //                 (Route<dynamic> route) => false);
  //             print('กลับหน้าหลัก');
  //           },
  //           child: Text(
  //             'กลับหน้าหลัก',
  //             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  //           ),
  //         ),
  //       ),
  //       Container(
  //         height: 50,
  //         child: ElevatedButton(
  //           style: ElevatedButton.styleFrom(
  //             primary: Color(0xff4782D2),
  //           ),
  //           onPressed: () {
  //             Navigator.of(context).pushAndRemoveUntil(
  //                 MaterialPageRoute(builder: (context) => Gas_Qr_Code()),
  //                 (Route<dynamic> route) => false);
  //           },
  //           child: Text(
  //             'Scan QRCode',
  //             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }

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
                  'ใบเติมน้ำมัน',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 10,
                ),
                Table(
                  children: [
                    TableRow(children: [
                      Text(
                        'เลขที่คูปอง:',
                        textAlign: TextAlign.end,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text(
                          Bin_Detail_pump['code'].toString(),
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff428BCA)),
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
                        'ทะเบียนรถ:',
                        textAlign: TextAlign.right,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text(
                          Bin_Detail_pump["truck_license"].toString(),
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff428BCA)),
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
                        'ชื่อพนักงานขับรถ:',
                        textAlign: TextAlign.right,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        Bin_Detail_pump['driver'].toString(),
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff428BCA)),
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
                        'จำนวนลิตร:',
                        textAlign: TextAlign.right,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text(
                          Bin_Detail_pump['refuel_amount'].toString(),
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff428BCA)),
                        ),
                      ),
                    ]),
                    // TableRow(children: const [
                    //   Text(
                    //     '',
                    //   ),
                    //   Text(
                    //     '',
                    //   ),
                    // ]),
                    // TableRow(children: [
                    //   Text(
                    //     'ราคาต่อลิตร:',
                    //     textAlign: TextAlign.right,
                    //     style: TextStyle(fontWeight: FontWeight.bold),
                    //   ),
                    //   Padding(
                    //     padding: EdgeInsets.all(3.0),
                    //     child: Text(
                    //       Bin_Detail_pump['oil_rate'].toStringAsFixed(2),
                    //       textAlign: TextAlign.start,
                    //       style: TextStyle(
                    //           fontWeight: FontWeight.bold,
                    //           color: Color(0xff428BCA)),
                    //     ),
                    //   ),
                    // ]),
                    // TableRow(children: const [
                    //   Text(
                    //     '',
                    //   ),
                    //   Text(
                    //     '',
                    //   ),
                    // ]),
                    // TableRow(children: [
                    //   Text(
                    //     'จำนวนเงินทั้งหมด:',
                    //     textAlign: TextAlign.right,
                    //     style: TextStyle(fontWeight: FontWeight.bold),
                    //   ),
                    //   Padding(
                    //     padding: EdgeInsets.all(3.0),
                    //     child: Text(
                    //       NumberFormat("#,###.00")
                    //           .format(Bin_Detail_pump['bill_amount']),
                    //       // Bin_Detail_pump['bill_amount'].toStringAsFixed(2),
                    //       textAlign: TextAlign.start,
                    //       style: TextStyle(
                    //           fontWeight: FontWeight.bold,
                    //           color: Color(0xff428BCA)),
                    //     ),
                    //   ),
                    // ]),
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
                        'ชื่อปั๊มที่เติม:',
                        textAlign: TextAlign.right,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text(
                          Bin_Detail_pump['refueler_name'].toString(),
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff428BCA)),
                        ),
                      ),
                    ]),
                    TableRow(children: [
                      Text(
                        '',
                      ),
                      Text(
                        '',
                      ),
                    ]),
                    TableRow(children: [
                      Text(
                        'วัน/เวลาที่เติม:',
                        textAlign: TextAlign.right,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text(
                          Bin_Detail_pump['refuel_at'].toString(),
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff428BCA)),
                        ),
                      ),
                    ]),
                    // TableRow(children: [
                    //   Text(
                    //     '',
                    //   ),
                    //   Text(
                    //     '',
                    //   ),
                    // ]),
                    // TableRow(children: [
                    //   Text(
                    //     'สถานะ :',
                    //     textAlign: TextAlign.right,
                    //     style: TextStyle(fontWeight: FontWeight.bold),
                    //   ),
                    //   Text(
                    //     ' เติมแล้ว',
                    //     textAlign: TextAlign.start,
                    //     style: TextStyle(
                    //         fontWeight: FontWeight.bold,
                    //         color: Color(0xff428BCA)),
                    //   ),
                    // ]),
                  ],
                ),
                Container(
                  height: 10,
                ),
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.black,
                        width: 2.0,
                        style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: (Image(
                    image: NetworkImage(Bin_Detail_pump['driver_signed']),
                  )),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
