import 'package:cpac/controller/qr_code.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

// String api = "https://stms.srithaigroup.com/v2/api";
// String apimail = "https://stms.srithaigroup.com/v2/service"; //Demo Wifi [บ้าน]
String api = "http://192.168.1.113/project/tms/api"; //Demo Wifi GPS
String apimail = "http://192.168.1.113/project/tms/service"; //Demo Wifi GPS
// String api = "http://192.168.1.72/project/tms/api"; //Demo Wifi RS
// String api = "http://192.168.1.202/project/tms/api"; //Demo Wifi FLM
// String api = "http://192.168.1.44/project/tms/api"; //Demo Wifi [บ้าน]
// String apimail = "http://192.168.1.44/project/tms/service"; //Demo Wifi [บ้าน]

String apiLogin = api + "/auth/?p=user-login"; //เข้าสู่ระบบ
String apiUser = api + "/auth/?p=user-data"; //user
String apiChangPassword = api + "/auth/?p=user-change-password"; //user
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
String apiSendEmail = apimail + "/pump/?p=send-email"; // ส่งเมล
//API Driver(พขร.)
String apiLoginDriver = api + "/auth/?p=driver-login"; //เข้าสู่ระบบ
String apiDriverUser = api + "/auth/?p=driver-data"; //user
String apiDriverCouponList = api + "/app/?p=driver-coupon-list"; //รายการคูปอง
String apiDriverCouponDetail =
    api + "/app/?p=driver-coupon-detail&id="; //รายการคูปอง
String apiRecheckRefuel =
    api + "/app/?p=driver-coupon-refuel&id="; //เช็คเติมว่าเติมน้ำมันยัง
String apiChangPasswordDriver = api + "/auth/?p=driver-change-password"; //
String apiDriver_List = api + "/app/?p=driver-list"; //เช็ค พขร ที่เปลี่ยนได้
String apiDriver_Change =
    api + "/app/?p=driver-change"; //เช็ค พขร ที่เปลี่ยนได้
String apiDriver_Search =
    api + "/app/?p=driver-search&q="; //เช็ค พขร ที่เปลี่ยนได้