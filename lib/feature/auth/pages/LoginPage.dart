import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_me/common/extention/custom_theme_extentionumuz.dart';
import 'package:whatsapp_me/common/helper/show_alert_dialog.dart';
import 'package:whatsapp_me/common/utils/Coloors.dart';
import 'package:whatsapp_me/common/widgets/CustomIconButton.dart';
import 'package:whatsapp_me/common/widgets/CustumElevatedButton.dart';
import 'package:whatsapp_me/feature/auth/controller/auth_controller.dart';
import 'package:whatsapp_me/feature/auth/widgets/customTextField.dart';
import 'package:country_picker/country_picker.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  late TextEditingController countryNameControler;
  late TextEditingController countryCodeControler;
  late TextEditingController phoneNumberControler;

  sendCodeToPhone() {
    final phoneNumber = phoneNumberControler.text;
    final countryName = countryNameControler.text;
    final countryCode = countryCodeControler.text;

    if (phoneNumber.length < 9) {
      return showAlertDialog(context: context, message: 'The number is too short', btnText: 'OK');
    }

    if (phoneNumber.isEmpty) {
      return showAlertDialog(context: context, message: 'Please enter number', btnText: 'OK');
    } else if (phoneNumber.length > 11) {
      return showAlertDialog(context: context, message: 'The number is too long', btnText: 'OK');
    }

    ref.read(authControllerProvider).sendSmsCode(
          context: context,
          phoneNumber: '+$countryCode$phoneNumber',
        );
  }

  showCountryCodePicker() {
    showCountryPicker(
      showPhoneCode: true,
      favorite: ['TR', 'GB'],
      countryListTheme: CountryListThemeData(
          bottomSheetHeight: 600,
          backgroundColor: Theme.of(context).backgroundColor,
          flagSize: 22,
          borderRadius: BorderRadius.circular(20),
          textStyle: TextStyle(color: context.theme.greyColor),
          inputDecoration: InputDecoration(
            labelStyle: TextStyle(
              color: context.theme.greyColor,
            ),
            prefixIcon: Icon(
              Icons.language,
              color: Coloors.greenDark,
            ),
            hintText: 'Search country code or name',
            hintStyle: TextStyle(color: context.theme.greyColor),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: context.theme.greyColor!.withOpacity(0.2)),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Coloors.greenDark),
            ),
          ),
          searchTextStyle: TextStyle(color: context.theme.greyColor)),
      context: context,
      onSelect: (country) {
        countryNameControler.text = country.name;
        countryCodeControler.text = country.phoneCode;
      },
    );
  }

  @override
  void initState() {
    countryNameControler = TextEditingController(text: 'Turkey');
    countryCodeControler = TextEditingController(text: '90');
    phoneNumberControler = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    countryCodeControler.dispose();
    countryNameControler.dispose();
    phoneNumberControler.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        title: Text(
          'Enter your phone number',
          style: TextStyle(color: context.theme.authAppbarTextColor ?? Coloors.greenLight),
        ),
        centerTitle: true,
        actions: [
          CustomIconButton(onPressed: () {}, icon: Icons.more_vert, iconColor: context.theme.greyColor),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: 'WhatsApp will need to verify your phone number.',
                  style: TextStyle(
                    color: context.theme.greyColor,
                    height: 1.5,
                  ),
                  children: [TextSpan(text: "What's my number ?")]),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 50.0,
            ),
            child: CustomTextField(
              controller: countryNameControler,
              onTop: () => showCountryCodePicker(),
              readOnly: true,
              suffixIcon: Icon(
                Icons.arrow_drop_down,
                color: Coloors.greenDark,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Row(
              children: [
                SizedBox(
                  width: 70,
                  child: CustomTextField(
                    prefixText: '+',
                    controller: countryCodeControler,
                    readOnly: true,
                    onTop: () => showCountryCodePicker(),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: CustomTextField(
                  hintText: 'Phone number',
                  controller: phoneNumberControler,
                  textAlign: TextAlign.left,
                  keyboardType: TextInputType.number,
                ))
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Carrier charges may apply',
            style: TextStyle(color: context.theme.greyColor),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomElevatedButton(
        weight: 90,
        onPress: () => sendCodeToPhone(),
        text: 'Next',
      ),
    );
  }
}
