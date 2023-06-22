import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_me/common/extention/custom_theme_extentionumuz.dart';
import 'package:whatsapp_me/common/widgets/CustomIconButton.dart';
import 'package:whatsapp_me/feature/auth/controller/auth_controller.dart';
import 'package:whatsapp_me/feature/auth/repository/auth_repository.dart';
import 'package:whatsapp_me/feature/auth/widgets/customTextField.dart';

class VerificationPage extends ConsumerWidget {
  const VerificationPage({super.key, required this.smsCodeId, required this.phoneNumber});
  final String smsCodeId;
  final String phoneNumber;

  void verifySmsCode(BuildContext context, WidgetRef ref, String smsCode) {
    ref.read(authControllerProvider).verifySmsCode(
          context: context,
          smsCodeId: smsCodeId,
          smsCode: smsCode,
          mounted: true,
        );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        title: Text(
          'Verify your number',
          style: TextStyle(color: context.theme.circleImageColor),
        ),
        centerTitle: true,
        actions: [
          CustomIconButton(
            onPressed: () {},
            icon: Icons.more_vert,
            iconColor: context.theme.greyColor,
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(style: TextStyle(color: context.theme.greyColor, height: 1.5), children: [
                    TextSpan(text: 'You have tried to register +905428397371. Before requesting an SMS or call with your code. '),
                    TextSpan(text: 'Wrong number ?', style: TextStyle(color: context.theme.blueColor)),
                  ])),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 80),
              child: CustomTextField(
                hintText: '-  -  -     -  -  -',
                FontSize: 30,
                AutoFocus: true,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  if (value.length == 6) {
                    return verifySmsCode(context, ref, value);
                  }
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Enter 6-digit code',
              style: TextStyle(color: context.theme.greyColor),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Icon(
                  Icons.message,
                  color: context.theme.greyColor,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Resend SMS',
                  style: TextStyle(color: context.theme.greyColor),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              color: context.theme.blueColor!.withOpacity(0.2),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Icon(
                  Icons.phone,
                  color: context.theme.greyColor,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Call Me',
                  style: TextStyle(color: context.theme.greyColor),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
