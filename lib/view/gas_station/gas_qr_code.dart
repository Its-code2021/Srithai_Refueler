import 'dart:io';

import 'package:cpac/controller/gas_qr_code.dart';
import 'package:cpac/view/gas_station/gas_qr_code_number.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class Gas_Qr_Code extends StatefulWidget {
  Gas_Qr_Code({Key? key}) : super(key: key);

  @override
  State<Gas_Qr_Code> createState() => _Gas_Qr_CodeState();
}

class _Gas_Qr_CodeState extends State<Gas_Qr_Code> {
  Barcode? result;

  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller?.pauseCamera();
    }
  }

  String qrCodeResult = "Not Yet Scanned";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Center(
          child: Image.asset('images/002.png', fit: BoxFit.cover),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.border_color_outlined),
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => Gas_Qr_Code_Number()),
                  (Route<dynamic> route) => false);
            },
          ),
        ],
        backgroundColor: const Color(0xff438EB9),
        // ignore: duplicate_ignore, duplicate_ignore, duplicate_ignore
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 10,
          ),
          Container(
            width: double.infinity,
            height: 60,
            alignment: Alignment.center,
            color: Colors.black,
            child: const Text(
              'SCAN QR CODE',
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          Expanded(flex: 5, child: _buildQrView(context)),
          Container(
            width: double.infinity,
            height: 60,
            alignment: Alignment.center,
            color: Colors.black,
            child: const Text(
              'บนคูปองเติมน้ำมัน',
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  void _onLoading() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: new Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
                Container(
                    margin: EdgeInsets.only(left: 5),
                    child: Text('โปรดรอสักครู่....')),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildQrView(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 300.0
        : 300.0;
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    Future.delayed(Duration(seconds: 3), () {
      controller.scannedDataStream.listen((scanData) {
        setState(() {
          result = scanData;
          if (result != null) {
            controller.stopCamera();
            var qrcode = result?.code;
            GetapiQrCodeGas(qrcode, context);
          }
        });
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
