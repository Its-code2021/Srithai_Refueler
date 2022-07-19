import 'package:cpac/controller/driver_employee.dart';
import 'package:cpac/controller/pin_code.dart';
import 'package:cpac/controller/user_profile.dart';
import 'package:cpac/utility/my_alert.dart';

import 'package:cpac/view/truck_driver/loading_driver.dart';
import 'package:cpac/view/truck_driver/login_truck_driver.dart';
import 'package:flutter/material.dart';

class DriverTruck_ConfirmPassword_ChangePinCode extends StatefulWidget {
  DriverTruck_ConfirmPassword_ChangePinCode({Key? key}) : super(key: key);

  @override
  State<DriverTruck_ConfirmPassword_ChangePinCode> createState() =>
      _DriverTruck_ConfirmPassword_ChangePinCodeState();
}

TextEditingController passwordController = TextEditingController();

class _DriverTruck_ConfirmPassword_ChangePinCodeState
    extends State<DriverTruck_ConfirmPassword_ChangePinCode> {
  bool showPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff438EB9),
        leading: IconButton(
            onPressed: () {
              GetapiDriver_Coupon_List(result_token);
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => Loading_Driver()),
                  (Route<dynamic> route) => false);
            },
            icon: Icon(Icons.arrow_back)),
        title: Container(
          width: double.infinity,
          alignment: Alignment.center,
          child: Text(
            'เปลี่ยนรหัส PIN CODE',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(height: 20),
              Image.asset(
                'images/logo.png',
                fit: BoxFit.cover,
                scale: 25,
              ),
              Container(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'ชื่อผู้ใช้งาน: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    Driver_ProfileUser['username'].toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.blue[900]),
                  )
                ],
              ),
              Container(height: 10),
              Row(
                children: const [
                  Text(
                    'รหัสผ่าน',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              Container(height: 10),
              TextField(
                maxLength: 16,
                controller: passwordController,
                obscureText: showPassword,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    counterText: "",
                    labelStyle: const TextStyle(
                      fontSize: 20,
                    ),
                    isDense: true,
                    suffixIcon: IconButton(
                        icon: Icon(showPassword
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(
                              () => {this.showPassword = !this.showPassword});
                        })),
              ),
              Container(height: 10),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue[900],
                    minimumSize: const Size.fromHeight(
                      50,
                    ), //
                  ),
                  onPressed: () {
                    String password = passwordController.text.toString();
                    if (password != null && password != '') {
                      PostDriver__Check_Password_Pin(context, password);
                      passwordController.clear();
                    } else {
                      AlertPassword_Confrim_Chang_PinCode(context);
                    }

                    print(password);
                  },
                  child: Text('ยืนยัน'))
            ],
          ),
        ),
      ),
    );
  }
}
