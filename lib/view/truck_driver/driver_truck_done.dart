import 'package:cpac/view/truck_driver/tabbar_driver_truck.dart';
import 'package:flutter/material.dart';

class Driver_Truck_Done extends StatefulWidget {
  Driver_Truck_Done({Key? key}) : super(key: key);

  @override
  State<Driver_Truck_Done> createState() => _Driver_Truck_DoneState();
}

class _Driver_Truck_DoneState extends State<Driver_Truck_Done> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('images/002.png', fit: BoxFit.cover),
        centerTitle: true,
        backgroundColor: Color(0xff438EB9),
      ),
      body: Column(
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
              'รายการคูปองน้ำมัน',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          Container(
            height: 60,
          ),
          Center(
            child: Icon(
              Icons.check_circle_outline,
              size: 150.0,
              color: Colors.green,
            ),
          ),
          Container(
            height: 60,
          ),
          Container(
            width: 200,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue[900],
                    minimumSize: Size.fromHeight(
                      50,
                    ), //
                  ),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Tabbar_Driver(),
                        ),
                        (route) => false);
                    print('กลับหน้าหลัก');
                  },
                  child: Text('กลับหน้าหลัก')),
            ),
          )
        ],
      ),
    );
  }
}
