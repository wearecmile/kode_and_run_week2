import 'package:flutter/services.dart';
import 'package:meet_well/utils/constants/string_constants.dart';

import 'enum_constants.dart';

List<TextInputFormatter>? formValidationMethod(string) {
  if (string == ValidationParamsEnum.pincode.name) {
    return [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))];
  } else if (string == ValidationParamsEnum.name.name) {
    return [FilteringTextInputFormatter.allow(RegExp(r'[A-Za-z ]'))];
  } else if (string == ValidationParamsEnum.state.name) {
    return [FilteringTextInputFormatter.allow(RegExp(r'[A-Za-z]'))];
  } else if (string == ValidationParamsEnum.city.name) {
    return [FilteringTextInputFormatter.allow(RegExp(r'[A-Za-z]'))];
  } else if (string == ValidationParamsEnum.address.name) {
    return [FilteringTextInputFormatter.allow(RegExp(r'[A-Za-z ,0-9]'))];
  } else if (string == ValidationParamsEnum.email.name) {
    return [FilteringTextInputFormatter.allow(RegExp(r'[A-Za-z0-9@._]'))];
  } else if (string == ValidationParamsEnum.phoneno.name) {
    return [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))];
  }
  return null;
}

String? isEmailValid(String email) {
  if (email.isEmpty) {
    return StringConstant.textErrorEmail;
  }
  final emailRegex = RegExp(
      r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$');
  if (!emailRegex.hasMatch(email)) {
    return StringConstant.textErrorEmail;
  }
  return null;
}
