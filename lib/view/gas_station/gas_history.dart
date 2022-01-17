import 'package:cpac/view/gas_station/gas_tabel_all.dart';
import 'package:flutter/material.dart';

class Gas_History extends StatefulWidget {
  Gas_History({Key? key}) : super(key: key);

  @override
  _Gas_HistoryState createState() => _Gas_HistoryState();
}

class _Gas_HistoryState extends State<Gas_History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 10,
            ),
            Container(
              width: double.infinity,
              height: 60,
              alignment: Alignment.center,
              color: Color(0xff438EB9),
              // ignore: prefer_const_constructors
              child: Text(
                'ประวัติการเติมน้ำมัน',
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
            TabelGas_Header_History(),
            TabelGas_Header_History_Body(context)
          ],
        ),
      ),
    );
  }
}
