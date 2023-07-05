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

  static meetingTitle() {
    return const TextStyle(fontSize: NumberConstant.doubleTwenty);
  }

  static meetingDateTimeLocation() {
    const TextStyle(
      fontSize: NumberConstant.doubleSixteen,
    );
  }

  static displayGroupName() {
    return const TextStyle(
      fontSize: NumberConstant.doubleThirty,
    );
  }

  static errorNoMeeting() {
    return const TextStyle(
        fontSize: NumberConstant.doubleTwenty, color: redColor);
  }

  static textScedule() {
    const TextStyle(
      fontSize: NumberConstant.doubleTwentyFive,
    );
  }
}
