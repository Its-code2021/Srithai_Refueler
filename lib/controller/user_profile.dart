import 'package:cpac/controller/gas_qr_code.dart';
import 'package:cpac/controller/qr_code.dart';
import 'package:cpac/server/api.dart';
import 'package:cpac/utility/date_time.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

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
