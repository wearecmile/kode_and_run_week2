import 'package:flutter/cupertino.dart';
import 'package:meet_well/utils/constants/string_constants.dart';

class RegistrationController extends ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  bool isEditDetails = StringConstant.boolFalse;
  bool isRegistrationScreen = StringConstant.boolFalse;

  registrationScreenCall() {
    isEditDetails = StringConstant.boolTrue;
    isRegistrationScreen = StringConstant.boolTrue;
    notifyListeners();
  }

  profileScreenCall() {
    isRegistrationScreen = StringConstant.boolFalse;
    isEditDetails = StringConstant.boolFalse;
    notifyListeners();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    numberController.dispose();
    super.dispose();
  }
}
