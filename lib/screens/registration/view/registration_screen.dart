import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/constants/color_constants.dart';
import '../../../utils/constants/enum_constants.dart';
import '../../../utils/constants/number_constants.dart';
import '../../../utils/constants/string_constants.dart';
import '../../../utils/constants/util.dart';
import '../../../utils/widgets/custom_textfield.dart';
import '../../login/controller/login_controller.dart';
import '../controller/registration_controller.dart';

class RegistrationScreen extends StatefulWidget {
  RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  RegistrationController? registrationController;
  LoginController? loginController;

  @override
  void initState() {
    registrationController = Provider.of<RegistrationController>(context,
        listen: StringConstant.boolFalse);
    loginController =
        Provider.of<LoginController>(context, listen: StringConstant.boolFalse);

    ///mandatory to call for assigning value in InitState in provider
    registrationController?.init();
    super.initState();

    ///(setState() or markNeedsBuild() called during build.) facing this error so put on WidgetsBinding.instance.addPostFrameCallback
    WidgetsBinding.instance.addPostFrameCallback((_) {
      registrationController?.numberController.text =
          loginController?.number ?? "";
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    ///(setState() or markNeedsBuild() called during build.) facing this error so put on WidgetsBinding.instance.addPostFrameCallback
    WidgetsBinding.instance.addPostFrameCallback((_) {
      registrationController?.numberController.clear();
      registrationController?.nameController.clear();
      registrationController?.emailController.clear();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(StringConstant.textAddMemberDetail),
        ///todo For User Edit Implement Later
        // actions: [
        //   InkWell(
        //     onTap: () {},
        //     child: const Text(
        //       StringConstant.textEdit,
        //       style: TextStyle(
        //           fontSize: NumberConstant.doubleTwenty, color: Colors.blue),
        //     ),
        //   ),
        // ],
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const SizedBox(
            height: NumberConstant.doubleTen,
          ),
          const CircleAvatar(
            radius: NumberConstant.doubleEighty,
            ///its dummy for now
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
                  maxLength: NumberConstant.intFifty,
                  textFieldHint: StringConstant.textFullName,
                  textInputType: TextInputType.text,
                  controller: registrationController?.nameController,
                  onSubmitField: () {},
                  inputFormatter:
                      formValidationMethod(ValidationParamsEnum.name.name),
                ),
                WidgetEditTextField(
                  maxLength: NumberConstant.intFifty,
                  textFieldHint: StringConstant.textEmail,
                  textInputType: TextInputType.emailAddress,
                  controller: registrationController?.emailController,
                  onSubmitField: () {},
                  inputFormatter:
                      formValidationMethod(ValidationParamsEnum.email.name),
                ),
                WidgetEditTextField(
                  maxLength: NumberConstant.intTen,
                  textFieldHint: StringConstant.textPhoneNumber,
                  textInputType: TextInputType.phone,
                  controller: registrationController?.numberController,
                  onSubmitField: (value) {
                  },
                  inputFormatter:
                      formValidationMethod(ValidationParamsEnum.phoneno.name),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height *
                NumberConstant.doublePointOne,
          ),
          ElevatedButton(
              onPressed: () {
                ///Todo
              },
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
