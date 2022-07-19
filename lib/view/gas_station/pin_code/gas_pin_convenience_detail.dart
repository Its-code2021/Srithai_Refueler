import 'package:cpac/controller/gas_qr_code.dart';
import 'package:cpac/controller/user_profile.dart';
import 'package:cpac/utility/date_time.dart';
import 'package:cpac/view/login_pump_gas.dart';
import 'package:flutter/material.dart';

import 'gas_create_pin_code.dart';

class Gas_Pin_ConvenienceDetail extends StatelessWidget {
  const Gas_Pin_ConvenienceDetail({Key? key}) : super(key: key);

  @override
  void initState() {
    PostPumpHistoryRefue(startdate, enddate);
    GetapiHeader(token);
    GetToken(token);
    GetPump_Paymant_List();
    GetPump_Paymant_List_History();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Image.asset('images/002.png', fit: BoxFit.cover),
        centerTitle: true,
        backgroundColor: const Color(0xff438EB9),
      ),
      body: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: double.infinity,
                    child:
                        Image.asset('images/PIN_Code.png', fit: BoxFit.cover)),
                Container(
                  height: 50,
                ),
                Center(
                  child: const Text(
                    'เพื่อความสะดวกในการใช้งานแอปพลิเคชัน',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  height: 10,
                ),
                Center(
                  child: const Text(
                    'กรุณาตั้งรหัส PIN',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  height: 20,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue[900],
                      minimumSize: Size.fromHeight(
                        50,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => Gas_Create_Pin_Code()),
                          (Route<dynamic> route) => false);
                    },
                    child: Text(
                      'ตกลง',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
