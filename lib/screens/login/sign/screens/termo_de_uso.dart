import 'package:flutter/material.dart';
import 'package:liberty/screens/login/sign/constants.dart';
class TermoDeUso extends StatelessWidget {
  static String routeName = "/TermoDeUso";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TonyBackgroundPrimaryColor,
      body: Column(
        children: [
          AppBar(
            backgroundColor: TonyBackgroundPrimaryColor,
            centerTitle: true,
            elevation: 0,
            brightness: Brightness.light,
            title: Text(
              "Termos de uso"
            ),
          ),
        ],
      ),
    );
  }
}
