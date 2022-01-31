// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, unnecessary_new

import 'dart:convert';
import 'dart:typed_data';

import 'package:cpac/controller/qr_code.dart';
import 'package:cpac/main.dart';
import 'package:cpac/utility/my_alert.dart';

import 'package:cpac/view/driver/staff_done.dart';
import 'package:cpac/view/driver/tabel_all.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:painter/painter.dart';
import 'package:signature/signature.dart';

class Staff_Draw_User extends StatefulWidget {
  @override
  _Staff_Draw_UserState createState() => new _Staff_Draw_UserState();
}

class _Staff_Draw_UserState extends State<Staff_Draw_User> {
  bool _finished = false;

  var base64Image;

  get image_text => null;

  final SignatureController _controller = SignatureController(
    penStrokeWidth: 1,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white,
    onDrawStart: () => print('onDrawStart called!'),
    onDrawEnd: () => print('onDrawEnd called!'),
  );

  @override
  void initState() {
    super.initState();
    _controller.addListener(() => print('Value changed'));
  }

  Future<void> AlertConfrimAmout(BuildContext context) async {
    String quote = base64Image;
    showDialog(
        context: context,
        builder: (context) => MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
              child: AlertDialog(
                actions: [
                  Column(
                    children: [
                      Icon(Icons.task_alt, size: 60, color: Colors.green),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'คุณเติมน้ำมันรถ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          Container(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'ทะเบียน  ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                Oil_Details['truck_license'].toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                ' จำนวนลิตร ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                _texthController.text,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green),
                              ),
                            ],
                          ),
                          Container(
                            height: 10,
                          ),
                          Text(
                            'โปรดยืนยันหากยืนยันแล้วจะไม่สามารถแก้ไขได้',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      Container(
                        height: 5,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              var id = Oil_Details['id'].toString();
                              var refuel_amount = _texthController.text;
                              var images = base64Image;
                              PostConfirmRefuelAmount(
                                  context, id, refuel_amount, images);

                              // Clipboard.setData(ClipboardData(text: quote));
                            },
                            child: const Center(
                                child: Text(
                              'ตกลง',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.red,
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Center(
                                child: Text(
                              'ยกเลิก',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ));
  }

  Widget Confrim_Oil() {
    return Container(
      width: 150,
      alignment: Alignment.bottomCenter,
      child: Align(
        child: Column(
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Color(0xff438EB9),
                  minimumSize: Size.fromHeight(
                    50,
                  ),
                  elevation: 5),
              child: Text(
                'ตกลง',
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () {
                setState(() async {
                  _texthController.text.isEmpty
                      ? _validate = true
                      : _validate = false;
                  _controller.isEmpty ? _validate2 = true : _validate2 = false;
                  if (_validate == false) {
                    if (_validate2 == false) {
                      if (_controller.isNotEmpty) {
                        final Uint8List? data = await _controller.toPngBytes();
                        if (data != null) {
                          base64Image = base64Encode(data);
                          var images_code = base64Image;
                          AlertConfrimAmout(context);
                        }
                      }
                    } else if (_validate2 == true) {
                      AlertDetailDrawGas(context);
                    }
                  } else if (_validate == true) {
                    AlertDetailDraw(context);
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget Confrim_Clear() {
    return Container(
      width: 150,
      height: 50,
      alignment: Alignment.bottomCenter,
      child: Align(
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Color(0xFFEC4646),
                minimumSize: Size.fromHeight(
                  50,
                ),
                elevation: 5),
            child: Text(
              'Clear',
              style: TextStyle(fontSize: 20),
            ),
            onPressed: _controller.clear),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final key = new GlobalKey<ScaffoldState>();
    // ignore: unnecessary_new

    return new Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Image.asset('images/002.png', fit: BoxFit.cover),
        centerTitle: true,
        backgroundColor: Color(0xff438EB9),
      ),
      body: SingleChildScrollView(
        child: new SafeArea(
            child: Column(
          children: [
            Container(
              height: 10,
            ),
            Container(
              width: double.infinity,
              height: 60,
              alignment: Alignment.center,
              color: Color(0xff438EB9),
              child: Text(
                'รายละเอียดการเติมน้ำมัน',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            Container(
              height: 10,
            ),
            Tabel_Staff_detail_new(),
            Container(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'กรุณากรอกลายเซ็นเพื่อยืนยัน เติมน้ำมัน',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ),
              ],
            ),
            //SIGNATURE CANVAS
            Container(
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
              ),
              child: Signature(
                controller: _controller,
                height: 150,
                backgroundColor: Colors.white,
              ),
            ),
            //OK AND CLEAR BUTTONS
            Container(
              decoration: const BoxDecoration(color: Colors.black),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: const <Widget>[],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Confrim_Oil(),
                  Confrim_Clear(),
                ],
              ),
            ),
            Container(
              height: 20,
            ),
          ],
        )),
      ),
    );
  }
}

class BtnConfrim extends StatefulWidget {
  @override
  BtnConfrimState createState() {
    return new BtnConfrimState();
  }
}

var _texthController = TextEditingController();
bool _text = false;
bool _validate = false;
bool _validate2 = false;

class BtnConfrimState extends State<BtnConfrim> {
  void initState() {
    super.initState();
    print('init');
    _texthController.text = '';
    _text = true; //variable to control enable property of textfield
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Center(
            child: TextField(
              controller: _texthController,
              autofocus: true,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 0.1),
                border: new OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.teal)),
                // errorText: _validate ? 'กรุณากรอกจะจำนวนลิตรที่เติมจริง' : null,
              ),
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
