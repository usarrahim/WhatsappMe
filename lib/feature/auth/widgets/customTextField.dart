import 'package:flutter/material.dart';
import 'package:whatsapp_me/common/extention/custom_theme_extentionumuz.dart';
import 'package:whatsapp_me/common/utils/Coloors.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    this.controller,
    this.hintText,
    this.readOnly,
    this.textAlign,
    this.keyboardType,
    this.prefixText,
    this.onTop,
    this.suffixIcon,
    this.onChanged,
    this.FontSize,
    this.AutoFocus,
  });
  final TextEditingController? controller;
  final String? hintText;
  final bool? readOnly;
  final TextAlign? textAlign;
  final TextInputType? keyboardType;
  final String? prefixText;
  final VoidCallback? onTop;
  final Widget? suffixIcon;
  final Function(String)? onChanged;
  final double? FontSize;
  final bool? AutoFocus;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: AutoFocus ?? false,
      style: TextStyle(
        color: context.theme.greyColor,
        fontSize: FontSize ?? 22,
      ),
      onTap: onTop,
      readOnly: readOnly ?? false,
      controller: controller,
      textAlign: textAlign ?? TextAlign.center,
      keyboardType: readOnly == null ? keyboardType : null,
      onChanged: onChanged,
      decoration: InputDecoration(
        isDense: true,
        prefixText: prefixText,
        suffix: suffixIcon,
        hintText: hintText,
        hintStyle: TextStyle(
          color: context.theme.greyColor,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Coloors.greenDark),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Coloors.greenDark, width: 2),
        ),
      ),
    );
  }
}
