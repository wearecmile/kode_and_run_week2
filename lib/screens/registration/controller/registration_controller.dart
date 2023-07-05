import 'package:flutter/cupertino.dart';

class RegistrationController extends ChangeNotifier{
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController numberController = TextEditingController();


@override
  void dispose() {
  nameController.dispose();
  emailController.dispose();
  numberController.dispose();
  super.dispose();
  }
}