import 'package:flutter/material.dart';
import 'package:liberty/models/user.dart';
import 'package:liberty/models/user_manager.dart';
import 'package:liberty/screens/login/sign/components/custom_surfix_icon.dart';
import 'package:liberty/screens/login/sign/components/default_button.dart';
import 'package:liberty/screens/login/sign/components/form_error.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import 'package:provider/provider.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final User user = User();
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  String conform_password;
  bool remember = false;
  final List<String> errors = [];

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Consumer<UserManager>(builder: (_, userManager, __) {
        return Column(
          children: [
            buildFirstNameFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            buildEmailFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            buildPasswordFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            buildConformPassFormField(),
            FormError(errors: errors),
            SizedBox(height: getProportionateScreenHeight(40)),
            DefaultButton(
              text: "Inscrever-se",
              press: userManager.loading? null : () {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();

                  if (user.password != user.confirmPassword) {
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: const Text('Senhas não coincidem!'),
                      backgroundColor: Colors.red,
                    ));
                    return;
                  }
                  UserManager().signUp(
                      user: user,
                      onSuccess: () {
                        Navigator.of(context)
                            .pushNamed('/SignInScreen');
                      },
                      onFail: (e) {
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text('Falha ao cadastrar: $e'),
                          backgroundColor: Colors.red,
                        ));
                      });
                }
              },
            ),
          ],
        );
      }),
    );
  }

  TextFormField buildFirstNameFormField() {
    return TextFormField(
      onSaved: (newValue) => user.name = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNamelNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kNamelNullError);
          return "";
        }
        if(value.trim().split(' ').length <= 1){
          addError(error: kNomeImcompletoError);
          return "";
        }

        if (value.length <= 6){
          addError(error: kNomeImcompletoError);
          return "";
        }

        if (value.length >= 23){
          addError(error: kFalseNomeBigError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Nome completo",
        hintText: "Insira o seu nome completo",
        enabledBorder: outlineInputBorder(),
        focusedBorder: outlineInputBorder(),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

   TextFormField buildLastNameFormField() {
    return TextFormField(
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kLastNamelNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kLastNamelNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Sobrenome",
        hintText: "Insira o seu sobrenome",
        enabledBorder: outlineInputBorder(),
        focusedBorder: outlineInputBorder(),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  TextFormField buildConformPassFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => user.confirmPassword = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.isNotEmpty && user.password == user.confirmPassword) {
          removeError(error: kMatchPassError);
        }
        user.confirmPassword = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if ((user.password != value)) {
          addError(error: kMatchPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Confirme sua senha",
        hintText: "Re-insira sua senha",
        enabledBorder: outlineInputBorder(),
        focusedBorder: outlineInputBorder(),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => user.password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        user.password = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Senha",
        hintText: "Insira sua senha",
        enabledBorder: outlineInputBorder(),
        focusedBorder: outlineInputBorder(),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => user.email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Insira seu email",
        enabledBorder: outlineInputBorder(),
        focusedBorder: outlineInputBorder(),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }
}
