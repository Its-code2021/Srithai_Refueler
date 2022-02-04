import 'package:cpac/controller/qr_code.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

String api = "https://stms.srithaigroup.com/v2/api";

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

//API Pump
String apiQrCodePump = api + "/pump/?p=scan-qr"; // Scan QrCode
String apiQrCodeNumberPump = api + "/pump/?p=enter-qr"; // กรอกหมายเลข QrCode
String apiConfrimRefulOilPump =
    api + "/pump/?p=refuel-confirmed"; // Confrim เติทน้ำมัน
String apiRefuelDetailPump =
    api + "/pump/?p=refuel-detail&id="; // รายละเอียดการเติมน้ำมัน

String apiPumpConfirmRefuelAmount =
    api + "/pump/?p=confirm-driver-signed"; // ยืนยันการเติมน้ำมัน

String apiPumprefuelBillDetail = api +
    "/pump/?p=refuel-bill-detail&id="; // รายละเอียดและกรอกจำนวนเงินเติมน้ำมัน

String apiPumpConfirmBillAmount =
    api + "/pump/?p=confirm-refuel-amount"; // ยืนยันการกรอกจำนวนเงินเติมน้ำมัน

String apiPumpHistoryRefue =
    api + "/pump/?p=history-refuel"; // ประวัติการเติมน้ำมัน

String apiPumpHistoryRefueDetail =
    api + "/pump/?p=history-detail&id="; // ประวัติการเติมน้ำมัน
   