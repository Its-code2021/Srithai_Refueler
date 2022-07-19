// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:cpac/controller/driver_employee.dart';
import 'package:flutter/material.dart';

Widget Tabel_Trck_GenQrCode() {
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
                    Driver_CouponDetail['code'].toString(),
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
                    'ทะเบียนรถ ',
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
                    Driver_CouponDetail['truck_license'].toString(),
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
                    'ชื่อพนักงานขับรถ ',
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
                    Driver_CouponDetail['driver'],
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
                    'หน่วยงาน/กิจการ ',
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
                    Driver_CouponDetail['site_name'].toString() +
                        '/' +
                        Driver_CouponDetail['business_name'].toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xff428BCA)),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ],
        ),
        if (Driver_CouponDetail['oil_gen'] != 0) ...{
          TableRow(
            children: [
              Container(
                color: Color(0xffC3C3C3),
                height: 40,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'จำนวนน้ำมันเติมรถ ',
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
                      Driver_CouponDetail['oil_truck'].toString(),
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
                color: Color(0xffC3C3C3),
                height: 40,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'จำนวนน้ำมันเติมเครื่องเจน ',
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
                      Driver_CouponDetail['oil_gen'].toString(),
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
        } else
          ...{},
        TableRow(
          children: [
            Container(
              color: Color(0xffC3C3C3),
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'จำนวนลิตร ',
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
                    Driver_CouponDetail['amount'].toString(),
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
