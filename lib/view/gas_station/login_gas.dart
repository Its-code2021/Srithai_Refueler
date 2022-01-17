// ignore_for_file: prefer_const_constructors

import 'package:cpac/view/gas_station/tabbar_Gas.dart';

import 'package:flutter/material.dart';
import 'package:cpac/view/driver/refueling_all.dart';

class Login_Gas extends StatefulWidget {
  Login_Gas({Key? key}) : super(key: key);

  @override
  _Login_GasState createState() => _Login_GasState();
}

class _Login_GasState extends State<Login_Gas> {
  bool _isObscure = true;
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.blue;
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: <Widget>[
                  Image.asset(
                    'images/001.png',
                  ),
                  Container(height: 10),
                  // Text(
                  //   'เฉพาะผู้ให้บริการปั้มน้ำมันเท่านั้น',
                  //   textAlign: TextAlign.left,
                  //   style: TextStyle(
                  //     fontSize: 18,
                  //     fontWeight: FontWeight.bold,
                  //     color: Colors.grey,
                  //   ),
                  // ),
                  Container(height: 60),
                  Container(
                    child: SizedBox(
                      width: double.infinity,
                      child: Text(
                        'ชื่อผู้ใช้งาน',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Container(height: 10),
                  TextField(
                      decoration: InputDecoration(
                    labelStyle: TextStyle(
                      fontSize: 20,
                    ),
                    border: myinputborder(), //normal border
                    enabledBorder: myinputborder(), //enabled border
                    focusedBorder: myfocusborder(), //focused border
                    // set more border style like disabledBorder
                  )),
                  Container(height: 10),
                  Container(
                    child: SizedBox(
                      width: double.infinity,
                      child: Text(
                        'รหัสผ่าน',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Container(height: 10),
                  TextField(
                    maxLength: 16,
                    obscureText: _isObscure,
                    decoration: InputDecoration(
                        counterText: "",
                        labelStyle: TextStyle(
                          fontSize: 20,
                        ),
                        enabledBorder: myinputborder(),
                        focusedBorder: myfocusborder(),
                        suffixIcon: IconButton(
                            icon: Icon(_isObscure
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            })),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Checkbox(
                          checkColor: Colors.white,
                          fillColor:
                              MaterialStateProperty.resolveWith(getColor),
                          value: isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value!;
                            });
                          }),
                      Text(
                        'จำรหัสผ่าน',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Container(height: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue[900],
                      minimumSize: Size.fromHeight(
                        50,
                      ), // fromHeight use double.infinity as width and 40 is the height
                    ),
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => TabBar_Menu_Gas()),
                          (Route<dynamic> route) => false);

                      print('เข้าสู่ระบบ ปั้ม');
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text(
                          'เข้าสู่ระบบ ปั้ม',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.login,
                          size: 30,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
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
