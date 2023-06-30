import 'package:flutter/material.dart';

class NumberProvider extends ChangeNotifier {
  TextEditingController phoneNumberController = TextEditingController();
  String? countryCode;
  String? number;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    phoneNumberController.dispose();
  }

}