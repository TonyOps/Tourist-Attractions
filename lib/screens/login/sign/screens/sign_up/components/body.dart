import 'package:flutter/material.dart';
import 'package:liberty/screens/login/sign/constants.dart';
import 'package:liberty/screens/login/sign/size_config.dart';
import 'sign_up_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                Text("Registre sua conta", style: headingStyle),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Ao continuar, confirme que concorda \ncom nosso',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ],
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.01),
                GestureDetector(
                  onTap: () => Navigator.of(context).pushNamed('/TermoDeUso'),

                  child: Text(
                    "Termos de Serviço, Política de Privacidade\n e \n Termos de Uso da plataforma",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.red),
                  ),
                ),

                SizedBox(height: SizeConfig.screenHeight * 0.08),
                SignUpForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.08),

                Padding(
                  padding:
                      EdgeInsets.only(bottom: getProportionateScreenHeight(20)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
