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
      fontSize: NumberConstant.doubleTwenty,
    );
  }
  static errorNoMeeting() {
    return const TextStyle(
        fontSize: NumberConstant.doubleTwenty, color: redColor);
  }

  static textSchedule() {
   return  const TextStyle(
      fontSize: NumberConstant.doubleSixteen,
    );
  }

  static appBarTitle () {
   return const TextStyle(color: listTextPrimaryColor,
      fontSize: NumberConstant.doubleThirty,
      fontWeight: FontWeight.bold,
    );
  }
  static buttonTextStyle (){
    return const TextStyle(
        color: listTextPrimaryColor,
        fontSize: NumberConstant.doubleTwenty,
        fontWeight: FontWeight.w600);
  }


  static textFormFeildLabel (){
    return const TextStyle(
      color: buttonColor ,
    );
  }

  static textFormFeild (){
    return const TextStyle(
        color: listTextPrimaryColor,
        fontSize: NumberConstant.doubleFourteen,
        fontWeight: FontWeight.w400);
  }
}
