import 'package:cpac/controller/driver_employee.dart';
import 'package:cpac/controller/user_profile.dart';
import 'package:cpac/view/change_password.dart';
import 'package:cpac/view/driver/deiver_pin_code/driver_confirm_password_change_pin_code.dart';
import 'package:cpac/view/truck_driver/change_password_driver.dart';
import 'package:cpac/view/truck_driver/loading_driver.dart';
import 'package:cpac/view/truck_driver/login_truck_driver.dart';
import 'package:cpac/view/truck_driver/pin_code_driver/driver_truck_confirm_password_change_pin_code.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

var Logout;

class Driver_Profile extends StatefulWidget {
  Driver_Profile({Key? key}) : super(key: key);

  @override
  State<Driver_Profile> createState() => _Driver_ProfileState();
}

class _Driver_ProfileState extends State<Driver_Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 10,
          ),
          Container(
            width: double.infinity,
            height: 60,
            alignment: Alignment.center,
            color: const Color(0xff438EB9),
            child: const Text(
              'ข้อมูลส่วนตัว',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          Container(
            height: 5,
          ),
          Card(
            child: ListTile(
              leading: Text(
                'ชื่อ:',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              title: Text(
                Driver_ProfileUser['fullname'],
                style: TextStyle(
                  color: Color(0xff438EB9),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: Text(
                'ชื่อผู้ใช้งาน:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              title: Text(
                Driver_ProfileUser['username'],
                style: TextStyle(
                  color: Color(0xff438EB9),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          // Card(
          //   child: ListTile(
          //     leading: Text(
          //       'เบอร์โทร์ศัพท์:',
          //       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          //     ),
          //     title: Text(
          //       Driver_ProfileUser['telephone'].toString(),
          //       style: TextStyle(
          //         color: Color(0xff438EB9),
          //         fontWeight: FontWeight.bold,
          //       ),
          //     ),
          //   ),
          // ),
          Card(
            child: ListTile(
              leading: Text(
                'หน่วยงาน:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              title: Text(
                Driver_ProfileUser['site_name'],
                style: TextStyle(
                  color: Color(0xff438EB9),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: Text(
                'กิจการ:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              title: Text(
                Driver_ProfileUser['business_name'],
                style: TextStyle(
                  color: Color(0xff438EB9),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            height: 20,
          ),
          Text(
            'เวอร์ชั่นปัจจุบัน : $ver',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          Container(
            height: 20,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue[900],
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Change_Password_Driver()),
                    );
                    print('เปลี่ยนรหัสผ่าน');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'เปลี่ยนรหัสผ่าน ',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Icon(
                        Icons.lock,
                        size: 25,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue[900],
                    // fromHeight use double.infinity as width and 40 is the height
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              DriverTruck_ConfirmPassword_ChangePinCode()),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'เปลี่ยนรหัสผ่าน PIN',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 20,
          ),
          Btn_Logout(context)
        ],
      ),
    )

        // This trailing comma makes auto-formatting nicer f

        );
  }
}
