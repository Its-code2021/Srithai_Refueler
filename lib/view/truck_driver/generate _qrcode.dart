// ignore: file_names
// ignore_for_file: deprecated_member_use, avoid_print, file_names, unnecessary_const

import 'package:cpac/controller/driver_employee.dart';
import 'package:cpac/view/truck_driver/driver_truck_done.dart';
import 'package:cpac/view/truck_driver/loading_driver.dart';
import 'package:cpac/view/truck_driver/tabbar_driver_truck.dart';
import 'package:cpac/view/truck_driver/table_truck_textall.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';
import 'dart:io';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';

class Generate_QrCode extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Generate_QrCodeState();
}

class Generate_QrCodeState extends State<Generate_QrCode> {
  GlobalKey globalKey = GlobalKey();
  String _dataString = Driver_CouponDetail['qr_code'].toString();

  String _inputErrorText = '';
  var Driver_id = Driver_CouponDetail['id'].toString();
  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    Timer timer;
    GetapiRecheckRefuel(context, Driver_id);
    timer = Timer.periodic(Duration(seconds: 3),
        (Timer t) => GetapiRecheckRefuel(context, Driver_id));
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => Loading_Driver()),
                      (route) => false);
                },
                icon: Icon(Icons.arrow_back)),
            Image.asset('images/002.png', fit: BoxFit.cover),
          ],
        ),
        centerTitle: true,
        backgroundColor: Color(0xff438EB9),
      ),
      body: _contentWidget(),
    );
  }

  _contentWidget() {
    final bodyHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).viewInsets.bottom;
    return SingleChildScrollView(
      child: Container(
        color: const Color(0xFFFFFFFF),
        child: Column(
          children: <Widget>[
            Container(height: 10),
            Container(
              width: double.infinity,
              height: 60,
              alignment: Alignment.center,
              color: Colors.black,
              child: const Text(
                'QR CODE สำหรับเติมน้ำมัน',
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            Container(
              child: Center(
                child: RepaintBoundary(
                  key: globalKey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: QrImage(
                      data: _dataString,
                      size: 0.4 * bodyHeight,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 60,
              alignment: Alignment.center,
              color: Colors.black,
              child: Text(
                Driver_CouponDetail['refer_code'].toString(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            Container(height: 10),
            Container(
              width: double.infinity,
              height: 50,
              alignment: Alignment.center,
              color: const Color(0xff438EB9),
              child: Text(
                'รายละเอียดคูปองน้ำมัน ' + Status_GasStation.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            Container(height: 10),
            Tabel_Trck_GenQrCode(),
            Container(height: 15),
            // ElevatedButton(
            //     onPressed: () {
            //       var Driver_id = Driver_CouponDetail['id'];
            //       GetapiRecheckRefuel(context,Driver_id);
            //       print('Driver_ids::::::: $Driver_id');

            //       // Navigator.push(
            //       //   context,
            //       //   MaterialPageRoute(
            //       //       builder: (context) => Driver_Truck_Done()),
            //       // );
            //     },
            //     child: Text('test'))
          ],
        ),
      ),
    );
  }
}
