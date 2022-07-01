import 'package:cpac/controller/gas_qr_code.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'gas_screenshot_payment.dart';

class Gas_List_Payment_Detail extends StatefulWidget {
  Gas_List_Payment_Detail({Key? key}) : super(key: key);

  @override
  State<Gas_List_Payment_Detail> createState() =>
      _Gas_List_Payment_DetailState();
}

class _Gas_List_Payment_DetailState extends State<Gas_List_Payment_Detail> {
  void initState() {
    super.initState();
    Tabel_Gas_List_Payment_Detail();
    Paymant_List_Detail;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff438EB9),
        title: Image.asset(
          'images/002.png',
        ),
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
              'สรุปยอดรับชำระเงินค่าน้ำมัน',
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
          Tabel_Gas_List_Payment_Detail(),
          Container(
            height: 10,
          ),
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
                  AlertConfrimAmout(context);
                  print('ยืนยัน');
                },
                child: const Text(
                  'ยืนยัน',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                )),
          )
        ],
      )),
    );
  }
}

Future<void> AlertConfrimAmout(BuildContext context) async {
  showDialog(
    context: context,
    builder: (context) => MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
      child: AlertDialog(
        actions: [
          Column(
            children: [
              const Icon(Icons.error_outline, size: 50, color: Colors.red),
              Container(
                height: 5,
              ),
              Column(
                children: [
                  Column(
                    children: [
                      const Text(
                        'ผู้รับเงิน(ปั้ม) ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        Paymant_List_Detail['fullname'].toString(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff0089FF)),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        'ได้รับเงิน',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        'จำนวน  ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        NumberFormat("#,###.##")
                            .format(Paymant_List_Detail['bill_amount']),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff0089FF)),
                      ),
                      const Text(
                        ' เรียบร้อยแล้ว',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
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
                    style: ElevatedButton.styleFrom(primary: Color(0xff0089FF)),
                    onPressed: () {
                      int Paymant_List_Detail_id = Paymant_List_Detail['id'];
                      print(Paymant_List_Detail_id);
                      PostPumpPaymantUpdate(context, Paymant_List_Detail_id);
                      // Navigator.of(context).pushAndRemoveUntil(
                      //     MaterialPageRoute(
                      //         builder: (context) =>
                      //             Gas_Screenshot_Payment(context)),
                      //     (Route<dynamic> route) => false);
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

Widget Tabel_Gas_List_Payment_Detail() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 4.0),
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
                    Paymant_List_Detail['id'].toString(),
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
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
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
                    Paymant_List_Detail['Site_name'].toString() +
                        '/' +
                        Paymant_List_Detail['Business_name'].toString(),
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
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    Paymant_List_Detail['Company_name'].toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xff438EB9)),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
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
                    Paymant_List_Detail['sdate'].toString() +
                        ' ถึง ' +
                        Paymant_List_Detail['edate'].toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xff438EB9)),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
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
                        .format(Paymant_List_Detail['oil_amount']),
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
              padding: EdgeInsets.symmetric(horizontal: 10.0),
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
                        .format(Paymant_List_Detail['bill_amount']),
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
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
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
                    Paymant_List_Detail['created_name'].toString(),
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
                      if (Paymant_List_Detail['payment_method'] == "1") ...{
                        const Text(
                          'เงินสด',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff438EB9)),
                          textAlign: TextAlign.start,
                        ),
                      } else ...{
                        Text(
                          'บัตรเครดิต',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff438EB9)),
                          textAlign: TextAlign.center,
                        ),
                        // Text(
                        //   Paymant_List_Detail['card_no'],
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
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
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
                    Paymant_List_Detail['fullname'].toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xff438EB9)),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
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
