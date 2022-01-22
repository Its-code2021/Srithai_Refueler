import 'package:cpac/controller/qr_code.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

// String api = "https://stms.srithaigroup.com/v2/api";
// String api = "http://192.168.1.113/project/tms/api"; //Demo Wifi GPS
String api = "http://192.168.1.37/project/tms/api"; //Demo Wifi [บ้าน]

String apiLogin = api + "/auth/?p=user-login"; //เข้าสู่ระบบ
String apiUser = api + "/auth/?p=user-data"; //user
String apiQrCode = api + "/app/?p=scan-qr"; // Scan QrCode
String apiQrCodeNumber = api + "/app/?p=enter-qr"; // กรอกหมายเลข QrCode
String apiConfrimRefulOil =
    api + "/app/?p=refuel-confirmed"; // Confrim เติทน้ำมัน
String apiRefuelDetail =
    api + "/app/?p=refuel-detail&id="; // รายละการเติมน้ำมัน

String apiConfirmRefuelAmount =
    api + "/app/?p=confirm-refuel-amount"; // ยืนยันการเติมน้ำมัน
