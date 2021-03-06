import 'package:cpac/view/driver/qr_code.dart';
import 'package:flutter/material.dart';

class Staff_Refueling extends StatefulWidget {
  Staff_Refueling({Key? key}) : super(key: key);

  @override
  _Staff_RefuelingState createState() => _Staff_RefuelingState();
}

class _Staff_RefuelingState extends State<Staff_Refueling> {
  Widget Qr_code_Staff() {
    return Container(
      width: double.infinity,
      height: 50,
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.blue[900],
            minimumSize: Size.fromHeight(
              50,
            ), // fromHeight use double.infinity as width and 40 is the height
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Qr_code()),
            );
            print('สแกนคูปองเติมน้ำมัน');
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'สแกนคูปองเติมน้ำมัน ',
                style: TextStyle(fontSize: 20),
              ),
              Icon(
                Icons.qr_code_scanner_outlined,
                size: 30,
              )
            ],
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'images/logo.png',
              fit: BoxFit.cover,
              scale: 18.0,
            ),
          ),
          Container(
            height: 50,
          ),
          Qr_code_Staff()
        ],
      ),
    );
  }
}
