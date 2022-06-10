import 'package:cpac/controller/gas_qr_code.dart';
import 'package:cpac/controller/qr_code.dart';
import 'package:cpac/server/api.dart';
import 'package:cpac/utility/date_time.dart';
import 'package:cpac/utility/my_alert.dart';
import 'package:cpac/view/driver/tabbar_driver_home.dart';
import 'package:cpac/view/frist_user_login.dart';
import 'package:cpac/view/gas_station/gas_loading_page.dart';
import 'package:cpac/view/gas_station/tabbar_gas%20home.dart';
import 'package:cpac/view/loading_chang_password.dart';
import 'package:cpac/view/login_pump_gas.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:store_redirect/store_redirect.dart';

import 'driver_employee.dart';

var Profile;
Future<void> GetapiHeader(token) async {
  var dio = Dio();
  String url = apiUser;
  final response = await dio.get(url,
      options: Options(headers: {'Authorization': 'Token $token'}));
  var result = response.data['results'][0];
  Profile = result;
}

var Tokens_all;
Future<void> GetToken(token) async {
  String url = apiUser;
  Dio dio = new Dio();
  Response response = await dio.post(
    url,
    options: Options(headers: {'Authorization': 'Token $token'}),
  );
  var result = token;
  Tokens_all = result;
  PostPumpHistoryRefue(startdate, enddate);
}

Future<void> GetapiPumpUser(BuildContext context, token) async {
  String url = apiUser;
  Dio dio = Dio();
  Response response = await dio.post(
    url,
    options: Options(headers: {'Authorization': 'Token $token'}),
  );
  print('Token::: $response');
  var result = response.data['results'][0];
  if (response.data['status_code'][0]['code'] == "200") {
    Profile = result;
    if (Profile['user_level'] == "D") {
      GetapiHeader(token); //pop dialog
      GetToken(token);
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => TabBar_Menu_Driver_Home()),
          (Route<dynamic> route) => false);
    } else if (Profile['user_level'] == "P") {
      GetapiHeader(token);
      GetToken(token);
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => TabBar_Menu_Gas_Home()),
          (Route<dynamic> route) => false);
    }
  }

  print('Profile::: $Profile');
  print('Token::: $token');
}

// Future<void> AlertUpdate_App(BuildContext context) async {
//   showDialog(
//     context: context,
//     builder: (context) => MediaQuery(
//       data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
//       child: AlertDialog(
//         actions: [
//           Column(
//             children: [
//               Icon(
//                 Icons.error_outline,
//                 size: 50,
//                 color: Colors.red,
//               ),
//               Container(
//                 height: 10,
//               ),
//               const Text(
//                 'กรุณาอัพเดตแอปเวอร์ชั่นใหม่',
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//                 textAlign: TextAlign.center,
//               ),
//               Container(
//                 height: 10,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       primary: Colors.red,
//                     ),
//                     onPressed: () {
//                       Navigator.of(context).pushAndRemoveUntil(
//                           MaterialPageRoute(
//                               builder: (context) => TabBar_Menu_Gas_Home()),
//                           (Route<dynamic> route) => false);
//                     },
//                     child: const Center(
//                         child: Text(
//                       'ข้าม',
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     )),
//                   ),
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       primary: Colors.green,
//                     ),
//                     onPressed: () {
//                       // _launchUrl();
//                       StoreRedirect.redirect(
//                         androidAppId: "com.srithai.refuelers",
//                         // iOSAppId: "585027354",
//                       );
//                       Navigator.of(context).pop();
//                     },
//                     child: const Center(
//                         child: Text(
//                       'อัพเดท',
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     )),
//                   ),
//                 ],
//               ),
//             ],
//           )
//         ],
//       ),
//     ),
//   );
// }

Future<void> GetConfrimRememberPumpUser(
    BuildContext context, token, device_model_pump) async {
  var dio = Dio();
  String url = apiUser;
  final response = await dio.get(url,
      options: Options(headers: {'Authorization': 'Token $token'}));
  var result = response.data['results'][0];
  if (response.data['status_code'][0]['code'] == "200") {
    // if (result['device_model'] == device_model_pump) {
    if (result['frist_login'] == 0) {
      GetapiPumpUser(context, token);
      GetapiDriverDouponList(context, token);
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
    // } else {
    //   Navigator.of(context).pushAndRemoveUntil(
    //       MaterialPageRoute(builder: (context) => Loading_Chang_Password()),
    //       (Route<dynamic> route) => false);
    // }
  }
  Profile = result;
  print(Profile);
  print('Token::: $token');
}
