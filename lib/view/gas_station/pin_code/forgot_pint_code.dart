import 'dart:async';

import 'package:cpac/controller/pin_code.dart';
import 'package:cpac/controller/user_profile.dart';
import 'package:cpac/utility/my_alert.dart';
import 'package:cpac/view/gas_station/pin_code/forgot_confirm_pint_code.dart';
import 'package:cpac/view/gas_station/pin_code/gas_confirm_password_change_pin_code.dart';
import 'package:cpac/view/gas_station/pin_code/gas_create_confirm_pin_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:pin_code_fields/pin_code_fields.dart';

void main() => runApp(Forgot_Pin_Code());

// ignore: use_key_in_widget_constructors
class Forgot_Pin_Code extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
      ),

      home:
          const PinCodeVerificationScreen(), // a random number, please don't call xD
    );
  }
}

class PinCodeVerificationScreen extends StatefulWidget {
  final String? phoneNumber;

  const PinCodeVerificationScreen({
    Key? key,
    this.phoneNumber,
  }) : super(key: key);

  @override
  _PinCodeVerificationScreenState createState() =>
      _PinCodeVerificationScreenState();
}

class _PinCodeVerificationScreenState extends State<PinCodeVerificationScreen> {
  TextEditingController textEditingController = TextEditingController();
  // ..text = "123456";

  // ignore: close_sinks
  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();

    super.dispose();
  }

  // snackBar Widget
  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff438EB9),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (context) =>
                          Gas_ConfirmPassword_ChangePinCode()),
                  (Route<dynamic> route) => false);
            },
            icon: Icon(Icons.arrow_back)),
        title: Container(
          width: double.infinity,
          alignment: Alignment.center,
          child: Text(
            '????????????????????????????????? PIN CODE',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () {},
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            children: <Widget>[
              Container(height: 30),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'images/logo.png',
                      fit: BoxFit.cover,
                      scale: 25,
                    ),
                  ),
                  Container(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '???????????? PIN ????????????',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
              Container(height: 20),
              Form(
                key: formKey,
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 1.0, horizontal: 30),
                    child: PinCodeTextField(
                      appContext: context,
                      backgroundColor: Colors.white,
                      pastedTextStyle: TextStyle(
                        color: Colors.green.shade600,
                        fontWeight: FontWeight.bold,
                      ),
                      length: 6,
                      obscureText: true,
                      obscuringCharacter: '*',
                      blinkWhenObscuring: true,
                      animationType: AnimationType.fade,
                      validator: (v) {
                        if (v!.length < 3) {
                          return "";
                        } else {
                          return null;
                        }
                      },
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(5),
                        activeFillColor: Colors.white,
                      ),
                      cursorColor: Colors.black,
                      animationDuration: const Duration(milliseconds: 300),
                      enableActiveFill: true,
                      errorAnimationController: errorController,
                      controller: textEditingController,
                      keyboardType: TextInputType.numberWithOptions(),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                      ],
                      onCompleted: (v) {
                        List<String> numbers = [
                          "123456",
                          "111111",
                          "222222",
                          "333333",
                          "444444",
                          "555555",
                          "666666",
                          "777777",
                          "888888",
                          "999999",
                          "000000"
                        ];
                        currentText_Chang_Pin = currentText;

                        var List_number;
                        for (var i = 0; i < numbers.length; i++) {
                          List_number = numbers[i];
                          if (currentText_Chang_Pin == List_number) {
                            textEditingController.clear();
                            Alert_GAS_Forgot_Security_PinCode(context);
                          } else {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Forgot_Confirm_Pin_Code()),
                                (Route<dynamic> route) => false);
                          }
                        }
                      },
                      onChanged: (value) {
                        debugPrint(value);
                        setState(() {
                          currentText = value;
                        });
                      },
                      beforeTextPaste: (text) {
                        debugPrint("Allowing to paste $text");
                        return true;
                      },
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  hasError ? "*??????????????????????????????????????????????????????" : "",
                  style: const TextStyle(
                      color: Colors.red,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Center(
                child: Text(
                  '???????????????????????????????????? PIN  6 ???????????? ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> Alert_GAS_Forgot_Security_PinCode(BuildContext context) async {
    showDialog(
        context: context,
        builder: (context) => MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
              child: AlertDialog(
                actions: [
                  Column(
                    children: [
                      Icon(
                        Icons.error_outline,
                        size: 50,
                        color: Colors.red,
                      ),
                      Container(
                        height: 10,
                      ),
                      const Text(
                        '?????????????????????????????????????????????????????????????????????????????? ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                      const Text(
                        'PIN CODE ??????????????????????????????????????????',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                      Container(
                        height: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => Forgot_Pin_Code()),
                              (Route<dynamic> route) => false);
                        },
                        child: const Center(
                            child: Text(
                          '????????????',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                      ),
                    ],
                  )
                ],
              ),
            ));
  }

  Future<void> Alert_Check_Duplicate_PinCode(BuildContext context) async {
    showDialog(
        context: context,
        builder: (context) => MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
              child: AlertDialog(
                actions: [
                  Column(
                    children: [
                      Icon(
                        Icons.error_outline,
                        size: 50,
                        color: Colors.red,
                      ),
                      Container(
                        height: 10,
                      ),
                      const Text(
                        '???????????? PIN ???????????? ??????????????????????????????????????? ???????????? PIN ????????????',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                      Container(
                        height: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Center(
                            child: Text(
                          '????????????',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                      ),
                    ],
                  )
                ],
              ),
            ));
  }
}
