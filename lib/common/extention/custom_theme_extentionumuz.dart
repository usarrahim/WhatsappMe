import 'package:flutter/material.dart';
import 'package:whatsapp_me/common/utils/Coloors.dart';

extension ExtendedTheme on BuildContext {
  CustomThemeExtensionumuz get theme {
    return Theme.of(this).extension<CustomThemeExtensionumuz>()!;
  }
}

class CustomThemeExtensionumuz extends ThemeExtension<CustomThemeExtensionumuz> {
  final Color? circleImageColor;
  final Color? greyColor;
  final Color? blueColor;
  final Color? langButtonColor;
  final Color? langButtonHighColor;
  final Color? authAppbarTextColor;
  final Color? photoIconBgColor;
  final Color? photoIconColor;

  CustomThemeExtensionumuz(
      {this.photoIconBgColor,
      this.photoIconColor,
      this.authAppbarTextColor,
      this.circleImageColor,
      this.greyColor,
      this.blueColor,
      this.langButtonColor,
      this.langButtonHighColor});

  static CustomThemeExtensionumuz lightMode = CustomThemeExtensionumuz(
      photoIconBgColor: Color(0xFFF0F2F3),
      photoIconColor: Color(0xFF9DAAB3),
      authAppbarTextColor: Coloors.greenLight,
      circleImageColor: Coloors.greenLight,
      greyColor: Coloors.greyLight,
      blueColor: Coloors.blueLight,
      langButtonColor: Color(0x0ff7f8fa),
      langButtonHighColor: Color(0xFFE8E8ED));
  static CustomThemeExtensionumuz darkMode = CustomThemeExtensionumuz(
      authAppbarTextColor: Color(0xFFE9EDEF),
      circleImageColor: Coloors.greenDark,
      greyColor: Coloors.greyDark,
      photoIconBgColor: Color(0xFF283339),
      photoIconColor: Color(0xFF61717B),
      blueColor: Coloors.blueDark,
      langButtonColor: Color(0x0ff7f8fa),
      langButtonHighColor: Color(0xFFE8E8ED));

  @override
  ThemeExtension<CustomThemeExtensionumuz> copyWith({
    Color? photoIconBgColor,
    Color? photoIconColor,
    Color? circleImageColor,
    Color? greyColor,
    Color? blueColor,
    Color? langButtonColor,
    Color? langButtonHighColor,
    Color? authAppbarTextColor,
  }) {
    // TODO: implement copyWith

    return CustomThemeExtensionumuz(
        authAppbarTextColor: authAppbarTextColor ?? this.authAppbarTextColor,
        circleImageColor: circleImageColor ?? this.circleImageColor,
        greyColor: greyColor ?? this.greyColor,
        blueColor: blueColor ?? this.blueColor,
        photoIconBgColor: photoIconBgColor ?? this.photoIconBgColor,
        photoIconColor: photoIconColor ?? this.photoIconColor,
        langButtonColor: langButtonColor ?? this.langButtonColor,
        langButtonHighColor: langButtonHighColor ?? this.langButtonHighColor);
  }

  @override
  ThemeExtension<CustomThemeExtensionumuz> lerp(covariant ThemeExtension<CustomThemeExtensionumuz>? other, double t) {
    // TODO: implement lerp
    if (other is! CustomThemeExtensionumuz) return this;
    return CustomThemeExtensionumuz(
      photoIconColor: Color.lerp(photoIconColor, other.photoIconColor, t),
      photoIconBgColor: Color.lerp(photoIconBgColor, other.photoIconBgColor, t),
      authAppbarTextColor: Color.lerp(authAppbarTextColor, other.authAppbarTextColor, t),
      circleImageColor: Color.lerp(circleImageColor, other.circleImageColor, t),
      blueColor: Color.lerp(blueColor, other.blueColor, t),
      greyColor: Color.lerp(greyColor, other.greyColor, t),
      langButtonColor: Color.lerp(langButtonColor, other.langButtonColor, t),
      langButtonHighColor: Color.lerp(langButtonHighColor, other.langButtonHighColor, t),
    );
  }
}
