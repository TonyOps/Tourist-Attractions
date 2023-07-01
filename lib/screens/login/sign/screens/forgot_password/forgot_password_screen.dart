import 'package:flutter/material.dart';
import 'package:liberty/screens/login/sign/constants.dart';

import 'components/body.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static String routeName = "/ForgotPasswordScreen";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TonyBackgroundPrimaryColor,
        centerTitle: true,
        elevation: 0,
        brightness: Brightness.light,
        title: Text("Recuperar Senha"),
      ),
      body: Body(),
      backgroundColor: TonyBackgroundPrimaryColor,
    );
  }
}
