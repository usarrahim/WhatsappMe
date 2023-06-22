import 'package:flutter/material.dart';
import 'package:whatsapp_me/common/extention/custom_theme_extentionumuz.dart';
import 'package:whatsapp_me/common/utils/Coloors.dart';

showLoadingDialog({required BuildContext context, required String message}) async {
  return await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                CircularProgressIndicator(
                  color: Coloors.greenDark,
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: Text(
                  message,
                  style: TextStyle(fontSize: 15, color: context.theme.greyColor, height: 1.5),
                ))
              ],
            )
          ],
        ),
      );
    },
  );
}
