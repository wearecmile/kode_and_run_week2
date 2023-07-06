import 'package:flutter/material.dart';

import 'color_constants.dart';
import 'number_constants.dart';

class AppStyle {
  static enterMobileNumber() {
    return const TextStyle(
        fontSize: NumberConstant.doubleThirty, fontWeight: FontWeight.bold);
  }

  static verificationTextStyle() {
    return const TextStyle(fontWeight: FontWeight.w500);
  }

  static loginBtnStyle() {
    return const TextStyle(
        fontSize: NumberConstant.doubleForty, fontWeight: FontWeight.bold);
  }

  static loginScreenSubHeading() {
    return const TextStyle(fontWeight: FontWeight.w400);
  }

  static buttonTextStyle() {
    return const TextStyle(
      color: blackColor,
      fontWeight: FontWeight.bold,
    );
  }

  static termsAndConditionsTextStyle() {
    return const TextStyle(
      color: Colors.blueAccent,
      fontSize: NumberConstant.doubleFifteen,
      fontWeight: FontWeight.bold,
    );
  }
}
