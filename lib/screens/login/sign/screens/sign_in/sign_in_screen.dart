import 'package:flutter/material.dart';
import 'package:liberty/screens/login/sign/constants.dart';
import 'package:liberty/screens/login/sign/size_config.dart';
import 'components/body.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = "/SignInScreen";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init( context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TonyBackgroundPrimaryColor,
        centerTitle: true,
        elevation: 0,
        brightness: Brightness.light,
        title: Text("Entrar"),
      ),
      body: Body(),
      backgroundColor: TonyBackgroundPrimaryColor,
    );
  }
}
