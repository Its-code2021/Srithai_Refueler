import 'package:cpac/controller/chang_password.dart';
import 'package:cpac/utility/my_alert.dart';
import 'package:flutter/material.dart';

import 'login_pump_gas.dart';

class Change_Password extends StatefulWidget {
  Change_Password({Key? key}) : super(key: key);

  @override
  State<Change_Password> createState() => _Change_PasswordState();
}

class _Change_PasswordState extends State<Change_Password> {
  bool old_showPassword = true;
  bool new_showPassword = true;
  bool con_showPassword = true;
  TextEditingController _oldpasswordController = TextEditingController();
  TextEditingController _newpasswordController = TextEditingController();
  TextEditingController _con_newpasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Image.asset('images/002.png', fit: BoxFit.cover),
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
                    Container(
                      child: SizedBox(
                        width: double.infinity,
                        child: Text(
                          'รหัสผ่านเดิม',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(height: 10),
                    TextField(
                      maxLength: 16,
                      controller: _oldpasswordController,
                      obscureText: old_showPassword,
                      decoration: InputDecoration(
                          counterText: "",
                          labelStyle: TextStyle(
                            fontSize: 20,
                          ),
                          isDense: true,
                          enabledBorder: myinputborder(),
                          focusedBorder: myfocusborder(),
                          suffixIcon: IconButton(
                              icon: Icon(old_showPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                setState(() => {
                                      this.old_showPassword =
                                          !this.old_showPassword
                                    });
                              })),
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
                        if ((_oldpasswordController.text !=
                            _newpasswordController.text)) {
                          if ((_newpasswordController.text ==
                              _con_newpasswordController.text)) {
                            AlertConfrimChangPassword(context,
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
                            _con_newpasswordController.text);
                      },
                      child: Text('เปลี่ยนรหัสผ่าน'),
                    ),
                  ]),
            ),
          ),
        ));
  }

  // Future<void> AlertConfrimChangPassword() async {
  //   showDialog(
  //     context: context,
  //     builder: (context) => MediaQuery(
  //       data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
  //       child: AlertDialog(
  //         actions: [
  //           Column(
  //             children: [
  //               Icon(
  //                 Icons.warning,
  //                 size: 50,
  //                 color: Colors.red,
  //               ),
  //               Container(
  //                 height: 5,
  //               ),
  //               Text(
  //                 'ยืนยันการเปลี่ยนรหัสผ่าน',
  //                 style: TextStyle(fontWeight: FontWeight.bold),
  //               ),
  //               Container(
  //                 height: 20,
  //               ),
  //               Row(
  //                 crossAxisAlignment: CrossAxisAlignment.end,
  //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                 children: [
  //                   ElevatedButton(
  //                     onPressed: () {
  //                       var _oldpasswordControllers =
  //                           _oldpasswordController.text;
  //                       var _newpasswordControllers =
  //                           _newpasswordController.text;
  //                       PosapiChangPassword(context, _oldpasswordControllers,
  //                           _newpasswordControllers);
  //                       print('ตกลง');
  //                     },
  //                     child: const Center(
  //                         child: Text(
  //                       'ตกลง',
  //                       style: TextStyle(fontWeight: FontWeight.bold),
  //                     )),
  //                   ),
  //                   ElevatedButton(
  //                     style: ElevatedButton.styleFrom(
  //                       primary: Colors.red,
  //                     ),
  //                     onPressed: () {
  //                       Navigator.of(context).pop();
  //                     },
  //                     child: const Center(
  //                         child: Text(
  //                       'ยกเลิก',
  //                       style: TextStyle(fontWeight: FontWeight.bold),
  //                     )),
  //                   ),
  //                 ],
  //               ),
  //             ],
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

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
}
