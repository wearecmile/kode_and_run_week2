import 'package:flutter/services.dart';

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
}