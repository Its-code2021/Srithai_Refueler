import 'package:cpac/controller/gas_qr_code.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Gas_List_Payment_History_Detail extends StatefulWidget {
  Gas_List_Payment_History_Detail({Key? key}) : super(key: key);

  @override
  State<Gas_List_Payment_History_Detail> createState() =>
      _Gas_List_Payment_History_DetailState();
}

class _Gas_List_Payment_History_DetailState
    extends State<Gas_List_Payment_History_Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xff438EB9),
        shadowColor: Colors.white,
        centerTitle: true,
        title: Center(child: Image.asset('images/002.png', fit: BoxFit.cover)),
      ),
      body: Column(
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
              'รายละเอียดการรับชำระเงินค่าน้ำมัน',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          Container(
            height: 10,
          ),
          Tabel_Gas_List_Payment_History_Detail(),
        ],
      ),
    );
  }
}

Widget Tabel_Gas_List_Payment_History_Detail() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 5.0),
    child: Table(
      columnWidths: const {
        0: FlexColumnWidth(2),
        1: FlexColumnWidth(4),
      },
      border: TableBorder.all(
          color: Colors.black, style: BorderStyle.solid, width: 2),
      children: [
        TableRow(
          children: [
            Container(
              color: Color(0x34747474),
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'เลขที่ ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            Container(
              height: 40,
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    Paymant_List_History_Detail['id'].toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xff438EB9)),
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
              color: Color(0x34747474),
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'หน่วยงาน/กิจการ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            Container(
              height: 40,
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    Paymant_List_History_Detail['Site_name'].toString() +
                        '/' +
                        Paymant_List_History_Detail['Business_name'].toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xff438EB9)),
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
              color: Color(0x34747474),
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'บริษัท',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            Container(
              height: 40,
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    Paymant_List_History_Detail['Company_name'].toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xff438EB9)),
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
              color: Color(0x34747474),
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'วันที่เติมน้ำมัน',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            Container(
              height: 40,
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    Paymant_List_History_Detail['sdate'].toString() +
                        'ถึง' +
                        Paymant_List_History_Detail['edate'].toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xff438EB9)),
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
              color: Color(0x34747474),
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'จำนวนลิตร',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            Container(
              height: 40,
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    NumberFormat("#,###.##")
                        .format(Paymant_List_History_Detail['oil_amount']),
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xff438EB9)),
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
              color: Color(0x34747474),
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'จำนวนเงิน',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            Container(
              height: 40,
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    NumberFormat("#,###.##")
                        .format(Paymant_List_History_Detail['bill_amount']),
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xff438EB9)),
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
              color: Color(0x34747474),
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'ผู้แจ้งยอด(บัญชี)',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            Container(
              height: 40,
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    Paymant_List_History_Detail['created_name'].toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xff438EB9)),
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
              color: Color(0x34747474),
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'ชำระด้วย',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            Container(
              height: 40,
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (Paymant_List_History_Detail['payment_method'] ==
                          "1") ...{
                        const Text(
                          'เงินสด',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff438EB9)),
                          textAlign: TextAlign.start,
                        ),
                      } else ...{
                        const Text(
                          'บัตรเครดิต',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff438EB9)),
                          textAlign: TextAlign.start,
                        ),
                        // Text(
                        //   Paymant_List_History_Detail['card_no'].toString(),
                        //   style: TextStyle(
                        //       fontWeight: FontWeight.bold,
                        //       color: Color(0xff438EB9)),
                        //   textAlign: TextAlign.center,
                        // ),
                      }
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            Container(
              color: Color(0x34747474),
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'ผู้รับเงิน(ปั้ม)',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            Container(
              height: 40,
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    Paymant_List_History_Detail['fullname'].toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xff438EB9)),
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
