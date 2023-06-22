import 'package:flutter/material.dart';
import 'package:whatsapp_me/common/extention/custom_theme_extentionumuz.dart';
import 'package:whatsapp_me/common/routes/routes.dart';

import 'package:whatsapp_me/common/widgets/CustumElevatedButton.dart';
import 'package:whatsapp_me/feature/auth/pages/LoginPage.dart';
import 'package:whatsapp_me/feature/welcome/widgets/PrivacyAndTerms.dart';
import 'package:whatsapp_me/feature/welcome/widgets/languageButton.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  navigateToLoginPage(context) {
    Navigator.of(context).pushNamedAndRemoveUntil(
      Routes.login,
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 50,
          ),
          child: Image.asset(
            'assets/images/circle.png',
            color: context.theme.circleImageColor,
          ),
        )),
        Expanded(
            child: Column(
          children: [
            Text(
              'Welcome to WhatsApp',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            PrivacyAndTerms(),
            CustomElevatedButton(
              text: 'AGREE AND CONTİNUE',
              onPress: () => navigateToLoginPage(context),
            ),
            SizedBox(
              height: 50,
            ),
            LanguageButton()
          ],
        )),
      ],
    ));
  }
}
