import 'package:flutter/material.dart';

class NumberProvider extends ChangeNotifier{
  TextEditingController phoneNumberController = TextEditingController();
  String? number;
  numberProvider(){
    number = phoneNumberController.text;
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    phoneNumberController.dispose();
  }
}