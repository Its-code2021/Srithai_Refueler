import 'package:cpac/controller/gas_qr_code.dart';
import 'package:cpac/controller/qr_code.dart';
import 'package:cpac/controller/user_profile.dart';
import 'package:cpac/utility/my_alert.dart';

import 'package:cpac/view/driver/qr_code.dart';
import 'package:cpac/view/gas_station/gas_loading_page.dart';
import 'package:flutter/material.dart';

class Gas_Qr_Code_Number extends StatefulWidget {
  Gas_Qr_Code_Number({Key? key}) : super(key: key);

  @override
  _Gas_Qr_Code_NumberState createState() => _Gas_Qr_Code_NumberState();
}

class _Gas_Qr_Code_NumberState extends State<Gas_Qr_Code_Number> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Center(
          child: Image.asset('images/002.png', fit: BoxFit.cover),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.qr_code_scanner_outlined),
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (context) => Loading_Page_Gas_QqCode()),
                  (Route<dynamic> route) => false);
            },
          ),
        ],
        backgroundColor: const Color(0xff438EB9),
        // ignore: duplicate_ignore, duplicate_ignore, duplicate_ignore
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
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
                    'กรอกเลข คิวอาร์โค้ด',
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
                BtnConfrim(),
                Container(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 80.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue[900],
                      minimumSize: Size.fromHeight(
                        50,
                      ), //
                    ),
                    onPressed: () {
                      Profile['fullname'];
                      print(Profile['fullname']);
                      setState(() {
                        number_qrcode.text.isEmpty
                            ? _validate = true
                            : _validate = false;
                        if (_validate == false) {
                          var qrcode = number_qrcode.text.toString();
                          PostapiGasQrCodeNumber(qrcode, context);
                          number_qrcode.clear();
                          print("_validate ::::$_validate");
                          print(qrcode);
                        } else if (_validate == true) {
                          AlertQrCodeMessage(context);
                        }
                      });
                      print(number_qrcode.text);
                    },
                    child: Text(
                      'ตกลง',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
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

// ignore: non_constant_identifier_names
final number_qrcode = TextEditingController();
bool _validate = false;

class BtnConfrimState extends State<BtnConfrim> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Center(
            child: TextField(
              controller: number_qrcode,
              autofocus: true,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 0.1),
                border: new OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.teal)),
                // errorText: _validate ? 'กรุณากรอกจะจำนวนลิตรที่เติมจริง' : null,
              ),
              // keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
