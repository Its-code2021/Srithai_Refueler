import 'package:cpac/view/gas_station/gas_detail.dart';
import 'package:cpac/view/gas_station/gas_summary.dart';
import 'package:flutter/material.dart';

class Gas_Reference_Number extends StatefulWidget {
  Gas_Reference_Number({Key? key}) : super(key: key);

  @override
  _Gas_Reference_NumberState createState() => _Gas_Reference_NumberState();
}

class _Gas_Reference_NumberState extends State<Gas_Reference_Number> {
  Widget Confrim_Oil() {
    return Container(
      width: 150,
      height: 50,
      alignment: Alignment.bottomCenter,
      child: Align(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Color(0xff438EB9),
              minimumSize: Size.fromHeight(
                50,
              ),
              // fromHeight use double.infinity as width and 40 is the height
              elevation: 5),
          child: Text(
            'ตกลง',
            style: TextStyle(fontSize: 20),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Gas_Detail()),
            );
            print('ตกลง');
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 10,
            ),
            Container(
              width: double.infinity,
              height: 60,
              alignment: Alignment.center,
              color: Color(0xff438EB9),
              // ignore: prefer_const_constructors
              child: Text(
                'กรอกหมายเลขอ้างอิง',
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            Container(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    height: 10,
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.qr_code_2_outlined,
                        size: 60,
                      ),
                      labelText: 'กรอกหมายเลขอ้างอิง',
                      labelStyle: const TextStyle(
                        fontSize: 20,
                      ),
                      border: myinputborder(), //normal border
                      enabledBorder: myinputborder(), //enabled border
                      focusedBorder: myfocusborder(), //focused border
                      // set more border style like disabledBorder
                    ),
                  ),
                  Container(
                    height: 30,
                  ),
                  Confrim_Oil()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

OutlineInputBorder myinputborder() {
  //return type is OutlineInputBorder
  return OutlineInputBorder(
      //Outline border type for TextFeild
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(
        color: Colors.grey,
        width: 3,
      ));
}

OutlineInputBorder myfocusborder() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(
        color: Colors.grey,
        width: 3,
      ));
}
