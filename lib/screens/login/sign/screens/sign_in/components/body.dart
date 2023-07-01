import 'package:flutter/material.dart';
import 'package:liberty/models/user_manager.dart';
import 'package:liberty/screens/login/sign/components/no_account_text.dart';
import 'package:liberty/screens/login/sign/or_divider.dart';
import 'package:provider/provider.dart';
import '../../../size_config.dart';
import 'sign_form.dart';

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
                SizedBox(height: SizeConfig.screenHeight * 0.02),///4
                Text(
                  "Bem-vindo",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Faça login com seu email e senha",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                SignForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                SizedBox(height: getProportionateScreenHeight(20)),
                NoAccountText(),
                SizedBox(height: getProportionateScreenHeight(20)),
                OrDivider(),
                SizedBox(height: getProportionateScreenHeight(20)),
                Consumer<UserManager>(
                  builder: (_, userManager, __) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      ],
                    );
                  },
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Ao continuar, você concorda \ncom nossos',
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
                        //fontSize: getProportionateScreenWidth(16),
                        //color: kPrimaryColor),
                        color: Colors.red),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
