import 'package:cpac/controller/gas_qr_code.dart';
import 'package:cpac/controller/user_profile.dart';
import 'package:cpac/utility/status_all.dart';
import 'package:cpac/view/gas_station/gas_bill_amount.dart';
import 'package:cpac/view/gas_station/gas_date_picker.dart';
import 'package:cpac/view/gas_station/gas_draw_user.dart';
import 'package:cpac/view/gas_station/gas_history_detail.dart';
import 'package:cpac/view/gas_station/gas_loading_page.dart';
import 'package:cpac/view/gas_station/gas_send_email.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget Tabel_Gas_detail() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 5.0),
    child: Table(
      border: TableBorder.all(
          color: Colors.black, style: BorderStyle.solid, width: 2),
      children: [
        TableRow(
          children: [
            Container(
              color: const Color(0xffC3C3C3),
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'เลขที่คูปอง ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            Container(
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    QrCode['code'].toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xff428BCA)),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            Container(
              color: const Color(0xffC3C3C3),
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'ทะเบียนรถ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            Container(
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    QrCode["truck_license"].toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xff428BCA)),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            Container(
              color: const Color(0xffC3C3C3),
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'ชื่อพนักงานขับรถ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            Container(
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    QrCode['driver'].toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xff428BCA)),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            Container(
              color: const Color(0xffC3C3C3),
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'หน่วยงาน/กิจการ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            Container(
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    QrCode['site_name'].toString() +
                        '/' +
                        QrCode['business_name'].toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xff428BCA)),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            Container(
              color: const Color(0xffC3C3C3),
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'จำนวนลิตร',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            Container(
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    QrCode['amount'].toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xff428BCA)),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            Container(
              color: const Color(0xffC3C3C3),
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'ชื่อปั้มที่เติม',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            Container(
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    Profile['fullname'].toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xff428BCA)),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget Tabel_Gas_detail_draw() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 5.0),
    child: Table(
      border: TableBorder.all(
          color: Colors.black, style: BorderStyle.solid, width: 2),
      children: [
        TableRow(
          children: [
            Container(
              color: const Color(0xffC3C3C3),
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'เลขที่คูปอง',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            Container(
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    Gas_Details['code'].toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xff428BCA)),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            Container(
              color: const Color(0xffC3C3C3),
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'ทะเบียนรถ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            Container(
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    Gas_Details['truck_license'].toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xff428BCA)),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            Container(
              color: const Color(0xffC3C3C3),
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'ชื่อพนักงานขับรถ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            Container(
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    Gas_Details['driver'].toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: const Color(0xff428BCA)),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            Container(
              color: const Color(0xffC3C3C3),
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'หน่วยงาน/กิจการ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            Container(
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    Gas_Details['site_name'].toString() +
                        '/' +
                        Gas_Details['business_name'].toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: const Color(0xff428BCA)),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            Container(
              color: const Color(0xffC3C3C3),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      enabled: false,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 0.1),
                        hintText: "จำนวนลิตรที่เติมจริง",
                        hintStyle: TextStyle(color: Colors.black87),
                      ),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff428BCA)),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [BtnConfrim_Oil_Total()],
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            Container(
              color: const Color(0xffC3C3C3),
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'ชื่อผู้เติมน้ำมัน',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            Container(
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    Gas_Details['refueler_name'].toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: const Color(0xff428BCA)),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            Container(
              color: const Color(0xffC3C3C3),
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'สถานะ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            Status_Gas_All()
          ],
        ),
        TableRow(
          children: [
            Container(
              color: const Color(0xffC3C3C3),
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'วัน/เวลาที่เติม',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            Container(
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    Gas_Details['refuel_at'].toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.green),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget Tabel_Bill_Amount() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 5.0),
    child: Table(
      border: TableBorder.all(
          color: Colors.black, style: BorderStyle.solid, width: 2),
      children: [
        TableRow(
          children: [
            Container(
              color: const Color(0xffC3C3C3),
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'เลขที่คูปอง ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            Container(
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    BilDetail['code'].toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xff428BCA)),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            Container(
              color: const Color(0xffC3C3C3),
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'ทะเบียนรถ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            Container(
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    BilDetail['truck_license'].toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xff428BCA)),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            Container(
              color: const Color(0xffC3C3C3),
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'ชื่อพนักงานขับรถ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            Container(
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    BilDetail['driver'].toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xff428BCA)),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            Container(
              color: const Color(0xffC3C3C3),
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'จำนวนลิตร',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            Container(
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    BilDetail['refuel_amount'].toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xff428BCA)),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            Container(
              color: const Color(0xffC3C3C3),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      enabled: false,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 0.1),
                        hintText: "ราคาต่อลิตร",
                        hintStyle: TextStyle(color: Colors.black87),
                      ),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff428BCA)),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // children: [BtnConfrim_BilAmount()],
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            Container(
              color: const Color(0xffC3C3C3),
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'จำนวนเงินทั้งหมด',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            Container(
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    total_results.toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xff428BCA)),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            Container(
              color: const Color(0xffC3C3C3),
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'ชื่อปั้มที่เติม',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            Container(
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    BilDetail['refueler_name'].toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xff428BCA)),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            Container(
              color: const Color(0xffC3C3C3),
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'วัน/เวลาที่เติม',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            Container(
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    BilDetail['refuel_at'].toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.green),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            Container(
              color: const Color(0xffC3C3C3),
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'สถานะ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            Status_Gas_All()
          ],
        ),
      ],
    ),
  );
}

Widget Tabel_Header_Gas_History() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 5.0),
    child: Table(
      border: TableBorder.all(),
      children: [
        TableRow(
          children: [
            Container(
              color: const Color(0xffC3C3C3),
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Container(
                    child: const Text(
                      'No.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: const Color(0xffC3C3C3),
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Text(
                    'เลขที่คูปอง',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: const Color(0xffC3C3C3),
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'วันที่เติม',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: const Color(0xffC3C3C3),
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'จำนวนลิตร',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Container(
              color: const Color(0xffC3C3C3),
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'จำนวนเงิน',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Container(
              color: const Color(0xffC3C3C3),
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'ดูรายละเอียด',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    ),
  );
}

Widget Tabel_Body_Gas_History(BuildContext context) {
  var sum_amount;
  return Column(
    children: [
      ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: History_Refuel.length,
        itemBuilder: (BuildContext context, int index) {
          sum_amount = History_Refuel[index]['amount'].toString() +
              History_Refuel[index]['amount'].toString();
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Table(
              border: TableBorder.all(),
              children: [
                TableRow(
                  children: [
                    Container(
                      height: 50.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Container(
                            child: Text(
                              " ${index + 1}",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 50.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Text(
                            History_Refuel[index]['code'].toString(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 50.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            History_Refuel[index]['refuel_date'].toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 50.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            History_Refuel[index]['refuel_amount'].toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 50.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            History_Refuel[index]['bill_amount'].toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                              onPressed: () {
                                var Bin_history_id =
                                    History_Refuel[index]['id'];
                                var Bin_Amount =
                                    History_Refuel[index]['bill_amount'];

                                ///

                                GetBin_history_detail_Gas(
                                    context, Bin_history_id, Bin_Amount);
                                print(Bin_history_id);
                                print(Bin_Amount);
                                // var History_id = History_Refuel[index]['id'];
                                // print(History_Refuel[index]['id']);
                                // GetHistory_Detail_Gas(History_id);
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) =>
                                //           Loading_Page_History_Detail()),
                                // );
                              },
                              icon: Icon(
                                Icons.assignment,
                                color: Colors.blue[900],
                              )),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
      Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: const Text(
                        'คูปองทั้งหมด',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        BTW_date['coupon_total'].toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue[900]),
                      ),
                    ),
                    Container(
                      child: const Text(
                        'ใบ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: const Text(
                        'รวมจำนวนน้ำมัน',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        NumberFormat("#,###.##")
                            .format(BTW_date['refuel_amount_total']),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue[900]),
                      ),
                    ),
                    const Text(
                      'ลิตร',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: const Text(
                        'รวมจำนวนเงินทั้งหมด',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        NumberFormat("#,###.##")
                            .format(BTW_date['bill_amount_total']),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue[900]),
                      ),
                    ),
                    const Text(
                      'บาท',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

Widget Tabel_History_detail_Gas(BuildContext context) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 5.0),
    child: Column(
      children: [
        Table(
          border: TableBorder.all(
              color: Colors.black, style: BorderStyle.solid, width: 2),
          children: [
            TableRow(
              children: [
                Container(
                  color: const Color(0xffC3C3C3),
                  height: 40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'เลขที่ คูปอง ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
                Container(
                  height: 40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        History_Detail['code'].toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff428BCA)),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                Container(
                  color: const Color(0xffC3C3C3),
                  height: 40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'ทะเบียนรถ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
                Container(
                  height: 40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        History_Detail["truck_license"].toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff428BCA)),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                Container(
                  color: const Color(0xffC3C3C3),
                  height: 40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'ชื่อพนักงานขับรถ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
                Container(
                  height: 40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        History_Detail['driver'].toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff428BCA)),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                Container(
                  color: const Color(0xffC3C3C3),
                  height: 40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'จำนวนลิตร',
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
                Container(
                  height: 40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        History_Detail['refuel_amount'].toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff428BCA)),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                Container(
                  color: const Color(0xffC3C3C3),
                  height: 40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'ชื่อปั้มที่เติม',
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
                Container(
                  height: 40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        History_Detail['refueler_name'].toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff428BCA)),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                Container(
                  color: const Color(0xffC3C3C3),
                  height: 40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'สถานะ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
                Status_Gas_History(),
              ],
            ),
            TableRow(
              children: [
                Container(
                  color: const Color(0xffC3C3C3),
                  height: 40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'วัน/เวลาที่เติม',
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
                Container(
                  height: 40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        History_Detail['refuel_at'].toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.green),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size.fromHeight(
                50,
              ),
              primary: Colors.blue[900],
              // fromHeight use double.infinity as width and 40 is the height
            ),
            onPressed: () {
              var Bin_history_id = History_Detail['id'];
              var History_Refuel = History_Detail['bill_amount'];
              GetBin_history_detail_Gas(
                  context, Bin_history_id, History_Refuel);
              print(Bin_history_id);
            },
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'บันทึกสลิปอีกครั้ง ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Icon(Icons.receipt_long)
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
