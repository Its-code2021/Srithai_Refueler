import 'package:cpac/controller/driver_employee.dart';
import 'package:cpac/server/api.dart';
import 'package:cpac/utility/my_alert.dart';
import 'package:cpac/view/truck_driver/loading_driver.dart';
import 'package:cpac/view/truck_driver/login_truck_driver.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Frist_UserTruck_Login extends StatefulWidget {
  Frist_UserTruck_Login({Key? key}) : super(key: key);

  @override
  State<Frist_UserTruck_Login> createState() => _Frist_UserTruck_LoginState();
}

class _Frist_UserTruck_LoginState extends State<Frist_UserTruck_Login> {
  @override
  bool old_showPassword = true;
  bool new_showPassword = true;
  bool con_showPassword = true;
  TextEditingController _oldpasswordController = TextEditingController();
  TextEditingController _newpasswordController = TextEditingController();
  TextEditingController _con_newpasswordController = TextEditingController();
  var frist_login;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:
              Center(child: Image.asset('images/002.png', fit: BoxFit.cover)),
          backgroundColor: const Color(0xff438EB9),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(height: 10),
                    Text(
                      'กรุณาเปลี่ยนรหัสผ่านเมื่อเข้าสู่ระบบครั้งแรกเพื่อความปลอดภัยของคุณ',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Container(height: 10),
                    Container(
                      child: SizedBox(
                        width: double.infinity,
                        child: Text(
                          'รหัสผ่านใหม่',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(height: 10),
                    TextField(
                      maxLength: 16,
                      controller: _newpasswordController,
                      obscureText: new_showPassword,
                      decoration: InputDecoration(
                          counterText: "",
                          labelStyle: TextStyle(
                            fontSize: 20,
                          ),
                          isDense: true,
                          enabledBorder: myinputborder(),
                          focusedBorder: myfocusborder(),
                          suffixIcon: IconButton(
                              icon: Icon(new_showPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                setState(() => {
                                      this.new_showPassword =
                                          !this.new_showPassword
                                    });
                              })),
                    ),
                    Container(height: 20),
                    Container(
                      child: SizedBox(
                        width: double.infinity,
                        child: Text(
                          'ยืนยันรหัสผ่านใหม่',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(height: 10),
                    TextField(
                      maxLength: 16,
                      controller: _con_newpasswordController,
                      obscureText: con_showPassword,
                      decoration: InputDecoration(
                          counterText: "",
                          labelStyle: TextStyle(
                            fontSize: 20,
                          ),
                          isDense: true,
                          enabledBorder: myinputborder(),
                          focusedBorder: myfocusborder(),
                          suffixIcon: IconButton(
                              icon: Icon(con_showPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                setState(() => {
                                      this.con_showPassword =
                                          !this.con_showPassword
                                    });
                              })),
                    ),
                    Container(height: 30),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue[900],
                        minimumSize: Size.fromHeight(
                          50,
                        ), //
                      ),
                      onPressed: () {
                        username_chang_driver.toString();
                        _oldpasswordController.text =
                            password_chang_driver.toString();
                        frist_login = 0;
                        if ((_oldpasswordController.text !=
                            _newpasswordController.text)) {
                          if ((_newpasswordController.text ==
                              _con_newpasswordController.text)) {
                            if (_newpasswordController.text.length > 7 &&
                                _con_newpasswordController.text.length > 7) {
                              Alertfrist_loginChangPassword(
                                  context,
                                  _oldpasswordController,
                                  _newpasswordController);
                            } else {
                              chang_password_new(
                                  context, 'กรุณากรอกรหัสอย่างน้อย 8 ตัวอักษร');
                            }
                          } else {
                            chang_password_new(
                                context, 'รหัสผ่านใหม่ไม่ตรงกัน');
                          }
                        } else {
                          chang_password_old(
                              context, 'รหัสผ่านใหม่ต้องไม่ตรงกับรหัสผ่านเดิม');
                        }
                        print("รหัสผ่านเก่า = " +
                            _oldpasswordController.text +
                            " รหัสผ่านใหม่ = " +
                            _newpasswordController.text +
                            " ยืนยันรหัสผ่านใหม่ = " +
                            _con_newpasswordController.text +
                            " ชื่อผู้ใช้งาน = " +
                            username_chang_driver.toString());
                        print('Token::: $result_token');
                      },
                      child: Text('เปลี่ยนรหัสผ่าน'),
                    ),
                  ]),
            ),
          ),
        ));
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

  Future<void> Alertfrist_loginChangPassword(BuildContext context,
      _oldpasswordController, _newpasswordController) async {
    showDialog(
      context: context,
      builder: (context) => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
        child: AlertDialog(
          actions: [
            Column(
              children: [
                Icon(
                  Icons.warning,
                  size: 50,
                  color: Colors.red,
                ),
                Container(
                  height: 5,
                ),
                Text(
                  'ยืนยันการเปลี่ยนรหัสผ่าน',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        var _oldpasswordControllers =
                            _oldpasswordController.text;
                        var _newpasswordControllers =
                            _newpasswordController.text;
                        PosapiChangPasswordFrist_Login_Driver(context,
                            _oldpasswordControllers, _newpasswordControllers);
                        print('ชื่อผู้ใช้งาน $username_chang_driver');
                        print('เก่า $_oldpasswordControllers');
                        print('ใหม่ $_newpasswordControllers');
                        print('frist_login $frist_login');
                      },
                      child: const Center(
                          child: Text(
                        'ตกลง',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Center(
                          child: Text(
                        'ยกเลิก',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  var New_Token_Driver;
  Future<void> PosapiChangPasswordFrist_Login_Driver(BuildContext context,
      String _oldpasswordControllers, String _newpasswordControllers) async {
    String url = apiChangPasswordDriver;
    bool _isChecked_Btn = true;
    var Btn_Driver = 1;
    void _Btn_DriverRemeberme(value) {
      print("Btn_Driver");
      _isChecked_Btn = value;
      SharedPreferences.getInstance().then(
        (prefs) {
          prefs.setString('Btn_Driver', Btn_Driver.toString());
        },
      );
      _isChecked_Btn = value;
    }

    try {
      Dio dio = new Dio();
      Response response = await dio.post(url,
          options: Options(headers: {'Authorization': 'Token $result_token'}),
          data: {
            "old_password": _oldpasswordControllers.toString(),
            "new_password": _newpasswordControllers.toString(),
            "frist_login": frist_login,
          });
      var status_code = response.data["status_code"][0]["code"];
      var result = response.data['results'][0];
      print(status_code);
      if (status_code == '200') {
        print(result);
        bool _isChecked_Btn = true;
        _Btn_DriverRemeberme(_isChecked_Btn);
        @override
        void initState() {
          _oldpasswordControllers.toString();
          _newpasswordControllers.toString();
        }

        New_Token_Driver = result;
        if ((username_chang_driver != "" && password_chang_driver != "")) {
          GetConfrimRememberFrist_Login_Driver(context, New_Token_Driver);
          print('username::: $username_chang_driver');
          print('password::: $password_chang_driver');
          print('New_Token_Driver:::$New_Token_Driver');
        }
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  Future<void> GetConfrimRememberFrist_Login_Driver(
      BuildContext context, New_Token_Driver) async {
    result_token = New_Token_Driver;
    var dio = Dio();
    String url = apiDriverUser;
    final response = await dio.get(url,
        options: Options(headers: {'Authorization': 'Token $result_token'}));
    var result = response.data['results'][0];
    if (response.data['status_code'][0]['code'] == "200") {
      String _username = username_chang_driver;
      String _password = password_chang_driver;
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => Loading_Driver(),
          ),
          (Route<dynamic> route) => false);
    }
    Driver_ProfileUser = result;
    print(Driver_ProfileUser);
    print('Token::: $result_token');
  }
}
