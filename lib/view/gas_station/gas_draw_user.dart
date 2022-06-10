// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, unnecessary_new

import 'dart:convert';
import 'dart:typed_data';
import 'package:cpac/controller/gas_qr_code.dart';
import 'package:cpac/controller/user_profile.dart';
import 'package:cpac/main.dart';
import 'package:cpac/utility/my_alert.dart';
import 'package:cpac/view/gas_station/gas_bill_amount.dart';
import 'package:cpac/view/gas_station/gas_done.dart';
import 'package:cpac/view/gas_station/gas_loading_page.dart';
import 'package:cpac/view/gas_station/gas_tabel_all.dart';
import 'package:cpac/view/login_pump_gas.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import 'package:signature/signature.dart';

class Gas_Draw_User extends StatefulWidget {
  const Gas_Draw_User({Key? key}) : super(key: key);

  @override
  _Gas_Draw_UserState createState() => new _Gas_Draw_UserState();
}

class _Gas_Draw_UserState extends State<Gas_Draw_User> {
  bool _finished = false;

  // ignore: prefer_typing_uninitialized_variables
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

  Future<void> AlertConfrimAmoutGas() async {
    showDialog(
      context: context,
      builder: (context) => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
        child: AlertDialog(
          actions: [
            Column(
              children: [
                Icon(Icons.task_alt, size: 80, color: Colors.green),
                Container(
                  height: 10,
                ),
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
                      Gas_Details['truck_license'].toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.green),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      ' จำนวน ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      _texthController.text,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.green),
                    ),
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
                Container(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        var id = Gas_Details['id'].toString();
                        var refuel_amount = total_Refuel_all;
                        var images = base64Image;
                        print(Gas_Details);
                        GetapiHeader(token);
                        GetToken(token);
                        PostGasConfirmRefuelAmount(
                            context, id, refuel_amount, images);
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
      ),
    );
  }

  var total_Refuel_all;
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
                'ยืนยัน',
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () {
                setState(() async {
                  _texthController.text.isEmpty
                      ? _validate2 = true
                      : _validate2 = false;
                  _controller.isEmpty ? _validate = true : _validate = false;
                  if (_validate == false) {
                    if (_validate2 == false) {
                      var total_Refuel =
                          int.parse(Gas_Details['amount'].toString());
                      var _texthController_text =
                          int.parse(_texthController.text);
                      assert(total_Refuel is int);
                      if (total_Refuel > _texthController_text ||
                          total_Refuel == _texthController_text) {
                        total_Refuel_all = _texthController_text;
                        AlertConfrimAmoutGas();
                      } else {
                        AlertOilRate_Null(context);
                      }
                      if (_controller.isNotEmpty) {
                        final Uint8List? data = await _controller.toPngBytes();
                        if (data != null) {
                          base64Image = base64Encode(data);

                          // // var id = Gas_Details['id'].toString();
                          // // var refuel_amount = total_Refuel_all.toString();
                          // // var images = base64Image;
                          // // PostGasConfirmrefuel_amount(
                          // //     context, id, refuel_amount, images);
                          // // ignore: unused_local_variable
                          // var imagesCode = base64Image;
                        }
                      }
                    } else if (_validate2 == true) {
                      AlertOilTotal_Null(context);
                    }
                  } else if (_validate == true) {
                    AlertDetailDrawGas(context);
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

  Future<void> _refresh() async {
    setState(() {
      Gas_Details;
      PostQrcodeGas_Agein_reload(context, OilDetail_id);
      Tabel_Gas_detail_draw();
    });
    return Future.delayed(Duration(seconds: 2));
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
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height,
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
                Tabel_Gas_detail_draw(),
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
        ),
      ),
    );
  }
}

class BtnConfrim_Oil_Total extends StatefulWidget {
  @override
  BtnConfrim_Oil_TotalState createState() {
    return BtnConfrim_Oil_TotalState();
  }
}

bool _validate = false;
bool _validate2 = false;
var _texthController = TextEditingController();
bool _text = false;

class BtnConfrim_Oil_TotalState extends State<BtnConfrim_Oil_Total> {
  @override
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
          // Text(
          //   Gas_Details['refuel_amount'].toString(),
          // ),
          Center(
            child: TextField(
              inputFormatters: [
                CommaFormatter(),
                FilteringTextInputFormatter.allow(
                  RegExp(
                    //r'^[-]{0,1}[0-9]*[,]?[0-9]*', //signed regex
                    r'^[0-9]*?[0-9]*',
                  ),
                ),
              ],
              enabled: _text,
              controller: _text ? _texthController : null,
              autofocus: true,
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

class CommaFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String _text = newValue.text;
    //This is only if you need signed numbers. Will convert the first '.'(dot) to '-'(minus)
    //if (_text.isNotEmpty && _text[0] == '.')
    //  _text = _text.replaceFirst('.', '-');
    return newValue.copyWith(
      text: _text.replaceAll('.', ','),
    );
  }
}
