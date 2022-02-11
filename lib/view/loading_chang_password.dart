import 'package:cpac/view/login_test.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Loading_Chang_Password extends StatefulWidget {
  Loading_Chang_Password({Key? key}) : super(key: key);

  @override
  State<Loading_Chang_Password> createState() => _Loading_Chang_PasswordState();
}

class _Loading_Chang_PasswordState extends State<Loading_Chang_Password> {
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset(
        'images/loading.gif',
        fit: BoxFit.cover,
        alignment: Alignment.center,
      ),
      backgroundColor: Colors.white,
      showLoader: true,
      navigator: LoginPage(),
      durationInSeconds: 3,
      loaderColor: Colors.white,
    );
  }
}
