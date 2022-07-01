// ignore_for_file: unnecessary_const

import 'dart:async';
import 'dart:io';

import 'package:cpac/controller/driver_employee.dart';
import 'package:cpac/utility/status_all.dart';
import 'package:cpac/view/truck_driver/generate%20_qrcode.dart';
import 'package:cpac/view/truck_driver/loading_driver.dart';
import 'package:cpac/view/truck_driver/login_truck_driver.dart';
import 'package:flutter/material.dart';
import 'package:store_redirect/store_redirect.dart';
import 'package:version_check/version_check.dart';

class Home_Coupon_Driver extends StatefulWidget {
  Home_Coupon_Driver({Key? key}) : super(key: key);

  @override
  State<Home_Coupon_Driver> createState() => _Home_Coupon_DriverState();
}

class _Home_Coupon_DriverState extends State<Home_Coupon_Driver> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: ScrollPhysics(),
      child: Column(
        children: <Widget>[
          Container(
            height: 10,
          ),
          Container(
            width: double.infinity,
            height: 50,
            alignment: Alignment.center,
            color: const Color(0xff438EB9),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    'รายการคูปองน้ำมัน',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  IconButton(
                      onPressed: () {
                        GetapiDriverUser(context, result_token, device_model);
                      },
                      icon: Icon(
                        Icons.refresh,
                        color: Colors.white,
                        size: 28,
                      )),
                ],
              ),
            ),
          ),
          Container(
            height: 10,
          ),
          if (status_code == "200") ...{
            Table_list(),
          } else ...{
            Table_list_Null(context),
          }
        ],
      ),
    );
  }

  Future<void> onRefresh() async {
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      GetapiDriverDouponListReload(context, result_token);
    });
  }

  var Coupon_id;
  Widget Table_list() {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: Driver_CouponList.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 3.0,
                  color: Color(0xffCECECE),
                ),
                borderRadius: BorderRadius.all(
                    Radius.circular(5.0) //         <--- border radius here
                    ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text(
                              "เลขที่คูปอง: ",
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              Driver_CouponList[index]['code'].toString(),
                              style: const TextStyle(
                                  color: const Color(0xff1F47CB),
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        if (Driver_CouponList[index]['is_refuel'] == 0) ...[
                          const Text(
                            'ปั้มบริษัท(เติมอู่)',
                            style: TextStyle(
                                color: Color(0xff1F47CB),
                                fontWeight: FontWeight.bold),
                          ),
                        ] else if (Driver_CouponList[index]['is_refuel'] ==
                            1) ...[
                          const Text(
                            'เติมปั๊มนอก',
                            style: TextStyle(
                                color: Color(0xff1F47CB),
                                fontWeight: FontWeight.bold),
                          ),
                        ]
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text(
                              "จำนวนน้ำมัน: ",
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              Driver_CouponList[index]['amount'].toString(),
                              style: const TextStyle(
                                  color: Color(0xff1F47CB),
                                  fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              " ลิตร ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xff1F47CB),
                              ),
                              onPressed: () {
                                Coupon_id = Driver_CouponList[index]['id'];
                                GetHistory_Detail_Gas(context, Coupon_id);
                                print(Coupon_id);
                              },
                              child: Row(
                                children: const [
                                  Text('เติมน้ำมัน'),
                                  Icon(Icons.local_gas_station_sharp)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
