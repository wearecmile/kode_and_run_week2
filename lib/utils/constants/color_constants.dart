import 'package:flutter/material.dart';

const primaryColor = Color(0xFF00ADEF);
const secondaryColor = Color(0xFF2A2D3E);
const backgroundColor = Color(0xFF212332);
const whiteColor = Color(0xFFFFFFFF);
const lightBlue = Colors.lightBlueAccent;

const dividerColor = Color(0xFFEEEEEE);
const greycolor =  Color.fromRGBO(217, 217,217,1);

const listTextPrimaryColor = Color(0xff000000);
const listTextSecondaryColor = Color(0xff2c2c2c);
const lightBlueColor = Colors.lightBlueAccent;
const blackColor = Colors.black;
const greyColor = Colors.grey;
const transparentColor = Colors.transparent;
const borderColor = Color(0xFFEAEAEA);
const userEditProfileEmailTextColor = Color(0xFF5A5959);
const dividerColor = Color(0xFFEEEEEE);
const listTextPrimaryColor = Color(0xff000000);
const listTextSecondaryColor = Color(0xff8A8A8D);
const gradientColorPink = Color(0xFFE900FF);
const gradientColorBlue = Color(0xFF16E8FF);
const loginTextFieldBorderColor = Color(0x33FFFFFF);
const dropdownBackgroundColor = Color(0xFF424858);
const circleBackgroundColor = Color(0xFF141C2F);
const twoFactorAuthenticatrionTextColor = Color(0x58FFFFFF);
const editProfileDividerColor = Color(0x00FFFFFF);
const whiteColorForProfileEmail = Color(0x99FFFFFF);
const whiteColorForProfile = Color(0x80FFFFFF);
const whiteColorForProfileText = Color(0x85FFFFFF);
const greyColorSplashScreenLogo = Color(0xFF212121);
const purpleColor = Colors.purple;
const blueAccentColor = Colors.blueAccent;
const gradientDarkBlue = Color(0xFF355A76);
const gradientBlack = Color(0xFF222124);
const bottomBarBackgroundColor = Color(0x99000000);
const postTitleTextColor = whiteColor;
const postSubTitleTextColor = listTextSecondaryColor;
const textBackGroundContainer = Color(0xff3a3a3a);

//home Bottom sheet
const bottomSheetStartColor = gradientDarkBlue;
const bottomSheetEndColor = Color(0xFF211148);
const storyBgEndColor = Color(0x8c2727);
const chatScreenBackgroundColor = Color(0x171c31);
const chatScreenSecondBackgroundColor = Color(0x1c1434);
const cardColor = Color(0xFF13161A);
const backgroudColor = Color(0xFFECEFF1);

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
