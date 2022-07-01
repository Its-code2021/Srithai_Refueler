import 'package:cpac/controller/gas_qr_code.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'gas_list_payment_detail.dart';
import 'gas_list_payment_history.dart';
import 'gas_loading_page.dart';

class Gas_List_Payment extends StatefulWidget {
  Gas_List_Payment({Key? key}) : super(key: key);

  @override
  State<Gas_List_Payment> createState() => _Gas_List_PaymentState();
}

class _Gas_List_PaymentState extends State<Gas_List_Payment> {
  Future<void> _refresh() async {
    setState(() {
      GetPump_Paymant_List_Again(context);
    });
    return Future.delayed(Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color(0xff438EB9),
          shadowColor: Colors.white,
          centerTitle: true,
          title:
              Center(child: Image.asset('images/002.png', fit: BoxFit.cover)),
        ),
        body: RefreshIndicator(
          onRefresh: _refresh,
          child: Container(
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
                    'รายการรับชำระเงินค่าน้ำมัน',
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
                if (Paymant_List != null && Paymant_List != "") ...{
                  Expanded(
                    child: ListView.builder(
                        itemCount: Paymant_List.length,
                        itemBuilder: (context, index) {
                          return Card(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.blue, width: 1),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: SingleChildScrollView(
                              physics: NeverScrollableScrollPhysics(),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(bottom: 10, top: 10),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        var Paymant_List_Ids =
                                            Paymant_List[index]["id"];
                                        GetPump_Paymant_List_Detail(
                                            context, Paymant_List_Ids);
                                        print(Paymant_List_Ids);
                                        // Navigator.of(context).push(
                                        //   MaterialPageRoute(
                                        //       builder: (context) =>
                                        //           Gas_List_Payment_Detail()),
                                        // );
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    'เลขที่: ',
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    Paymant_List[index]["id"]
                                                        .toString(),
                                                    textAlign: TextAlign.end,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    'วันที่: ',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    Paymant_List[index]
                                                            ["sdate"] +
                                                        ' ถึง ' +
                                                        Paymant_List[index]
                                                            ["edate"],
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    Paymant_List[index]
                                                                ["Site_name"]
                                                            .toString() +
                                                        '/' +
                                                        Paymant_List[index][
                                                                "Business_name"]
                                                            .toString(),
                                                    textAlign: TextAlign.end,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    NumberFormat("#,###.##")
                                                        .format(Paymant_List[
                                                                index]
                                                            ["bill_amount"]),
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff438EB9),
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 20),
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                  Container(
                                                    child: Text(
                                                      ' บาท',
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xff438EB9),
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 14),
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                  Container(
                    height: 10,
                  ),
                } else ...{
                  SingleChildScrollView(
                    child: Container(
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: Not_List(context)),
                  ),
                },
              ],
            ),
          ),
        ),
        floatingActionButton: Container(
            padding: EdgeInsets.all(5.0),
            width: MediaQuery.of(context).size.width,
            child: Btn_History(context)));
  }
}

Widget Btn_History(BuildContext context) {
  if (Paymant_List_History != null && Paymant_List_History != "") {
    return FloatingActionButton.extended(
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(3)),
      ),
      backgroundColor: Colors.blue[900],
      icon: const Icon(Icons.history),
      label: const Text(
        'ประวัติการรับระเงิน',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      onPressed: () {
        if (Paymant_List_History != null && Paymant_List_History != "") {
          GetPump_Paymant_List_History();
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (context) => Loading_Gas_List_Payment_History()),
              (Route<dynamic> route) => false);
        }
      },
    );
  } else {
    return Container();
  }
}

Widget Not_List(BuildContext context) {
  return SingleChildScrollView(
    physics: AlwaysScrollableScrollPhysics(),
    child: Container(
      height: MediaQuery.of(context).size.height * 0.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'ยังไม่มีรายการรับชำระเงินค่าน้ำมัน',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Container(
            height: 10,
          ),
          TextButton(
              onPressed: () {
                Future.delayed(
                  Duration(seconds: 2),
                  () {
                    GetPump_Paymant_List_BTN(context);
                  },
                );
              },
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'โหลดข้อมูลใหม่',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Icon(Icons.refresh_outlined)
                  ],
                ),
              ))
        ],
      ),
    ),
  );
}
