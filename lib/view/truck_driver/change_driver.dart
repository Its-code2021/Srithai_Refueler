import 'package:cpac/controller/driver_employee.dart';
import 'package:cpac/utility/my_alert.dart';
import 'package:cpac/view/truck_driver/generate%20_qrcode.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'loading_driver.dart';
import 'package:dropdown_search/dropdown_search.dart';

class Change_Driver extends StatefulWidget {
  Change_Driver(String name, editDriverEmployee_id, {Key? key})
      : super(key: key);

  @override
  State<Change_Driver> createState() => _Change_DriverState();
}

var buttonText = 'เลือกพนักงานขับรถ';
String name = 'เลือกพนักงานขับรถ';
var editDriverEmployee_id;

class _Change_DriverState extends State<Change_Driver> {
  TextEditingController textarea = TextEditingController();

  @override
  void initState() {
    _refreshAction();
    name;
    buttonText;
  }

  _refreshAction() {
    setState(() {
      buttonText = name;
    });
  }

  final _formKey = GlobalKey<FormState>();
  @override
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
            Image.asset(
              'images/002.png',
              fit: BoxFit.cover,
              width: 250,
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Color(0xff438EB9),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 10,
            ),
            Container(
              width: double.infinity,
              height: 50,
              alignment: Alignment.center,
              color: const Color(0xff438EB9),
              child: const Text(
                'เปลี่ยน พขร เติมน้ำมัน',
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'เลือกพนักงานขับรถ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // AlertDriver_list_Select(context);
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => Loading_Change_Driver_Select()),
                    (Route<dynamic> route) => false);
                setState(() {
                  buttonText = name;
                });
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                minimumSize: const Size.fromHeight(
                  50,
                ),
              ),
              child: Text(
                buttonText,
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'หมายเหตุ ที่เปลี่ยน พขร',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Container(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: textarea,
                      keyboardType: TextInputType.text,
                      maxLines: 4,
                      decoration: const InputDecoration(
                          labelText: 'กรุณากรอกรายละเอียด',
                          border: OutlineInputBorder(),
                          errorBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red, width: 5))),
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          AlertDriver_Remark(context);
                        } else {
                          Change_Driver_Confirm(context, textarea);
                        }
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue[900],
                          minimumSize: const Size.fromHeight(
                            50,
                          ), //
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {}
                        },
                        child: const Text('ยืนยัน'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> Change_Driver_Confirm(
    BuildContext context, TextEditingController textarea) async {
  showDialog(
      context: context,
      builder: (context) => MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
            child: AlertDialog(
              actions: [
                Column(
                  children: [
                    Icon(
                      Icons.error_outline,
                      size: 45,
                      color: Colors.red,
                    ),
                    Container(height: 10),
                    const Text(
                      'หากกดยืนยันแล้วจะไม่สามารถแก้ไขได้และจะมีรายงานส่งแจ้งผู้บริหารทราบทันที',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue[900],
                          ),
                          onPressed: () {
                            var DriverEmployee_id = Driver_ProfileUser['id'];
                            var eDriverEmployee_id = editDriverEmployee_id;
                            String eDriver_remark = textarea.text;
                            DateTime now = DateTime.now();
                            String formattedDate =
                                DateFormat('yyyy-MM-dd HH:mm:ss').format(now);
                            var eDriverEmployee_at = formattedDate.toString();
                            name = 'เลือกพนักงานขับรถ';
                            if (name != null && name != buttonText) {
                              PostapiDriver_Change(
                                  context,
                                  DriverEmployee_id,
                                  eDriverEmployee_id,
                                  eDriver_remark,
                                  eDriverEmployee_at,
                                  coupon_id_driver);
                            } else {
                              AlertDriver_Select_Driver(context);
                            }

                            print('id ($buttonText)');
                            print('พขร เก่า ($DriverEmployee_id)');
                            print('พขร ใหม่ ($eDriverEmployee_id)');
                            print('หมายเหตุ ($eDriver_remark)');
                            print('วันที่เปลียน ($formattedDate)');
                          },
                          child: Center(child: Text('ยืนยัน')),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                            print('ยกเลิก');
                          },
                          child: Center(child: Text('ยกเลิก')),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ));
}
