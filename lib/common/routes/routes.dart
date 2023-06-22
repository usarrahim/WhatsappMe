import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_me/feature/auth/pages/LoginPage.dart';
import 'package:whatsapp_me/feature/auth/pages/UserInfoPage.dart';
import 'package:whatsapp_me/feature/auth/pages/verificationPage.dart';
import 'package:whatsapp_me/feature/home/pages/home_page.dart';
import 'package:whatsapp_me/feature/welcome/pages/welcome_page.dart';

class Routes {
  static const String welcome = 'welcome';
  static const String login = 'login';
  static const String verification = 'verification';
  static const String userInfo = 'user-info';
  static const String home = 'home';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case welcome:
        return MaterialPageRoute(
          builder: (context) => WelcomePage(),
        );
      case login:
        return MaterialPageRoute(
          builder: (context) => LoginPage(),
        );
      case verification:
        final Map args = settings.arguments as Map;
        return MaterialPageRoute(
          builder: (context) => VerificationPage(
            smsCodeId: args['smscodeId'],
            phoneNumber: args['phoneNumber'],
          ),
        );
      case userInfo:
        return MaterialPageRoute(
          builder: (context) => UserInfoPage(),
        );

      case home:
        return MaterialPageRoute(
          builder: (context) => HomePage(),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text('No Page Route Provided.'),
            ),
          ),
        );
    }
  }
}
