// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, unnecessary_new

import 'dart:convert';
import 'dart:typed_data';

import 'package:cpac/controller/qr_code.dart';
import 'package:cpac/main.dart';
import 'package:cpac/utility/my_alert.dart';

import 'package:cpac/view/driver/staff_done.dart';
import 'package:cpac/view/driver/tabel_all.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';
import 'package:painter/painter.dart';
import 'package:pattern_formatter/numeric_formatter.dart';
import 'package:signature/signature.dart';

class Staff_Draw_User_GEN_Backup extends StatefulWidget {
  @override
  _Staff_Draw_User_GEN_BackupState createState() =>
      new _Staff_Draw_User_GEN_BackupState();
}

class _Staff_Draw_User_GEN_BackupState
    extends State<Staff_Draw_User_GEN_Backup> {
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
    total_Refuel_alls;
    total_Refuel_Gen_alls;
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
                              Text(
                                ' ทะเบียน ',
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
                            ],
                          ),
                          Container(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [],
                          ),
                          Row(
                            children: [
                              Text(
                                'เติมรถ (ลิตร)',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(_texthController.text,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green)),
                              Text(
                                ' ลิตร ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'เติมเครื่อง GEN (ลิตร)',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(_texthController_gen.text,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green)),
                              Text(
                                ' ลิตร ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'รวมจำนวนลิตรที่เติม ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                  "${total_Refuel_alls + total_Refuel_Gen_alls}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green)),
                              Text(
                                ' ลิตร ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
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
                              var refuel_gen = _texthController_gen.text;
                              var refuel_truck = _texthController.text;
                              var refuel_amount = tottal_gens.toString();
                              var images = base64Image;

                              PostConfirmRefuelAmount_GEN(
                                  context,
                                  id,
                                  refuel_gen,
                                  refuel_truck,
                                  refuel_amount,
                                  images);

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
                        if (_validate3 == false) {
                          final Uint8List? data =
                              await _controller.toPngBytes();
                          if (data != null) {
                            base64Image = base64Encode(data);
                            var images_code = base64Image;
                            var total_Refuel =
                                int.parse(Oil_Details['oil_truck'].toString());
                            var _texthController_text =
                                double.parse(_texthController.text);
                            assert(total_Refuel is int);
                            var total_Refuel_Gen =
                                int.parse(Oil_Details['oil_gen'].toString());
                            var _texthController_Gen_text =
                                double.parse(_texthController_gen.text);
                            assert(total_Refuel_Gen is int);
                            if (total_Refuel > _texthController_text ||
                                total_Refuel == _texthController_text) {
                              total_Refuel_alls = _texthController_text;
                              if (total_Refuel_Gen >
                                      _texthController_Gen_text ||
                                  total_Refuel_Gen ==
                                      _texthController_Gen_text) {
                                total_Refuel_Gen_alls =
                                    _texthController_Gen_text;
                                tottal_gens;
                                AlertConfrimAmout(context);
                              } else {
                                AlertOilRateGEN_Null(context);
                              }
                            } else {
                              AlertOilRate_Null(context);
                            }
                          }
                        } else if (_validate3 == true) {
                          AlertOilTotalAddGen_Null(context);
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
            Tabel_Staff_detail_new_GEN(),
            Container(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'กรุณาให้พนักงานขับรถเซ็นรับทราบ (ตัวบรรจง)',
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

class BtnConfrim_GEN1 extends StatefulWidget {
  @override
  BtnConfrim_GEN1State createState() {
    return new BtnConfrim_GEN1State();
  }
}

bool _text = false;
bool _validate = false;
bool _validate2 = false;
bool _validate3 = false;
var _texthController = TextEditingController();
var _texthController_gen = TextEditingController();
var _texthController_Sums = TextEditingController();

class BtnConfrim_GEN1State extends State<BtnConfrim_GEN1> {
  void initState() {
    super.initState();
    print('init');
    _refreshAction(tottal_gens);
    Tabel_Staff_detail_new_GEN();
    _texthController.text = '';
    _text = true; //variable to control enable property of textfield
  }

  _refreshAction(tottal_gens) {
    setState(() {
      Tabel_Staff_detail_new_GEN();
      tottal_gens.toString();
      _texthController_Sums.text = tottal_gens.toString();
    });
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
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
              ],
              onChanged: (total_ref) {
                tottal_gens = (Decimal.parse(_texthController_gen.text) +
                    Decimal.parse(_texthController.text));
                _refreshAction(tottal_gens);
                total_Refuel_alls + total_Refuel_Gen_alls;
              },
              autofocus: true,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 0.1),
                border: new OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.teal)),
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

class BtnConfrim_GEN2 extends StatefulWidget {
  @override
  BtnConfrim_GEN2State createState() {
    return new BtnConfrim_GEN2State();
  }
}

class BtnConfrim_GEN2State extends State<BtnConfrim_GEN2> {
  void initState() {
    super.initState();
    _refreshAction(tottal_gens);
    Tabel_Staff_detail_new_GEN();
    print('init');
    _texthController_gen.text = '';
    _text = true; //variable to control enable property of textfield
  }

  _refreshAction(tottal_gens) {
    setState(() {
      Tabel_Staff_detail_new_GEN();
      tottal_gens.toString();
      _texthController_Sums.text = tottal_gens.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Center(
            child: TextField(
              controller: _texthController_gen,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
              ],
              autofocus: true,
              onChanged: (total_ref) {
                tottal_gens = (Decimal.parse(_texthController_gen.text) +
                    Decimal.parse(_texthController.text));
                _refreshAction(tottal_gens);
                total_Refuel_alls + total_Refuel_Gen_alls;
              },
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 0.1),
                border: new OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.teal)),
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

class BtnConfrim_Oil_Add_Gen_SUM extends StatefulWidget {
  @override
  BtnConfrim_Oil_Add_Gen_SUMState createState() {
    return BtnConfrim_Oil_Add_Gen_SUMState();
  }
}

class BtnConfrim_Oil_Add_Gen_SUMState
    extends State<BtnConfrim_Oil_Add_Gen_SUM> {
  @override
  void initState() {
    super.initState();
    _refreshAction(tottal_gens);
    Tabel_Staff_detail_new_GEN();
    print('init');
    _texthController_Sums.text = '';
    _text = true; //variable to control enable property of textfield
  }

  _refreshAction(tottal_gens) {
    setState(() {
      Tabel_Staff_detail_new_GEN();
      tottal_gens.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Center(
            child: TextField(
              style: TextStyle(
                  color: Color(0xff428BCA), fontWeight: FontWeight.bold),
              enabled: false,
              controller: _text ? _texthController_Sums : null,
              textInputAction: TextInputAction.done,
              decoration: const InputDecoration(
                hintText: '0',
                contentPadding: EdgeInsets.symmetric(vertical: 0.1),
                border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal)),
                // errorText: _validate ? 'กรุณากรอกจะจำนวนลิตรที่เติมจริง' : null,
              ),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
// class CommaFormatter_driver extends TextInputFormatter {
//   @override
//   TextEditingValue formatEditUpdate(
//     TextEditingValue oldValue,
//     TextEditingValue newValue,
//   ) {
//     String _text = newValue.text;
//     //This is only if you need signed numbers. Will convert the first '.'(dot) to '-'(minus)
//     //if (_text.isNotEmpty && _text[0] == '.')
//     //  _text = _text.replaceFirst('.', '-');
//     return newValue.copyWith(
//       text: _text.replaceAll(',', ''),
//     );
//   }
// }
