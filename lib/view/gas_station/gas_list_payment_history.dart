import 'package:cpac/controller/gas_qr_code.dart';
import 'package:cpac/view/gas_station/gas_list_payment_history_detail.dart';
import 'package:cpac/view/gas_station/gas_loading_page.dart';
import 'package:cpac/view/gas_station/tabbar_gas_home_payment.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Gas_List_Payment_History extends StatefulWidget {
  Gas_List_Payment_History({Key? key}) : super(key: key);

  @override
  State<Gas_List_Payment_History> createState() =>
      _Gas_List_Payment_HistoryState();
}

class _Gas_List_Payment_HistoryState extends State<Gas_List_Payment_History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xff438EB9),
        shadowColor: Colors.white,
        centerTitle: true,
        title: Center(
          child: Image.asset('images/002.png', fit: BoxFit.cover),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            GetPump_Paymant_List();
            GetPump_Paymant_List_History();
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (context) =>
                        Loading_Gas_TabBar_Menu_Gas_Home_Payment()),
                (Route<dynamic> route) => false);
          },
        ),
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
              'ประวัติการรับชำระเงินค่าน้ำมัน',
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
          Table_History_Header_Payment(),
          if (Paymant_List_History != null && Paymant_List_History != "") ...{
            Expanded(
              child: Table_History_Body_Payment(),
            ),
          } else ...{
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey)),
                padding: const EdgeInsets.all(5.0),
                child: Center(
                  child: const Text(
                    'ยังไม่มีประวัติการรับชำระเงินค่าน้ำมัน',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              ),
            ),
          },
          Container(
            height: 10,
          ),
        ],
      ),
    );
  }
}

Widget Table_History_Header_Payment() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 5.0),
    child: Table(
      columnWidths: const {
        0: FlexColumnWidth(1),
        1: FlexColumnWidth(2),
        2: FlexColumnWidth(2),
        3: FlexColumnWidth(2),
      },
      border: TableBorder.all(),
      children: [
        TableRow(
          children: [
            Container(
              color: const Color(0x34747474),
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'เลขที่',
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
              color: const Color(0x34747474),
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'วันที่',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: const Color(0x34747474),
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'หน่วยงาน/กิจการ',
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
              color: const Color(0x34747474),
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
              color: const Color(0x34747474),
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

Widget Table_History_Body_Payment() {
  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Column(
        children: [
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: Paymant_List_History.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: Table(
                    columnWidths: const {
                      0: FlexColumnWidth(1),
                      1: FlexColumnWidth(2),
                      2: FlexColumnWidth(2),
                      3: FlexColumnWidth(2),
                    },
                    border: TableBorder.all(),
                    children: [
                      TableRow(
                        children: [
                          Container(
                            height: 50.0,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Text(
                                    Paymant_List_History[index]['id']
                                        .toString(),
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
                              children: [
                                Container(
                                  child: Text(
                                    Paymant_List_History[index]['sdate']
                                            .toString() +
                                        ' ถึง ' +
                                        Paymant_List_History[index]['edate']
                                            .toString(),
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
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
                              children: [
                                Container(
                                  child: Text(
                                    Paymant_List_History[index]['Site_name']
                                            .toString() +
                                        '/' +
                                        Paymant_List_History[index]
                                                ['Business_name']
                                            .toString(),
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
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
                              children: [
                                Container(
                                  child: Text(
                                    NumberFormat("#,###.##").format(
                                        Paymant_List_History[index]
                                            ['bill_amount']),
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
                              children: [
                                Container(
                                    child: IconButton(
                                        color: Colors.blue[900],
                                        onPressed: () {
                                          var Paymant_List_History_Ids =
                                              Paymant_List_History[index]['id']
                                                  .toString();

                                          GetPump_Paymant_List_History_Detail(
                                              context,
                                              Paymant_List_History_Ids);
                                        },
                                        icon: Icon(Icons.assignment))),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              }),
        ],
      ),
    ),
  );
}
