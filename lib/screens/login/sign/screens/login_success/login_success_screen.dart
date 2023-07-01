import 'package:flutter/material.dart';
import 'package:liberty/screens/login/sign/constants.dart';

import 'components/body.dart';

class LoginSuccessScreen extends StatelessWidget {
  static String routeName = "/login_success";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TonyBackgroundPrimaryColor,
        centerTitle: true,
        elevation: 0,
        brightness: Brightness.light,
        leading: SizedBox(),
        title: Text("Sucesso ao Entrar"),
      ),
      body: Body(),
      backgroundColor: TonyBackgroundPrimaryColor,
    );
  }
}
