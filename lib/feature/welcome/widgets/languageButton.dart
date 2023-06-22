import 'package:flutter/material.dart';
import 'package:whatsapp_me/common/extention/custom_theme_extentionumuz.dart';
import 'package:whatsapp_me/common/utils/Coloors.dart';
import 'package:whatsapp_me/common/widgets/CustomIconButton.dart';

class LanguageButton extends StatelessWidget {
  const LanguageButton({Key? key}) : super(key: key);

  showBottomSheet(context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 4,
                width: 30,
                decoration: BoxDecoration(color: context.theme.greyColor!.withOpacity(0.4)),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  CustomIconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icons.close_outlined,
                    iconColor: Coloors.greyDark,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'App Language',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Coloors.greyDark),
                  )
                ],
              ),
              SizedBox(
                width: 10,
              ),
              Divider(
                color: context.theme.greyColor!.withOpacity(0.3),
                thickness: .5,
              ),
              RadioListTile(
                value: true,
                groupValue: false,
                onChanged: (value) => Navigator.of(context).pop(),
                activeColor: Coloors.greenDark,
                title: Text(
                  'English',
                  style: TextStyle(color: Coloors.greyDark),
                ),
                subtitle: Text('phone"s language', style: TextStyle(color: Coloors.greyDark)),
              ),
              RadioListTile(
                value: true,
                groupValue: false,
                onChanged: (value) => Navigator.of(context).pop(),
                activeColor: Coloors.greenDark,
                title: Text(
                  'Kürdî',
                  style: TextStyle(color: Coloors.greyDark),
                ),
                subtitle: Text('Kurdi', style: TextStyle(color: Coloors.greyDark)),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.theme.langButtonColor,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        highlightColor: context.theme.langButtonHighColor,
        onTap: () => showBottomSheet(context),
        borderRadius: BorderRadius.circular(20),
        splashFactory: NoSplash.splashFactory,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.language,
                  color: Coloors.greenDark,
                ),
                Text(
                  ' English ',
                  style: TextStyle(color: Coloors.greenDark),
                ),
                Icon(
                  Icons.keyboard_arrow_down,
                  color: Coloors.greenDark,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
