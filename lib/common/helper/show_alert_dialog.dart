import 'package:flutter/material.dart';
import 'package:whatsapp_me/common/extention/custom_theme_extentionumuz.dart';

showAlertDialog({required BuildContext context, required String message, required String btnText}) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: Text(
          message,
          style: TextStyle(color: context.theme.greyColor, fontSize: 15),
        ),
        contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 0),
        actions: [
          TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                btnText,
                style: TextStyle(color: context.theme.circleImageColor),
              ))
        ],
      );
    },
  );
}
