import 'package:flutter/material.dart';
import 'package:liberty/screens/login/sign/size_config.dart';

const TonyBackgroundPrimaryColor = Color (0xFFF0F2F5);
const TonyBackgroundSecyndaryColor = Color (0xFFA95EFA);
const kPrimaryColor = Color(0xFFFF7643);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^(([^<>()[\]\\.,;:\s@\']+(\.[^<>()[\]\\.,;:\s@\']+)*)|(\'.+\'))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$");
const String kEmailNullError = "Por favor, insira o seu e-mail";
const String kInvalidEmailError = "Por favor, insira um e-mail válido";
const String kPassNullError = "Por favor, insira sua senha";
const String kShortPassError = "A senha é muito curta";
const String kMatchPassError = "As senhas não coincidem";
const String kNamelNullError = "Por favor, insira seu nome corretamente";
const String kNomeImcompletoError = "Por favor insira o seu completo corretamente";
const String kFalseNomeBigError = "Por favor insira o seu completo de forma real";
const String kLastNamelNullError = "Por favor, insira seu sobrenome corretamente";
const String kPhoneNumberNullError = "Por favor, digite seu número de telefone";
const String kAddressNullError = "Por favor insira o seu endereço";



final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: BorderSide(color: kTextColor),
  );


}OutlineInputBorder outlineInputBorderChatTony() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(30)),
    borderSide: BorderSide(color: kTextColor),
  );
}

