// ignore_for_file: avoid_print, prefer_const_constructors, unnecessary_new

import 'package:cpac/controller/gas_qr_code.dart';
import 'package:cpac/view/gas_station/gas_history.dart';
import 'package:cpac/view/gas_station/gas_loading_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Date_time_StartDate_EndDate extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Date_time_StartDate_EndDate();
  }
}

var startdate;
var enddate;

class _Date_time_StartDate_EndDate extends State<Date_time_StartDate_EndDate> {
  TextEditingController dateinputStartDate = TextEditingController();
  TextEditingController dateinpuEndtDatet = TextEditingController();
  //text editing controller for text field

  @override
  void initState() {
    dateinputStartDate.text = ""; //set the initial value of text field
    dateinpuEndtDatet.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          Row(
            children: [
              // ignore: unnecessary_new
              new Flexible(
                // ignore: unnecessary_new
                child: Column(
                  children: [
                    Text('วันที่เริ่ม'),
                    // ignore: unnecessary_new
                    new TextField(
                      controller: dateinputStartDate,
                      // ignore: prefer_const_constructors
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        hintText: BTW_date['startdate'],
                        // ignore: prefer_const_constructors
                        icon: Icon(Icons.calendar_today),
                      ),
                      readOnly:
                          true, //set it true, so that user will not able to edit text
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101));

                        if (pickedDate != null) {
                          print(pickedDate);
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate);
                          print(formattedDate);

                          setState(() {
                            dateinputStartDate.text = formattedDate;
                          });
                        } else {
                          print("Date is not selected");
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            height: 20,
          ),
          Row(
            children: [
              // ignore: unnecessary_new
              new Flexible(
                // ignore: unnecessary_new
                child: Column(
                  children: [
                    Text(
                      'วันที่สิ้นสุด',
                      textAlign: TextAlign.start,
                    ),
                    new TextField(
                      controller: dateinpuEndtDatet,
                      // ignore: prefer_const_constructors
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        // ignore: prefer_const_constructors
                        icon: Icon(Icons.calendar_today),
                        hintText: BTW_date['enddate'],
                      ),
                      readOnly:
                          true, //set it true, so that user will not able to edit text
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101));

                        if (pickedDate != null) {
                          print(pickedDate);
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate);
                          print(formattedDate);

                          setState(() {
                            dateinpuEndtDatet.text = formattedDate;
                          });
                        } else {
                          print("Date is not selected");
                        }
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.blue[900],
                minimumSize: Size.fromHeight(
                  50,
                ), //
              ),
              onPressed: () {
                startdate = dateinputStartDate.text;
                enddate = dateinpuEndtDatet.text;
                print('$startdate - $enddate');
                PostPumpHistoryRefue(startdate, enddate);

                // Navigator.of(context).pushAndRemoveUntil(
                //     MaterialPageRoute(
                //         builder: (context) => Loading_Page_Date()),
                //     (Route<dynamic> route) => false);
              },
              child: Text('ยืนยัน'),
            ),
          ),
          // ElevatedButton(
          //   onPressed: _refreshAction,
          //   child: Text('data'),
          // ),
        ],
      ),
    );
  }
}
