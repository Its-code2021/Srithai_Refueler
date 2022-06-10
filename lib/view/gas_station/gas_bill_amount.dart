import 'package:cpac/controller/gas_qr_code.dart';
import 'package:cpac/utility/my_alert.dart';
import 'package:cpac/utility/status_all.dart';
import 'package:cpac/view/gas_station/gas_done.dart';
import 'package:cpac/view/gas_station/gas_loading_page.dart';
import 'package:cpac/view/gas_station/gas_tabel_all.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';

class Gas_Bill_Amount extends StatefulWidget {
  Gas_Bill_Amount({Key? key}) : super(key: key);

  @override
  State<Gas_Bill_Amount> createState() => _Gas_Bill_AmountState();
}

class _Gas_Bill_AmountState extends State<Gas_Bill_Amount> {
  Widget Gas_Amount_Btn() {
    return Container(
      width: 150,
      alignment: Alignment.bottomCenter,
      child: Align(
        child: Column(
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.blue[900],
                  minimumSize: const Size.fromHeight(
                    50,
                  ),
                  elevation: 5),
              child: const Text(
                'ยืนยัน',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                setState(() async {
                  _texthController.text.isEmpty
                      ? _validate = true
                      : _validate = false;
                  if (_validate == false) {
                    AlertBillAmount_Confirm(context);
                  } else if (_validate == true) {
                    AlertBillAmount_Null(context);
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> AlertBillAmount_Confirm(BuildContext context) async {
    var total_result = (Decimal.parse(_texthController.text) *
        Decimal.parse(BilDetail['refuel_amount'].toString()));
    showDialog(
      context: context,
      builder: (context) => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
        child: AlertDialog(
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Icon(
                    Icons.check_circle_outline_sharp,
                    size: 60,
                    color: Colors.green,
                  ),
                  Container(
                    height: 10,
                  ),
                  const Text(
                    'โปรดยืนยัน หลังจากยืนยันแล้ว จะไม่สามารถแก้ไขได้',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        'จำนวนลิตร: ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        BilDetail['refuel_amount'].toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.green),
                      ),
                      const Text(
                        ' ลิตร ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        'ราคาต่อลิตร: ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        _texthController.text,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.green),
                      ),
                      const Text(
                        ' ลิตร ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        'จำนวนเงินทั้งหมด: ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        total_result.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.green),
                      ),
                      const Text(
                        ' บาท ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Container(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 100,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.blue[900], elevation: 5),
                          onPressed: () {
                            var id = BilDetail['id'].toString();
                            var bill_amount = total_result.toString();
                            var oil_rate = _texthController.text;
                            PostConfirmtBilAmount(
                                context, id, bill_amount, oil_rate);
                            var Bin_Detail_id = id;
                            print(Bin_Detail_id);

                            print('Screen Shot');

                            // Navigator.of(context).pushAndRemoveUntil(
                            //     MaterialPageRoute(
                            //         builder: (context) => Gas_Done()),
                            //     (Route<dynamic> route) => false);
                            total_results.toString();
                            print(bill_amount);
                          },
                          child: const Center(
                            child: Text(
                              'ยืนยัน',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 100,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.red, elevation: 5),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Center(
                            child: Text(
                              'ยกเลิก',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    @override
    void initState() {
      super.initState();
      print('init');
      _texthController.text = '';
      _text = true; //variable to control enable property of textfield
    }

    Future<void> _refresh() async {
      setState(() {
        var Bin_history_id = BilDetail['id'];
        var Bin_Amount = BilDetail['bill_amount'];
        GetBin_history_detail_Gas_reload(context, Bin_history_id, Bin_Amount);
      });
      return Future.delayed(Duration(seconds: 2));
    }

    final key = GlobalKey<ScaffoldState>();
    // ignore: unnecessary_new

    // ignore: unnecessary_new
    return new Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Image.asset('images/002.png', fit: BoxFit.cover),
        centerTitle: true,
        backgroundColor: const Color(0xff438EB9),
      ),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: SingleChildScrollView(
          child: SafeArea(
              child: Column(
            children: [
              Container(
                height: 10,
              ),
              Container(
                width: double.infinity,
                height: 60,
                alignment: Alignment.center,
                color: const Color(0xff438EB9),
                // ignore: prefer_const_constructors
                child: Text(
                  'กรอกจำนวนราคาต่อลิตร',
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
              // Tabel_Bill_Amount(),
              BtnConfrim_BilAmount(),
              Container(
                height: 20,
              ),
              Gas_Amount_Btn(),
              Container(
                height: 20,
              ),
            ],
          )),
        ),
      ),
    );
  }
}

var total_result;
var total_results;

class BtnConfrim_BilAmount extends StatefulWidget {
  BtnConfrim_BilAmount();

  @override
  BtnConfrim_BilAmountState createState() {
    return BtnConfrim_BilAmountState();
  }
}

bool _validate = false;
var _texthController = TextEditingController();
bool _text = false;

class BtnConfrim_BilAmountState extends State<BtnConfrim_BilAmount> {
  @override
  void initState() {
    super.initState();

    _texthController.text = '';
    _text = true; //variable to control enable property of textfield
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Tavle_all(),
          ],
        ),
      ),
    );
  }

  _refreshAction(total_results) {
    setState(() {
      Tavle_all();
      total_results.toString();
    });
  }

  Widget Btn_Amount() {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
        child: Center(
          child: TextField(
            enabled: _text,
            controller: _text ? _texthController : null,
            textInputAction: TextInputAction.done,
            onChanged: (total_ref) {
              total_result = (Decimal.parse(_texthController.text) *
                  Decimal.parse(BilDetail['refuel_amount'].toString()));
              total_results = total_result;
              _refreshAction(total_results);
              print("$total_results");
            },
            autofocus: true,
            // onSubmitted: (String total_ref) {
            //   _refreshAction();
            //   total_results;
            //   print("$total_results");
            //   return _refreshAction();
            // },
            decoration: const InputDecoration(
              hintText: '0.00',
              contentPadding: EdgeInsets.symmetric(vertical: 0.1),
              border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal)),
              // errorText: _validate ? 'กรุณากรอกจะจำนวนลิตรที่เติมจริง' : null,
            ),
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Widget Tavle_all() {
    return Table(
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
              height: 60,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'ราคาต่อลิตร',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Btn_Amount()
                  // BtnConfrim_BilAmount(),
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Column(
                  //     children: <Widget>[
                  //       Center(
                  //         child: TextField(
                  //           controller: _text ? _texthController : null,
                  //           onChanged: (total_ref) {
                  //             Decimal total_result = (Decimal.parse(
                  //                     _texthController.text) *
                  //                 Decimal.parse(
                  //                     BilDetail['refuel_amount']
                  //                         .toString()));
                  //             total_results = total_result;
                  //             _refreshAction();
                  //           },
                  //           autofocus: true,
                  //           textInputAction: TextInputAction.done,
                  //           onSubmitted: (String total_ref) {
                  //             _refreshAction();
                  //             print("$total_results");
                  //             return _refreshAction();
                  //           },
                  //           decoration: const InputDecoration(
                  //             hintText: '0.00',
                  //             contentPadding:
                  //                 EdgeInsets.symmetric(vertical: 0.1),
                  //             border: const OutlineInputBorder(
                  //                 borderSide:
                  //                     BorderSide(color: Colors.teal)),
                  //             // errorText: _validate ? 'กรุณากรอกจะจำนวนลิตรที่เติมจริง' : null,
                  //           ),
                  //           keyboardType: TextInputType.number,
                  //           textAlign: TextAlign.center,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
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
                  if (_texthController.text == '') ...[
                    Text(
                      '0.00',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff428BCA)),
                      textAlign: TextAlign.center,
                    )
                  ] else ...[
                    Text(
                      total_results.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff428BCA)),
                      textAlign: TextAlign.center,
                    )
                  ]
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
    );
  }
}
