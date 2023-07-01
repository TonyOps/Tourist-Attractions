import 'package:flutter/material.dart';
import 'package:liberty/screens/login/sign/constants.dart';

import 'components/body.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = "/sign_up";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TonyBackgroundPrimaryColor,
        centerTitle: true,
        elevation: 0,
        brightness: Brightness.light,
        title: Text("Inscrever-se"),
      ),
      body: Body(),
      backgroundColor: TonyBackgroundPrimaryColor,
    );
  }
}
