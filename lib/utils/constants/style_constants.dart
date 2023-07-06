import 'package:flutter/material.dart';

import 'color_constants.dart';
import 'number_constants.dart';

class AppStyle{

static enterMobileNumber(){
 return const TextStyle(
  fontSize: NumberConstant.doubleThirty,
  fontWeight: FontWeight.bold);
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
  static loginBtnStyle() {
    return const TextStyle(
        fontSize: NumberConstant.doubleForty, fontWeight: FontWeight.bold);
  }

  static loginScreenSubHeading() {
    return const TextStyle(fontWeight: FontWeight.w400);
  }

  static textSchedule() {
   return  const TextStyle(
      fontSize: NumberConstant.doubleSixteen,
    );
  }
  static buttonTextStyle() {
    return const TextStyle(
      color: blackColor,
      fontWeight: FontWeight.bold,
    );
  }

  static appBarTitle () {
   return const TextStyle(color: listTextPrimaryColor,
      fontSize: NumberConstant.doubleThirty,
      fontWeight: FontWeight.bold,
    );
  }

  static textFormFieldLabel (){
    return const TextStyle(
      color: buttonColor ,
    );
  }

  static textFormField (){
    return const TextStyle(
        color: listTextPrimaryColor,
        fontSize: NumberConstant.doubleFourteen,
        fontWeight: FontWeight.w400);
  }
  static termsAndConditionsTextStyle() {
    return const TextStyle(
      color: Colors.blueAccent,
      fontSize: NumberConstant.doubleFifteen,
      fontWeight: FontWeight.bold,
    );
  }
}