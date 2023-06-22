import 'package:flutter/material.dart';
import 'package:whatsapp_me/common/extention/custom_theme_extentionumuz.dart';

class PrivacyAndTerms extends StatelessWidget {
  const PrivacyAndTerms({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: 'Read our',
          style: TextStyle(color: context.theme.greyColor),
          children: [
            TextSpan(text: 'Privacy Polisy', style: TextStyle(color: context.theme.blueColor)),
            TextSpan(text: 'Tap "Agree and continue" to accept the'),
            TextSpan(text: 'Terms of Services.', style: TextStyle(color: context.theme.blueColor))
          ],
        ),
      ),
    );
  }
}
