import 'package:flutter/material.dart';
import 'package:liberty/screens/user/home_user/home_user_screen.dart';
import 'package:liberty/screens/login/sign/components/default_button.dart';
import 'package:liberty/screens/login/sign/size_config.dart';


class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: SizeConfig.screenHeight * 0.04),
        Image.asset(
          "assets/images/success.png",
          height: SizeConfig.screenHeight * 0.4, //40%
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.08),
        Text(
          "Sucesso ao Logar",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(30),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Spacer(),
        SizedBox(
          width: SizeConfig.screenWidth * 0.6,
          child: DefaultButton(
            text: "Entrar",
            press: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeUserScreen()));
            },
          ),
        ),
        Spacer(),
      ],
    );
  }
}
