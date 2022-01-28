import 'package:cpac/controller/gas_qr_code.dart';
import 'package:cpac/utility/my_alert.dart';
import 'package:cpac/view/gas_station/gas_done.dart';
import 'package:cpac/view/gas_station/gas_tabel_all.dart';
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
                        BilDetail['amount'].toString(),
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
                        _texthController.text,
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
                            var bill_amount = _texthController.text;
                            PostConfirmtBilAmount(id, bill_amount);
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => Gas_Done()),
                                (Route<dynamic> route) => false);
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
      body: SingleChildScrollView(
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
                'กรอกจำนวนเงินน้ำมันที่เติม',
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
            Tabel_Bill_Amount(),
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
    );
  }
}

class BtnConfrim_BilAmount extends StatefulWidget {
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
    print('init');
    _texthController.text = '';
    _text = true; //variable to control enable property of textfield
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Center(
            child: TextField(
              enabled: _text,
              controller: _text ? _texthController : null,
              autofocus: true,
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
        ],
      ),
    );
  }
}
