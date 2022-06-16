import 'package:cpac/controller/chang_password.dart';
import 'package:cpac/controller/user_profile.dart';
import 'package:cpac/server/api.dart';
import 'package:cpac/utility/my_alert.dart';
import 'package:cpac/view/driver/tabbar_driver_home.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'gas_station/gas_loading_page.dart';
import 'gas_station/tabbar_gas home.dart';
import 'login_pump_gas.dart';

class Frist_User_Login extends StatefulWidget {
  Frist_User_Login({Key? key}) : super(key: key);

  @override
  State<Frist_User_Login> createState() => _Frist_User_LoginState();
}

class _Frist_User_LoginState extends State<Frist_User_Login> {
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
                        username_chang.toString();
                        _oldpasswordController.text = password_chang.toString();
                        frist_login = 0;
                        if ((_oldpasswordController.text !=
                            _newpasswordController.text)) {
                          if ((_newpasswordController.text ==
                              _con_newpasswordController.text)) {
                            Alertfrist_loginChangPassword(context,
                                _oldpasswordController, _newpasswordController);
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
                            username_chang.toString());
                        print('Token::: $Tokens_all');
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
                        PosapiChangPasswordFrist_Login(context,
                            _oldpasswordControllers, _newpasswordControllers);
                        print('ชื่อผู้ใช้งาน $username_chang');
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

  var New_Token;
  Future<void> PosapiChangPasswordFrist_Login(BuildContext context,
      String _oldpasswordControllers, String _newpasswordControllers) async {
    String url = apiChangPassword;
    bool _isChecked_Pump = true;
    var Btn_Pump = 2;
    void _Btn_PumpRemeberme(value) {
      print("Btn_Pump");
      _isChecked_Pump = value;
      SharedPreferences.getInstance().then(
        (prefs) {
          prefs.setString('Btn_Pump', Btn_Pump.toString());
        },
      );
      _isChecked_Pump = value;
    }

    try {
      Dio dio = new Dio();
      Response response = await dio.post(url,
          options: Options(headers: {'Authorization': 'Token $Tokens_all'}),
          data: {
            "old_password": _oldpasswordControllers.toString(),
            "new_password": _newpasswordControllers.toString(),
            "frist_login": frist_login,
          });

      var status_code = response.data["status_code"][0]["code"];
      var result = response.data['results'][0];
      print(status_code);
      print(result);
      print(Tokens_all);

      if (status_code == '200') {
        bool _isChecked_Pump = true;
        _Btn_PumpRemeberme(_isChecked_Pump);
        @override
        void initState() {
          _oldpasswordControllers.toString();
          _newpasswordControllers.toString();
        }

        New_Token = result;
        if ((username_chang != "" && password_chang != "")) {
          GetConfrimRememberFrist_Login(context, New_Token);
          print('username::: $username_chang');
          print('password::: $password_chang');
          print('NewToken:::$New_Token');
        }
      }
    } on Exception catch (e) {
      print(e);
      print('ERROR');
    }
  }

  Future<void> GetConfrimRememberFrist_Login(
      BuildContext context, New_Token) async {
    token = New_Token;
    var dio = Dio();
    String url = apiUser;
    final response = await dio.get(url,
        options: Options(headers: {'Authorization': 'Token $token'}));
    var result = response.data['results'][0];
    if (response.data['status_code'][0]['code'] == "200") {
      if (result['frist_login'] == 0) {
        if (Profile['user_level'] == "D") {
          GetapiHeader(token); //pop dialog
          GetToken(token);
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (context) => TabBar_Menu_Driver_Home()),
              (Route<dynamic> route) => false);
        } else if (Profile['user_level'] == "P") {
          GetapiHeader(token);
          GetToken(token);
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => TabBar_Menu_Gas_Home()),
              (Route<dynamic> route) => false);
        }
        // Navigator.of(context).pushAndRemoveUntil(
        //     MaterialPageRoute(builder: (context) => Loading_Page_Date()),
        //     (Route<dynamic> route) => false);
      } else {
        GetapiHeader(token); //pop dialog
        GetToken(token);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => Frist_User_Login()),
            (Route<dynamic> route) => false);
      }
    }
    Profile = result;
    print(Profile);
    print('Token::: $token');
  }
}
