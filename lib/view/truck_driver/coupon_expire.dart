import 'package:cpac/controller/driver_employee.dart';
import 'package:cpac/utility/my_alert.dart';
import 'package:flutter/material.dart';

class Coupon_Expire extends StatefulWidget {
  Coupon_Expire({Key? key}) : super(key: key);

  @override
  State<Coupon_Expire> createState() => _Coupon_ExpireState();
}

class _Coupon_ExpireState extends State<Coupon_Expire> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff438EB9),
          centerTitle: true,
          title: Image.asset(
            'images/002.png',
            fit: BoxFit.cover,
            width: 250,
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
                  'รายการคูปองหมดอายุ!',
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
              Container(
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: Driver_Coupon_Expire.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  side: BorderSide(
                                      width: 2.0, color: Colors.grey),
                                ),
                                onPressed: () {
                                  Alert_Coupon_Expire(context);
                                },
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  const Text(
                                                    "เลขที่คูปอง: ",
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black),
                                                  ),
                                                  Text(
                                                    Driver_Coupon_Expire[index]
                                                            ['code']
                                                        .toString(),
                                                    style: const TextStyle(
                                                        color: const Color(
                                                            0xff1F47CB),
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                              if (Driver_Coupon_Expire[index]
                                                      ['is_refuel'] ==
                                                  0) ...[
                                                const Text(
                                                  'ปั้มบริษัท(เติมอู่)',
                                                  style: TextStyle(
                                                      color: Color(0xff1F47CB),
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ] else if (Driver_Coupon_Expire[
                                                      index]['is_refuel'] ==
                                                  1) ...[
                                                const Text(
                                                  'เติมปั๊มนอก',
                                                  style: TextStyle(
                                                      color: Color(0xff1F47CB),
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ]
                                            ],
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  const Text(
                                                    "จำนวนน้ำมัน: ",
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black),
                                                  ),
                                                  Text(
                                                    Driver_Coupon_Expire[index]
                                                            ['amount']
                                                        .toString(),
                                                    style: const TextStyle(
                                                        color:
                                                            Color(0xff1F47CB),
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  const Text(
                                                    " ลิตร ",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(),
                                                    onPressed: null,
                                                    child: Row(
                                                      children: const [
                                                        Text(
                                                          'หมดอายุ',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        Icon(Icons
                                                            .local_gas_station_sharp)
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
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ],
          ),
        ));
  }
}
