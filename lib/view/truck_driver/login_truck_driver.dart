import 'package:cpac/controller/driver_employee.dart';
import 'package:cpac/controller/user_profile.dart';
import 'package:cpac/server/api.dart';
import 'package:cpac/utility/my_alert.dart';
import 'package:cpac/view/truck_driver/driver_profile.dart';
import 'package:cpac/view/truck_driver/home_driver.dart';
import 'package:cpac/view/truck_driver/loading_driver.dart';
import 'package:cpac/view/truck_driver/tabbar_driver_truck.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login_Truck_Driver extends StatefulWidget {
  @override
  _Login_Truck_DriverState createState() => _Login_Truck_DriverState();
}

var result_token;

class _Login_Truck_DriverState extends State<Login_Truck_Driver> {
  bool _isChecked = false;
  bool showPassword = true;
  String token = "";
  TextEditingController _usernameControllers = TextEditingController();
  TextEditingController _passwordControllers = TextEditingController();

  @override
  void initState() {
    _loadUserEmailPassword();
    super.initState();
  }

  void _onLoading() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            // ignore: unnecessary_new
            child: new Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircularProgressIndicator(),
                Container(
                    margin: const EdgeInsets.only(left: 5),
                    child: const Text('โปรดรอสักครู่....')),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<Null> login() async {
    String url = apiLoginDriver;
    try {
      Dio dio = new Dio();
      Response response = await dio.post(url, data: {
        "username": _usernameControllers.text,
        "password": _passwordControllers.text,
      });

      if (response.data['status_code'][0]['code'] == "200") {
        var result = response.data['results'][0];
        result_token = result;
        String username = _usernameControllers.text.toString();
        String password = _passwordControllers.text.toString();
        GetapiDriverUser(context, result_token);
        GetapiDriverDouponList(context, result_token);
      } else {
        Navigator.pop(context);
        myAlert_2(context, "รหัสผ่านหรือชื่อผู้ใช้งานไม่ถูกต้อง");
      }
    } catch (e) {
      print(e);
      print('รหัสไม่ถูก');
      Navigator.pop(context);
      myAlert_2(context, "รหัสผ่านไม่ถูกต้อง!!");
    }
  }

  OutlineInputBorder myinputborder() {
    //return type is OutlineInputBorder
    return const OutlineInputBorder(
        //Outline border type for TextFeild
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(
          color: Colors.grey,
          width: 3,
        ));
  }

  OutlineInputBorder myfocusborder() {
    return const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(
          color: Colors.grey,
          width: 3,
        ));
  }

  @override
  Widget build(BuildContext context) {
    // if (Logout != 1) {
    //   if (_usernameControllers.text != ' ' && _passwordControllers.text != '') {
    //     setState(() {
    //       login();
    //     });
    //   } else {}
    // } else {}

    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.blue;
    }

    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(height: 60),
                    Image.asset(
                      'images/001.png',
                    ),
                    Container(height: 30),
                    const Text(
                      'เข้าสู่ระบบ สำหรับพนักงานขับรถเท่านั้น',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(height: 30),
                    Container(
                      child: const SizedBox(
                        width: double.infinity,
                        child: Text(
                          'ชื่อผู้ใช้งาน',
                          textAlign: TextAlign.left,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(height: 10),
                    TextField(
                        controller: _usernameControllers,
                        onChanged: (value) => updateButtonState(value),
                        decoration: InputDecoration(
                          labelStyle: const TextStyle(
                            fontSize: 20,
                          ),
                          isDense: true,
                          border: myinputborder(),
                          enabledBorder: myinputborder(),
                          focusedBorder: myfocusborder(),
                        )),
                    Container(height: 10),
                    Container(
                      child: const SizedBox(
                        width: double.infinity,
                        child: Text(
                          'รหัสผ่าน',
                          textAlign: TextAlign.left,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(height: 10),
                    TextField(
                      maxLength: 16,
                      controller: _passwordControllers,
                      onChanged: (value) => updateButtonState(value),
                      obscureText: showPassword,
                      decoration: InputDecoration(
                          counterText: "",
                          labelStyle: const TextStyle(
                            fontSize: 20,
                          ),
                          isDense: true,
                          enabledBorder: myinputborder(),
                          focusedBorder: myfocusborder(),
                          suffixIcon: IconButton(
                              icon: Icon(showPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                setState(() =>
                                    {this.showPassword = !this.showPassword});
                              })),
                    ),
                    Container(height: 20),
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      SizedBox(
                          height: 24.0,
                          width: 24.0,
                          child: Theme(
                            data: ThemeData(
                                unselectedWidgetColor: Colors.grey // Your color
                                ),
                            child: Checkbox(
                                activeColor: Colors.blue[900],
                                value: _isChecked,
                                onChanged: _handleRemeberme),
                          )),
                      const Text(
                        "จำรหัสผ่าน",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      )
                    ]),
                    Container(height: 30),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue[900],
                        minimumSize: const Size.fromHeight(
                          50,
                        ), //
                      ),
                      onPressed: () {
                        if ((_usernameControllers.text != "" &&
                            _passwordControllers.text != "")) {
                          _onLoading();
                          login();
                        } else {
                          myAlert_2(
                              context, 'ชื่อผู้ใช้งานหรือรหัสผ่านไม่ถูกต้อง');
                        }
                        print("username = " +
                            _usernameControllers.text +
                            " password = " +
                            _passwordControllers.text);
                      },
                      child: const Text('เข้าสู่ระบบ'),
                    ),
                  ]),
            ),
          ),
        ));
  }

  field(TextEditingController controller, Icon icon, String label) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [
            const BoxShadow(
              color: Colors.white,
              blurRadius: 5.0,
            ),
          ],
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: const Color(0xffECEBEB))),
      child: TextField(
          controller: controller,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(top: 8, left: 20),
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            border: InputBorder.none,
            suffixIcon: icon,
            labelText: label,
            labelStyle:
                const TextStyle(fontSize: 14, decoration: TextDecoration.none),
          )),
    );
  }

  void updateButtonState(String text) {
    if ((text == null || text.length == 0) && _isChecked) {
      setState(() {
        _isChecked = false;
      });
    } else if (text == text) {
      setState(() {
        _isChecked = false;
      });
    }
  }

  void _handleRemeberme(value) {
    print("Rember Me");
    _isChecked = value;
    SharedPreferences.getInstance().then(
      (prefs) {
        prefs.setBool("remember_me", value);
        prefs.setString('username', _usernameControllers.text);
        prefs.setString('password', _passwordControllers.text);
      },
    );
    setState(() {
      _isChecked = value;
    });
  }

  void _loadUserEmailPassword() async {
    print("Load Email");
    try {
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      var _username = _prefs.getString("username") ?? "";
      var _password = _prefs.getString("password") ?? "";
      var _remeberMe = _prefs.getBool("remember_me") ?? false;

      print(_remeberMe);
      print(_username);
      print(_password);
      if (_remeberMe) {
        setState(() {
          _isChecked = true;
        });
        _usernameControllers.text = _username;
        _passwordControllers.text = _password;
      }
    } catch (e) {
      print(e);
    }
  }
}

class LogoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Logout"),
        actions: [
          GestureDetector(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Login_Truck_Driver()),
                    (route) => false);
              },
              child: const Icon(Icons.logout))
        ],
      ),
    );
  }
}
