import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/constants/color_constants.dart';
import '../../../utils/constants/enum_constants.dart';
import '../../../utils/constants/number_constants.dart';
import '../../../utils/constants/string_constants.dart';
import '../../../utils/constants/util.dart';
import '../../../utils/widgets/custom_textfield.dart';
import '../controller/registration_controller.dart';

class RegistrationScreen extends StatelessWidget {
   RegistrationScreen({super.key});
  RegistrationController? registrationController;

  @override
  Widget build(BuildContext context) {
    registrationController = Provider.of<RegistrationController>(context,
        listen: StringConstant.boolFalse);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(StringConstant.textAddMemberDetail),
        actions: [
          InkWell(
            onTap: () {},
            child: const Text(
              StringConstant.textEdit,
              style: TextStyle(
                  fontSize: NumberConstant.doubleTwenty, color: Colors.blue),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const SizedBox(
            height: NumberConstant.doubleTen,
          ),
          const CircleAvatar(
            radius: NumberConstant.doubleEighty,
            backgroundImage: AssetImage("assets/png/meetwell_logo.png"),
            child: Stack(children: [
              Align(
                alignment: Alignment.bottomRight,
                child: CircleAvatar(
                  radius: NumberConstant.doubleTwenty,
                  backgroundColor: Colors.black26,
                  child: Icon(Icons.edit),
                ),
              ),
            ]),
          ),
          const SizedBox(
            height: NumberConstant.doubleTwelve,
          ),
          Padding(
            padding: const EdgeInsets.all(NumberConstant.doubleEight),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                WidgetEditTextField(
                  textFieldHint: StringConstant.textFullName,
                  textInputType: TextInputType.text,
                  controller: registrationController?.nameController,
                  onSubmitField: () {},
                    inputFormatter: formValidationMethod(ValidationParamsEnum.name.name),
                ),
                WidgetEditTextField(
                  textFieldHint: StringConstant.textEmail,
                  textInputType: TextInputType.emailAddress,
                  controller: registrationController?.emailController,
                  onSubmitField: () {},
                  inputFormatter: formValidationMethod(ValidationParamsEnum.email.name),
                ),
                WidgetEditTextField(
                  textFieldHint: StringConstant.textPhoneNumber,
                  textInputType: TextInputType.phone,
                  controller: registrationController?.numberController,
                  onSubmitField: () {},
                  inputFormatter: formValidationMethod(ValidationParamsEnum.phoneno.name),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height *
                NumberConstant.doublePointOne,
          ),
          ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  elevation: NumberConstant.doubleZero,
                  backgroundColor: buttonColor,
                  padding: const EdgeInsets.symmetric(
                      vertical: NumberConstant.doubleThirteen,
                      horizontal: NumberConstant.doubleTwentyFive),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(NumberConstant.doubleThirty),
                  )),
              child: const Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: NumberConstant.doubleEighty),
                child: Text(
                  StringConstant.textSubmit,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )),
        ]),
      ),
    );
  }
}
