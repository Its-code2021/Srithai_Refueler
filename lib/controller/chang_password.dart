import 'package:cpac/controller/user_profile.dart';
import 'package:cpac/server/api.dart';
import 'package:cpac/utility/date_time.dart';
import 'package:cpac/view/loading_chang_password.dart';
import 'package:cpac/view/login_pump_gas.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

var Chang_Password;
// Future<void> PosapiChangPassword(BuildContext context,
//     String _oldpasswordControllers, String _newpasswordControllers) async {
//   String url = apiChangPassword;
//   try {
//     Dio dio = new Dio();
//     Response response = await dio.post(url,
//         options: Options(headers: {'Authorization': 'Token $Tokens_all'}),
//         data: {
//           "old_password": _oldpasswordControllers,
//           "new_password": _newpasswordControllers,
//         });
//     var status_code = response.data["status_code"][0]["code"];
//     var result = response.data['results'][0];
//     print(status_code);
//     if (status_code == '200') {
//       print(result);
//       Navigator.of(context).pushAndRemoveUntil(
//           MaterialPageRoute(builder: (context) => Loading_Chang_Password()),
//           (Route<dynamic> route) => false);
//     }
//   } on Exception catch (e) {
//     print(e);
//   }
// }

Future<void> PosapiChangPassword(BuildContext context,
    String _oldpasswordControllers, String _newpasswordControllers) async {
  String url = apiChangPassword;
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
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
          "old_password": _oldpasswordControllers,
          "new_password": _newpasswordControllers,
        });
    var status_code = response.data["status_code"][0]["code"];
    var result = response.data['results'][0];
    print(status_code);
    if (status_code == '200') {
      print(result);
      final _prefs = await SharedPreferences.getInstance();
      await _prefs.clear();
      bool _isChecked_Pump = true;
      _Btn_PumpRemeberme(_isChecked_Pump);
      @override
      void initState() {
        _usernameController.clear();
        _passwordController.clear();
        token = '';
        Tokens_all = '';
      }

      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Loading_Chang_Password()),
          (Route<dynamic> route) => false);
    }
  } on Exception catch (e) {
    print(e);
  }
}
