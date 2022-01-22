import 'package:cpac/controller/user_profile.dart';
import 'package:cpac/server/api.dart';
import 'package:cpac/utility/my_alert.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'driver/staff_refueling.dart';
import 'gas_station/tabbar_Gas.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isChecked = false;
  bool showPassword = true;
  String token = "";
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

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
            child: new Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
                Container(
                    margin: EdgeInsets.only(left: 5),
                    child: Text('โปรดรอสักครู่....')),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<Null> login() async {
    String url = apiLogin;
    try {
      Dio dio = new Dio();
      Response response = await dio.post(url, data: {
        "username": _usernameController.text,
        "password": _passwordController.text,
      });
      print(response);
      if (response.data['status_code'][0]['code'] == "200") {
        var result = response.data['results'];
        String username = _usernameController.text.toString();
        String password = _passwordController.text.toString();

        print(result[0]);
        if (result[0] != '') {
          token = result[0];
          print(token);
          String url = apiUser;
          final response = await dio.get(url,
              options: Options(headers: {'Authorization': 'Token $token'}));
          var results = response.data['results'][0];
          Profile = results;
          if (Profile['user_level'] == "D") {
            GetapiHeader(token); //pop dialog
            GetToken(token);
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => Staff_Refueling()),
                (Route<dynamic> route) => false);
          } else if (Profile['user_level'] == "P") {
            GetapiHeader(token);
            GetToken(token);
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => TabBar_Menu_Gas()),
                (Route<dynamic> route) => false);
          }
        }
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
    return OutlineInputBorder(
        //Outline border type for TextFeild
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(
          color: Colors.grey,
          width: 3,
        ));
  }

  OutlineInputBorder myfocusborder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(
          color: Colors.grey,
          width: 3,
        ));
  }

  @override
  Widget build(BuildContext context) {
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
                    Image.asset(
                      'images/001.png',
                    ),
                    Container(height: 60),
                    Container(
                      child: SizedBox(
                        width: double.infinity,
                        child: Text(
                          'ชื่อผู้ใช้งาน',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(height: 10),
                    TextField(
                        controller: _usernameController,
                        decoration: InputDecoration(
                          labelStyle: TextStyle(
                            fontSize: 20,
                          ),
                          isDense: true,
                          border: myinputborder(),
                          enabledBorder: myinputborder(),
                          focusedBorder: myfocusborder(),
                        )),
                    Container(height: 10),
                    Container(
                      child: SizedBox(
                        width: double.infinity,
                        child: Text(
                          'รหัสผ่าน',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(height: 10),
                    TextField(
                      maxLength: 16,
                      controller: _passwordController,
                      obscureText: showPassword,
                      decoration: InputDecoration(
                          counterText: "",
                          labelStyle: TextStyle(
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
                        minimumSize: Size.fromHeight(
                          50,
                        ), //
                      ),
                      onPressed: () {
                        if ((_usernameController.text != "" &&
                            _passwordController.text != "")) {
                          _onLoading();
                          login();
                        } else {
                          myAlert_2(
                              context, 'ชื่อผู้ใช้งานหรือรหัสผ่านไม่ถูกต้อง');
                        }
                        print("username = " +
                            _usernameController.text +
                            " password = " +
                            _passwordController.text);
                      },
                      child: Text('เข้าสู่ระบบ'),
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
            BoxShadow(
              color: Colors.white,
              blurRadius: 5.0,
            ),
          ],
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Color(0xffECEBEB))),
      child: TextField(
          controller: controller,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(top: 8, left: 20),
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            border: InputBorder.none,
            suffixIcon: icon,
            labelText: label,
            labelStyle:
                TextStyle(fontSize: 14, decoration: TextDecoration.none),
          )),
    );
  }

  void _handleRemeberme(value) {
    print("Handle Rember Me");
    _isChecked = value;
    SharedPreferences.getInstance().then(
      (prefs) {
        prefs.setBool("remember_me", value);
        prefs.setString('username', _usernameController.text);
        prefs.setString('password', _passwordController.text);
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
        _usernameController.text = _username;
        _passwordController.text = _password;
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
        title: Text("Logout"),
        actions: [
          GestureDetector(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                    (route) => false);
              },
              child: Icon(Icons.logout))
        ],
      ),
    );
  }
}
