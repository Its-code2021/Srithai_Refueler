// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:cpac/controller/qr_code.dart';
import 'package:cpac/utility/status_all.dart';
import 'package:cpac/view/driver/coupon_detail.dart';
import 'package:cpac/view/driver/staff_draw_user.dart';
import 'package:cpac/view/driver/staff_draw_user_gen.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Widget Tabel_Header_DpOil() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 5.0),
    child: Table(
      border: TableBorder.all(),
      children: [
        TableRow(
          children: [
            Container(
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    'เบอร์รถ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    'ทะเบียนรถ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    'จำนวนเที่ยว',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'จำนวนลิตร',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
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

Widget Tabel_Header_DpOil_Body() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 5.0),
    child: Table(
      border: TableBorder.all(),
      children: [
        TableRow(
          children: [
            Container(
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '1291',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xff438EB9),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '73-0494',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xff438EB9),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '10',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xff438EB9),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '80',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xff438EB9),
                    ),
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

Widget Tabel_Header_Row() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 5.0),
    child: Table(
      border: TableBorder.all(
          color: Colors.black, style: BorderStyle.solid, width: 2),
      children: [
        TableRow(
          children: [
            Container(
              color: Color(0xffC3C3C3),
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'ลำดับ',
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
                    '1',
                    style: TextStyle(
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
              color: Color(0xffC3C3C3),
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'วันที่วิ่งงาน',
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
                    '25/12/2021 09:00',
                    style: TextStyle(
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
              color: Color(0xffC3C3C3),
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'หมายเลขดี.พี.',
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
                    '4040181681',
                    style: TextStyle(
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
              color: Color(0xffC3C3C3),
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'เบอร์รถ/ทะเบียนรถ',
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
                    '1291/73-0494',
                    style: TextStyle(
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
              color: Color(0xffC3C3C3),
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'ต้นทาง - ปลายทาง',
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
                    'มาลีวัล -> อบต.ในคลองบางปลากด',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xff428BCA)),
                    textAlign: TextAlign.center,
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
              color: Color(0xffC3C3C3),
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'โซน',
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
                    '3',
                    style: TextStyle(
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
              color: Color(0xffC3C3C3),
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'น้ำมันที่กำหนด',
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
                    '11',
                    style: TextStyle(
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

Widget Tabel_Coupon_detail() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 5.0),
    child: Table(
      border: TableBorder.all(
          color: Colors.black, style: BorderStyle.solid, width: 2),
      children: [
        TableRow(
          children: [
            Container(
              color: Color(0xffC3C3C3),
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                    'DPRAY22010531-2 ',
                    style: TextStyle(
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
              color: Color(0xffC3C3C3),
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                    '12/01/2022 09:00',
                    style: TextStyle(
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
              color: Color(0xffC3C3C3),
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                    'กท 65-1535',
                    style: TextStyle(
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
              color: Color(0xffC3C3C3),
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                    'นายสมคิด',
                    style: TextStyle(
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
              color: Color(0xffC3C3C3),
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'จำนวนลิตรที่เติมจริง',
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
                    '142',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xff428BCA)),
                    textAlign: TextAlign.center,
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
              color: Color(0xffC3C3C3),
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                    'นายสมชาย',
                    style: TextStyle(
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
              color: Color(0xffC3C3C3),
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'สถานะ',
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
                    'เติมแล้ว',
                    style: TextStyle(
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
              color: Color(0xffC3C3C3),
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                    '12/01/2022 10:00',
                    style: TextStyle(
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

Widget Tabel_Header_Coupon_History() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 5.0),
    child: Table(
      border: TableBorder.all(),
      children: [
        TableRow(
          children: [
            Container(
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Container(
                    child: Text(
                      'ลำดับ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    'เลขที่คูปอง',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    'ปั้มน้ำมัน',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Container(
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'จำนวนลิตร',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'สถานะ',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
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

Widget Tabel_Body_Coupon_History(BuildContext context) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 5.0),
    child: Container(
      child: Table(
        border: TableBorder.all(),
        children: [
          for (var i = 1; i < 20; i++)
            TableRow(
              children: [
                Container(
                  height: 50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        ' $i',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff438EB9),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'DPRAY22010531-$i',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff438EB9),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'PTT',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff438EB9),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '14$i',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff438EB9),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Coupon_Detail()),
                          );
                          print('$i');
                        },
                        child: Text(
                          'รอยืนยัน',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
        ],
      ),
    ),
  );
}

Widget Tabel_Detailed_Summary() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 5.0),
    child: Table(
      border: TableBorder.all(
          color: Colors.black, style: BorderStyle.solid, width: 2),
      children: [
        TableRow(
          children: [
            Container(
              color: Color(0xffC3C3C3),
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'ลำดับ ',
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
                    '1 ',
                    style: TextStyle(
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
              color: Color(0xffC3C3C3),
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                    '25/12/2021 09:00',
                    style: TextStyle(
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
              color: Color(0xffC3C3C3),
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'เบอร์รถ',
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
                    '1291',
                    style: TextStyle(
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
              color: Color(0xffC3C3C3),
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                    '73-0494',
                    style: TextStyle(
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
              color: Color(0xffC3C3C3),
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                    '80',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xff428BCA)),
                    textAlign: TextAlign.center,
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
              color: Color(0xffC3C3C3),
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'ปั้มน้ำมันที่เติม',
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
                    'PTT',
                    style: TextStyle(
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

///new
Widget Tabel_Staff_detail() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 5.0),
    child: Table(
      border: TableBorder.all(
          color: Colors.black, style: BorderStyle.solid, width: 2),
      children: [
        TableRow(
          children: [
            Container(
              color: Color(0xffC3C3C3),
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
                    style: TextStyle(
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
              color: Color(0xffC3C3C3),
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
                    style: TextStyle(
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
              color: Color(0xffC3C3C3),
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
                    style: TextStyle(
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
              color: Color(0xffC3C3C3),
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
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xff428BCA)),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ],
        ),
        if (QrCode['oil_gen'] == 0) ...{
          TableRow(
            children: [
              Container(
                color: Color(0xffC3C3C3),
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
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff428BCA)),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ],
          ),
        } else ...{
          TableRow(
            children: [
              Container(
                color: Color(0xffC3C3C3),
                height: 40,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'เติมรถ (ลิตร)',
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
                      QrCode['oil_truck'].toString(),
                      style: TextStyle(
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
                color: Color(0xff428BCA),
                height: 40,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'เติมเครื่อง GEN (ลิตร)',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
              Container(
                color: Color(0xff428BCA),
                height: 40,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      QrCode['oil_gen'].toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
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
                color: Color(0xffC3C3C3),
                height: 40,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'รวมจำนวนลิตร',
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
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff428BCA)),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ],
          ),
        },
      ],
    ),
  );
}

Widget Tabel_Staff_detail_new() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 5.0),
    child: Table(
      border: TableBorder.all(
          color: Colors.black, style: BorderStyle.solid, width: 2),
      children: [
        TableRow(
          children: [
            Container(
              color: Color(0xffC3C3C3),
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'เลขที่คูปอง ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black87),
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
                    Oil_Details['code'].toString(),
                    style: TextStyle(
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
              color: Color(0xffC3C3C3),
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
                    Oil_Details['truck_license'].toString(),
                    style: TextStyle(
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
              color: Color(0xffC3C3C3),
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
                    Oil_Details['driver'].toString(),
                    style: TextStyle(
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
              color: Color(0xffC3C3C3),
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
                    Oil_Details['site_name'].toString() +
                        '/' +
                        Oil_Details['business_name'].toString(),
                    style: TextStyle(
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
              color: Color(0xffC3C3C3),
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'จำนวนลิตรที่เติมจริง',
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
                    Oil_Details['oil_truck'].toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xff428BCA)),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ],
        ),
        // TableRow(
        //   children: [
        //     Container(
        //       color: Color(0xffC3C3C3),
        //       child: Column(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: const [
        //           Padding(
        //             padding: EdgeInsets.all(8.0),
        //             child: TextField(
        //               enabled: false,
        //               decoration: InputDecoration(
        //                 border: InputBorder.none,
        //                 contentPadding:
        //                     const EdgeInsets.symmetric(vertical: 0.1),
        //                 hintText: "จำนวนลิตรที่เติมจริง",
        //                 hintStyle: TextStyle(color: Colors.black87),
        //               ),
        //               style: TextStyle(
        //                   fontWeight: FontWeight.bold,
        //                   color: Color(0xff428BCA)),
        //               textAlign: TextAlign.center,
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //     Container(
        //       child: Column(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [BtnConfrim()],
        //       ),
        //     ),
        //   ],
        // ),
        TableRow(
          children: [
            Container(
              color: Color(0xffC3C3C3),
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
                    Oil_Details['refueler_name'].toString(),
                    style: TextStyle(
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
              color: Color(0xffC3C3C3),
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
            Status_Oil_All()
          ],
        ),
        TableRow(
          children: [
            Container(
              color: Color(0xffC3C3C3),
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
                    Oil_Details['refuel_at'].toString(),
                    style: TextStyle(
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

var total_Refuel_alls;
var total_Refuel_Gen_alls;
var tottal_gens;
Widget Tabel_Staff_detail_new_GEN() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 5.0),
    child: Table(
      border: TableBorder.all(
          color: Colors.black, style: BorderStyle.solid, width: 2),
      children: [
        TableRow(
          children: [
            Container(
              color: Color(0xffC3C3C3),
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'เลขที่คูปอง ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black87),
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
                    Oil_Details['code'].toString(),
                    style: TextStyle(
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
              color: Color(0xffC3C3C3),
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
                    Oil_Details['truck_license'].toString(),
                    style: TextStyle(
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
              color: Color(0xffC3C3C3),
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
                    Oil_Details['driver'].toString(),
                    style: TextStyle(
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
              color: Color(0xffC3C3C3),
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
                    Oil_Details['site_name'].toString() +
                        '/' +
                        Oil_Details['business_name'].toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xff428BCA)),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ],
        ),
        // TableRow(
        //   children: [
        //     Container(
        //       color: Color(0xffC3C3C3),
        //       child: Column(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: const [
        //           Padding(
        //             padding: EdgeInsets.all(8.0),
        //             child: TextField(
        //               enabled: false,
        //               decoration: InputDecoration(
        //                 border: InputBorder.none,
        //                 contentPadding:
        //                     const EdgeInsets.symmetric(vertical: 0.1),
        //                 hintText: "เติมรถ (ลิตร)",
        //                 hintStyle: TextStyle(color: Colors.black87),
        //               ),
        //               style: TextStyle(
        //                   fontWeight: FontWeight.bold,
        //                   color: Color(0xff428BCA)),
        //               textAlign: TextAlign.center,
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //     Container(
        //       child: Column(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [BtnConfrim_GEN1()],
        //       ),
        //     ),
        //   ],
        // ),
        // TableRow(
        //   children: [
        //     Container(
        //       color: Color(0xffC3C3C3),
        //       child: Column(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: const [
        //           Padding(
        //             padding: EdgeInsets.all(8.0),
        //             child: TextField(
        //               enabled: false,
        //               decoration: InputDecoration(
        //                 border: InputBorder.none,
        //                 contentPadding:
        //                     const EdgeInsets.symmetric(vertical: 0.1),
        //                 hintText: "เติมเครื่อง GEN (ลิตร)",
        //                 hintStyle: TextStyle(color: Colors.black87),
        //               ),
        //               style: TextStyle(
        //                   fontWeight: FontWeight.bold,
        //                   color: Color(0xff428BCA)),
        //               textAlign: TextAlign.center,
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //     Container(
        //       child: Column(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [BtnConfrim_GEN2()],
        //       ),
        //     ),
        //   ],
        // ),
        TableRow(
          children: [
            Container(
              color: Color(0xffC3C3C3),
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'เติมรถ (ลิตร)',
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
                    Oil_Details['oil_truck'].toString(),
                    style: TextStyle(
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
              color: Color(0xffC3C3C3),
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'เติมเครื่อง GEN (ลิตร)',
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
                    Oil_Details['oil_gen'].toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xff428BCA)),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ],
        ),
        // TableRow(
        //   children: [
        //     Container(
        //       color: Color(0xffC3C3C3),
        //       child: Column(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: const [
        //           Padding(
        //             padding: EdgeInsets.all(8.0),
        //             child: TextField(
        //               enabled: false,
        //               decoration: InputDecoration(
        //                 border: InputBorder.none,
        //                 contentPadding:
        //                     const EdgeInsets.symmetric(vertical: 0.1),
        //                 hintText: "รวมจำนวนน้ำมันที่เติม",
        //                 hintStyle: TextStyle(color: Colors.black87),
        //               ),
        //               style: TextStyle(
        //                   fontWeight: FontWeight.bold,
        //                   color: Color(0xff428BCA)),
        //               textAlign: TextAlign.center,
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //     Container(
        //       child: Column(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [BtnConfrim_Oil_Add_Gen_SUM()],
        //       ),
        //     ),
        //   ],
        // ),
        TableRow(
          children: [
            Container(
              color: Color(0xffC3C3C3),
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'รวมจำนวนน้ำมันที่เติม',
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
                    Oil_Details['amount'].toString(),
                    style: TextStyle(
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
              color: Color(0xffC3C3C3),
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
                    Oil_Details['refueler_name'].toString(),
                    style: TextStyle(
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
              color: Color(0xffC3C3C3),
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
            Status_Oil_All()
          ],
        ),
        TableRow(
          children: [
            Container(
              color: Color(0xffC3C3C3),
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
                    Oil_Details['refuel_at'].toString(),
                    style: TextStyle(
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
