// ignore_for_file: prefer_const_constructors, dead_code, unnecessary_new

import 'package:cpac/controller/gas_qr_code.dart';
import 'package:cpac/controller/user_profile.dart';
import 'package:cpac/utility/date_time.dart';

import 'package:cpac/view/gas_station/gas_tabel_all.dart';
import 'package:cpac/view/login_pump_gas.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class Gas_History extends StatefulWidget {
  Gas_History({Key? key}) : super(key: key);

  @override
  State<Gas_History> createState() => _Gas_HistoryState();
}

class _Gas_HistoryState extends State<Gas_History> {
  TextEditingController dateinputStartDate = TextEditingController();
  TextEditingController dateinpuEndtDatet = TextEditingController();
  @override
  void initState() {
    dateinputStartDate.text = ""; //set the initial value of text field
    dateinpuEndtDatet.text = "";

    super.initState();
  }

  var startdates;
  var enddates;
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    bool _isDrawerOpen = false;
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Image.asset('images/002.png', fit: BoxFit.cover)),
        backgroundColor: const Color(0xff438EB9),
        // actions: [
        //   Builder(
        //     builder: (context) => IconButton(
        //         icon: Icon(Icons.refresh),
        //         onPressed: () {
        //           dateinputStartDate.clear();
        //           dateinpuEndtDatet.clear();
        //           _refreshAction();
        //           print('$startdate - $enddate');
        //         }),
        //   ),
        // ],
      ),
      resizeToAvoidBottomInset: true,
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
                'ประวัติการเติมน้ำมัน',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),

            Container(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'วันที่ ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            new Flexible(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 40,
                                    child: new TextField(
                                      textAlign: TextAlign.center,
                                      textAlignVertical:
                                          TextAlignVertical.bottom,
                                      controller: dateinputStartDate,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        hintText: BTW_date['startdate'],
                                      ),
                                      readOnly: true,
                                      onTap: () async {
                                        DateTime? pickedDate =
                                            await showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime(2000),
                                                lastDate: DateTime(2101));

                                        if (pickedDate != null) {
                                          print(pickedDate);
                                          String formattedDate =
                                              DateFormat('yyyy-MM-dd')
                                                  .format(pickedDate);
                                          print(formattedDate);

                                          setState(() {
                                            dateinputStartDate.text =
                                                formattedDate;
                                          });
                                        } else {
                                          print("Date is not selected");
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        ' ถึง ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            new Flexible(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 40,
                                    child: new TextField(
                                      textAlign: TextAlign.center,
                                      textAlignVertical:
                                          TextAlignVertical.bottom,
                                      controller: dateinpuEndtDatet,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        hintText: BTW_date['enddate'],
                                      ),
                                      readOnly: true,
                                      onTap: () async {
                                        DateTime? pickedDate =
                                            await showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime(2000),
                                                lastDate: DateTime(2101));

                                        if (pickedDate != null) {
                                          print(pickedDate);
                                          String formattedDate =
                                              DateFormat('yyyy-MM-dd')
                                                  .format(pickedDate);
                                          print(formattedDate);

                                          setState(() {
                                            dateinpuEndtDatet.text =
                                                formattedDate;
                                          });
                                        } else {
                                          print("Date is not selected");
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 10,
                      ),
                      Container(
                        width: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.blue[900],
                              minimumSize: Size.fromHeight(
                                40,
                              )),
                          onPressed: () {
                            startdate = dateinputStartDate.text;
                            enddate = dateinpuEndtDatet.text;
                            print('$startdate - $enddate');
                            PostPumpHistoryRefue(startdate, enddate);
                            _refreshAction();
                          },
                          child: Center(child: Icon(Icons.search)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Tabel_Header_Gas_History(),
            Tabel_Body_Gas_History(context),
            // Tabel_Body_Gas_History_Summary(),
            if (BTW_date['coupon_total'] != 0 &&
                BTW_date['coupon_total'] != '') ...{
              Container(height: 10),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue[900],
                    minimumSize: const Size.fromHeight(
                      50,
                    ), //
                  ),
                  onPressed: () {
                    startdates = BTW_date['startdate'].toString();
                    enddates = BTW_date['enddate'].toString();
                    GetSendMail_Gas(context, startdates, enddates);
                    print(BTW_date['startdate']);
                    print(BTW_date['enddate']);
                    print('ยืนยัน');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('ส่งเมล์  '),
                      Icon(Icons.send_sharp),
                    ],
                  ),
                ),
              ),
            } else ...{
              Container(height: 10),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey,
                    minimumSize: const Size.fromHeight(
                      50,
                    ), //
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('ส่งเมล์  '),
                      Icon(Icons.send_sharp),
                    ],
                  ),
                ),
              ),
            },

            // ElevatedButton(
            //   onPressed: _refreshAction,
            //   child: Text('data'),
            // ),
          ],
        ),
      ),
    );
  }

  _refreshAction() {
    setState(() {
      Gas_History;
    });
  }
}
