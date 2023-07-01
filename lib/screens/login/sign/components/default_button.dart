import 'package:flutter/material.dart';
import 'package:liberty/models/user_manager.dart';
import 'package:provider/provider.dart';
import '../constants.dart';
import '../size_config.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key key,
    this.text,
    this.press,
  }) : super(key: key);
  final String text;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return Consumer<UserManager>(builder: (_, userManager, __) {
      return SizedBox(
        width: double.infinity,
        height: getProportionateScreenHeight(56),
        child: FlatButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: TonyBackgroundSecyndaryColor,
          disabledColor: TonyBackgroundSecyndaryColor.withAlpha(100),
          onPressed: press,
          child: userManager.loading? CircularProgressIndicator() : Text(
            text,
            style: TextStyle(
              fontSize: getProportionateScreenWidth(18),
              color: Colors.white,
            ),
          ),
        ),
      );
    });
  }
}
