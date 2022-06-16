// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:cpac/controller/driver_employee.dart';
import 'package:cpac/controller/gas_qr_code.dart';
import 'package:cpac/controller/qr_code.dart';
import 'package:cpac/view/truck_driver/login_truck_driver.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Status_Oil_All extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (Oil_Details['status'] == "1") ...[
            const Text('ยังไม่ได้เติมน้ำมัน',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
          ] else if (Oil_Details['status'] == "2") ...[
            const Text('เติมแล้ว',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.green)),
          ],
        ],
      ),
    );
  }
}

class Status_Gas_All extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (Gas_Details['status'] == "1") ...[
            const Text('ยังไม่ได้เติมน้ำมัน',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
          ] else if (Gas_Details['status'] == "2") ...[
            const Text('เติมแล้ว',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.green)),
          ],
        ],
      ),
    );
  }
}

class Status_Gas_History extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (History_Detail['status'] == "1") ...[
            const Text('ยังไม่ได้เติมน้ำมัน',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
          ] else if (History_Detail['status'] == "2") ...[
            const Text('เติมแล้ว',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.green)),
          ],
        ],
      ),
    );
  }
}

Future<void> _refresh(BuildContext context) async {
  Driver_CouponList;
  GetapiDriverDouponList(context, result_token);
  return Future.delayed(Duration(seconds: 2));
}

Widget Table_list_Null(BuildContext context) {
  @override
  void initState() {
    _refresh(context);
  }

  return Container(
    alignment: Alignment.center,
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.width,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'ยังไม่มีรายการคูปอง !!!',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          height: 10,
        ),
        // Container(
        //   child: IconButton(
        //     onPressed: () {
        //       GetapiDriverUser(context, result_token, device_model);
        //     },
        //     icon: Icon(
        //       Icons.refresh,
        //       color: Colors.blue,
        //       size: 45,
        //     ),
        //   ),
        // ),
      ],
    ),
  );
}
