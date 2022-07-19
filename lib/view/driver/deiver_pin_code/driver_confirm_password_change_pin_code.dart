import 'package:cpac/controller/pin_code.dart';
import 'package:cpac/controller/user_profile.dart';
import 'package:cpac/utility/my_alert.dart';
import 'package:cpac/view/driver/loading_page.dart';
import 'package:cpac/view/gas_station/pin_code/gas_create_pin_code.dart';
import 'package:flutter/material.dart';

class Driver_ConfirmPassword_ChangePinCode extends StatefulWidget {
  Driver_ConfirmPassword_ChangePinCode({Key? key}) : super(key: key);

  @override
  State<Driver_ConfirmPassword_ChangePinCode> createState() =>
      _Driver_ConfirmPassword_ChangePinCodeState();
}

TextEditingController passwordController = TextEditingController();

class _Driver_ConfirmPassword_ChangePinCodeState
    extends State<Driver_ConfirmPassword_ChangePinCode> {
  bool showPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff438EB9),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => Loading_page_Home()),
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
                    Profile['username'].toString(),
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
                autofocus: true,
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
                      PostDriver_Check_Password_Pin(context, password);
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
