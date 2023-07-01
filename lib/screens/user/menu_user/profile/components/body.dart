import 'package:flutter/material.dart';
import 'package:liberty/models/user_manager.dart';
import 'package:provider/provider.dart';
import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Consumer<UserManager>(builder: (_, userManager, __) {
          return Column(
            children: [
              ProfilePic(),
              SizedBox(height: 20),
              ProfileMenu(
                text: "Minha conta",
                icon: "assets/icons/User Icon.svg",
                press: () => {},
              ),
              ProfileMenu(
                text: "Notificações",
                icon: "assets/icons/Bell.svg",
                press: () {},
              ),
              ProfileMenu(
                text: "Configurações",
                icon: "assets/icons/Settings.svg",
                press: () {},
              ),
              ProfileMenu(
                text: "Ajuda",
                icon: "assets/icons/Question mark.svg",
                press: () {},
              ),
              ProfileMenu(
                text: "Log Out",
                icon: "assets/icons/Log out.svg",
                press: () {
                  if (userManager.isLoggedIn) {
                    userManager.signOut();
                    //print('deslogado');
                  }
                  Navigator.pushNamedAndRemoveUntil(
                      context, "/SignInScreen", (_) => false);
                },
              ),
            ],
          );
        }));
  }
}
