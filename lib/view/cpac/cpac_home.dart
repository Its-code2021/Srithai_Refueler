import 'package:cpac/view/cpac/tabbar_cpac_coupong.dart';
import 'package:flutter/material.dart';

class Cpac_Home extends StatefulWidget {
  Cpac_Home({Key? key}) : super(key: key);

  @override
  State<Cpac_Home> createState() => _Cpac_HomeState();
}

class _Cpac_HomeState extends State<Cpac_Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Image.asset('images/002.png', fit: BoxFit.cover)),
        backgroundColor: const Color(0xff438EB9),
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
                'รายการ DP ที่รอเติมน้ำมัน',
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
            Table_Cpac_Home_Header(),
            Container(
              child: Table_Cpac_Home_Body(),
            ),
            Container(
              width: double.infinity,
              height: 50,
              alignment: Alignment.center,
              color: const Color(0xff438EB9),
              child: const Text(
                'รายการ DP ที่รอเติมน้ำมัน',
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
            Table_Cpac_Home_DP_Detail_Header(),
            Container(
              child: Table_Cpac_Home_DP_Detail_Body(),
            ),
          ],
        ),
      ),
    );
  }

  Widget Table_Cpac_Home_Header() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Table(
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
                      'เบอร์รถ',
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
                  children: [
                    const Text(
                      'ทะเบียนรถ',
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
                  children: [
                    const Text(
                      'จำนวนเที่ยว',
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
                  children: [
                    const Text(
                      'จำนวนลิตร',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget Table_Cpac_Home_Body() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Column(
          children: [
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 1,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    child: Table(
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
                                      '129$index',
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: Color(0xff0044FF),
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
                                      '73-049$index',
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: Color(0xff0044FF),
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
                                      '10',
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: Color(0xff0044FF),
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
                                      '80',
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: Color(0xff0044FF),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }),
            Container(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    print('สร้างคูปอง');
                    AlertCpac_CreateCoupon(context);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue[900],
                    minimumSize: const Size.fromHeight(
                      50,
                    ), //
                  ),
                  child: Text(
                    'สร้างคูปอง',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  Widget Table_Cpac_Home_DP_Detail_Header() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Table(
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
                      'หมายเลขDP',
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
                  children: [
                    const Text(
                      'วันที่วิ่งงาน',
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
                  children: [
                    const Text(
                      'จำนวนลิตร',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget Table_Cpac_Home_DP_Detail_Body() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Column(
          children: [
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 1,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    child: Table(
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
                                      '404018168$index',
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: Color(0xff0044FF),
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
                                      '25/12/2021 09:00',
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: Color(0xff0044FF),
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
                                      '80',
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: Color(0xff0044FF),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }),
            Container(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> AlertCpac_CreateCoupon(BuildContext context) async {
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
                  size: 50,
                  color: Colors.red,
                ),
                Container(
                  height: 10,
                ),
                const Text(
                  'กรุณายืนยันเพื่อสร้างคูปอง',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                Container(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue[900],
                      ),
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => TabBar_Cpac_Coupong()),
                            (Route<dynamic> route) => false);
                        print('ตกลง');
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
                        //
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
}
