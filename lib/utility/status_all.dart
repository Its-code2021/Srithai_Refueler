import 'package:cpac/controller/qr_code.dart';
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
