// ignore_for_file: unnecessary_const

import 'dart:async';
import 'dart:io';

import 'package:cpac/controller/driver_employee.dart';
import 'package:cpac/utility/status_all.dart';
import 'package:cpac/view/truck_driver/coupon_expire.dart';
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
  void initState() {
    super.initState();
    GetapiDriver_Coupon_Expire(result_token);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
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
                          GetapiDriver_Coupon_Expire(result_token);
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
              height: 5,
            ),
            if (Driver_Coupon_Count_List[0] != null) ...{
              if (Driver_Coupon_Count[0]['count'] > 1) ...{
                Tabel_Coupon_List(),
              } else
                ...{},
              Table_list(),
            } else ...{
              Table_list_Null(context),
            },
            Btn_Expired(context)
          ],
        ),
      ),
      // floatingActionButton: Container(
      //     padding: EdgeInsets.all(5.0),
      //     width: MediaQuery.of(context).size.width,
      //     child: Btn_Expired(context)),
    );
  }

  Widget Btn_Expired(BuildContext context) {
    if (Driver_Coupon_Expire != null && Driver_Coupon_Expire != "") {
      return FloatingActionButton.extended(
        foregroundColor: Colors.white,
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(3)),
        ),
        backgroundColor: Colors.blue[900],
        icon: const Icon(Icons.assignment_late_outlined),
        label: const Text(
          'รายการคูปองหมดอายุ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Coupon_Expire()),
          );
          print('รายการคูปองหมดอายุ');
        },
      );
    } else {
      return Container();
    }
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
        physics: NeverScrollableScrollPhysics(),
        itemCount: Driver_Coupon_Count_List.length,
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
                              Driver_Coupon_Count_List[index]['code']
                                  .toString(),
                              style: const TextStyle(
                                  color: const Color(0xff1F47CB),
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        if (Driver_Coupon_Count_List[index]['is_refuel'] ==
                            0) ...[
                          const Text(
                            'ปั้มบริษัท(เติมอู่)',
                            style: TextStyle(
                                color: Color(0xff1F47CB),
                                fontWeight: FontWeight.bold),
                          ),
                        ] else if (Driver_Coupon_Count_List[index]
                                ['is_refuel'] ==
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
                              Driver_Coupon_Count_List[index]['amount']
                                  .toString(),
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
                                Coupon_id =
                                    Driver_Coupon_Count_List[index]['id'];
                                GetCoupon_Detail_Driver(context, Coupon_id);
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

Widget Tabel_Coupon_List() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
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
                    'จำนวนคูปองทั้งหมด ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black87),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            Container(
              height: 40,
              color: Color(0xffC3C3C3),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'รวมจำนวนน้ำมัน(ลิตร)',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black87),
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
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${Driver_Coupon_Count[0]['count']}',
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
                    '${Driver_Coupon_Count[1]['amount']}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black87),
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
