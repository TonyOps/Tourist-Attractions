import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:liberty/models/product.dart';
import 'package:liberty/models/product_manager_brasil/product_one_brasil.dart';
import 'package:liberty/models/user_manager.dart';
import 'package:liberty/screens/login/sign/constants.dart';
import 'package:liberty/screens/login/sign/screens/forgot_password/forgot_password_screen.dart';
import 'package:liberty/screens/login/sign/screens/sign_in/sign_in_screen.dart';
import 'package:liberty/screens/login/sign/screens/sign_up/sign_up_screen.dart';
import 'package:liberty/screens/login/sign/screens/termo_de_uso.dart';
import 'package:liberty/screens/user/chat_user/chat_screen.dart';
import 'package:liberty/screens/user/home_user/home_user_screen.dart';
import 'package:liberty/screens/user/menu_user/profile/profile_screen.dart';
import 'package:liberty/word/brasil/compras/ComprasUmBrasil.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(DevicePreview(
    builder: (_) => MyApp(),
    enabled: false,
  ));
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserManager(),
          lazy: false,
        ),
        ChangeNotifierProvider(
        create: (_) => ProductOneBrasil(),
        lazy: false,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Liberty',
        theme: ThemeData(
          primaryColor: TonyBackgroundPrimaryColor,
          accentColor: TonyBackgroundSecyndaryColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/SignInScreen':
              return MaterialPageRoute(builder: (_) => SignInScreen());
            case '/HomeUserScreen':
              return MaterialPageRoute(builder: (_) => HomeUserScreen());
            case '/ComprasUmBrasil':
              return MaterialPageRoute(
                  builder: (_) => ComprasUmBrasil(
                        settings.arguments as Product,
                      ));
            case '/ComprasUmBrasil':
              return MaterialPageRoute(

                  settings: settings);
            case '/ChatScreen':
              return MaterialPageRoute(
                  builder: (_) => ChatScreen(), settings: settings
                  );
            case '/ForgotPasswordScreen':
              return MaterialPageRoute(builder: (_) => ForgotPasswordScreen());
            case '/ProfileScreen':
              return MaterialPageRoute(builder: (_) => ProfileScreen());
            case '/SignUpScreen':
              return MaterialPageRoute(builder: (_) => SignUpScreen()
                  );
            case '/TermoDeUso':
              return MaterialPageRoute(builder: (_) => TermoDeUso());
            case '/confirmation':
              return MaterialPageRoute(

                  );
            case '/':
            default:
              return MaterialPageRoute(
                  builder: (_) => SignInScreen(), settings: settings);
          }
        },
      ),
    );
  }
}

