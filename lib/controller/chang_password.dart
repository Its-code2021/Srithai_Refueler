import 'package:cpac/controller/user_profile.dart';
import 'package:cpac/server/api.dart';
import 'package:cpac/utility/date_time.dart';
import 'package:cpac/view/loading_chang_password.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

var Chang_Password;
Future<void> PosapiChangPassword(BuildContext context,
    String _oldpasswordControllers, String _newpasswordControllers) async {
  String url = apiChangPassword;
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
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Loading_Chang_Password()),
          (Route<dynamic> route) => false);
    }
  } on Exception catch (e) {
    print(e);
  }
}
