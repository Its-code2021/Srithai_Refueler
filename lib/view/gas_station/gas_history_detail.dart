import 'package:cpac/view/gas_station/gas_tabel_all.dart';
import 'package:flutter/material.dart';

class History_Detail_Gas extends StatefulWidget {
  History_Detail_Gas({Key? key}) : super(key: key);

  @override
  State<History_Detail_Gas> createState() => _History_Detail_GasState();
}

class _History_Detail_GasState extends State<History_Detail_Gas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Image.asset('images/002.png', fit: BoxFit.cover)),
        backgroundColor: const Color(0xff438EB9),
      ),
      resizeToAvoidBottomInset: true,
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
                'รายละเอียดประวัติการเติมน้ำมัน',
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
            Tabel_History_detail_Gas(),
          ],
        ),
      ),
    );
  }
}
