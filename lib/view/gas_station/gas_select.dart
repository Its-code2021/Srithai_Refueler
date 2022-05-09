import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:cpac/controller/gas_qr_code.dart';
import 'package:cpac/view/gas_station/gas_loading_page.dart';
import 'package:cpac/view/gas_station/gas_screenshot_bin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'gas_qr_code.dart';

class Gas_Select extends StatefulWidget {
  Gas_Select({Key? key}) : super(key: key);

  @override
  State<Gas_Select> createState() => _Gas_SelectState();
}

class _Gas_SelectState extends State<Gas_Select> {
  Widget Qr_code_Gas() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.blue[900],
                minimumSize: Size.fromHeight(
                  50,
                ), // fromHeight use double.infinity as width and 40 is the height
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Gas_Qr_Code()),
                );
                print('สแกนคูปองเติมน้ำมัน');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'สแกนคูปองเติมน้ำมัน ',
                    style: TextStyle(fontSize: 20),
                  ),
                  Icon(
                    Icons.qr_code_scanner_outlined,
                    size: 30,
                  )
                ],
              )),
          Container(
            height: 10,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Future<bool> showExitPopup() async {
      return await showDialog(
            //show confirm dialogue
            context: context,
            builder: (context) => AlertDialog(
              title: Text(
                'คุณแน่ใจหรือไม่ที่จะปิดแอปพลิเคชัน',
                style: TextStyle(fontSize: 18),
              ),
              actions: [
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: Text('ยืนยัน'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey,
                  ),
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text('ยกเลิก'),
                ),
              ],
            ),
          ) ??
          false;
    }

    return WillPopScope(
      onWillPop: showExitPopup, //call function on back button press
      child: Scaffold(
        appBar: AppBar(
          title:
              Center(child: Image.asset('images/002.png', fit: BoxFit.cover)),
          backgroundColor: const Color(0xff438EB9),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  'images/logo.png',
                  fit: BoxFit.cover,
                  scale: 18.0,
                ),
              ),
              Container(
                height: 50,
              ),
              Qr_code_Gas()
            ],
          ),
        ),
      ),
    );
  }
}
