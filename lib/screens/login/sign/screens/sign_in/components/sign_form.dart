import 'package:flutter/material.dart';
import 'package:liberty/models/user.dart';
import 'package:liberty/models/user_manager.dart';
import 'package:liberty/screens/login/sign/components/custom_surfix_icon.dart';
import 'package:liberty/screens/login/sign/components/form_error.dart';
import 'package:liberty/screens/user/home_user/home_user_screen.dart';
import '../../../components/default_button.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import 'package:provider/provider.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

final TextEditingController emailController = TextEditingController();
final TextEditingController passController = TextEditingController();

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();

  String email;
  String password;

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
      child: Consumer<UserManager>(
        builder: (_, userManager, __) {
          return Column(
            children: [
              buildEmailFormField(),
              SizedBox(height: getProportionateScreenHeight(30)),
              buildPasswordFormField(),
              SizedBox(height: getProportionateScreenHeight(30)),
              Row(
                children: [
                  Spacer(),
                  GestureDetector(
                    onTap: () => Navigator.of(context).pushNamed('/ForgotPasswordScreen'),
                    child: Text(
                      "Perdeu a senha?",
                      style: TextStyle(decoration: TextDecoration.underline),
                    ),
                  ),
                ],
              ),
              FormError(errors: errors),
              SizedBox(height: getProportionateScreenHeight(20)),
              DefaultButton(
                text: "Login",
                press: userManager.loading
                    ? null
                    : () {
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();

                          userManager.signIn(
                              user: User(
                                  email: emailController.text,
                                  password: passController.text),
                              onFail: (e) {
                                print(e);

                                Scaffold.of(context).showSnackBar(SnackBar(
                                  content: Text('Falha ao entrar:  $e'),
                                  backgroundColor: Colors.red,
                                ));
                              },
                              onSuccess: () {

                                Navigator.pushNamed(
                                    context, HomeUserScreen.routeName);
                              });
                        }
                      },
              ),
            ],
          );
        },
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      controller: passController,
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        return null;
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
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
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
