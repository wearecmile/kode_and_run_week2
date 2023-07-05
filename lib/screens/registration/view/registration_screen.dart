import 'package:flutter/material.dart';
import 'package:meet_well/utils/constants/style_constants.dart';
import 'package:provider/provider.dart';

import '../../../utils/constants/color_constants.dart';
import '../../../utils/constants/enum_constants.dart';
import '../../../utils/constants/number_constants.dart';
import '../../../utils/constants/string_constants.dart';
import '../../../utils/constants/util.dart';
import '../../../utils/widgets/custom_text_field.dart';
import '../../login/controller/login_controller.dart';
import '../controller/registration_controller.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  RegistrationController? registrationController;
  LoginController? loginController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    registrationController = Provider.of<RegistrationController>(context,
        listen: StringConstant.boolFalse);
    loginController =
        Provider.of<LoginController>(context, listen: StringConstant.boolFalse);
    super.initState();

    ///(setState() or markNeedsBuild() called during build.) facing this error so put on WidgetsBinding.instance.addPostFrameCallback
    WidgetsBinding.instance.addPostFrameCallback((_) {
      registrationController?.numberController.text =
          loginController?.number ?? StringConstant.textEmpty;
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
        backgroundColor: transparentColor,
        title: const Text(StringConstant.textAddMemberDetail),

        ///todo For User Edit Implementation Later
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
            backgroundImage: AssetImage(StringConstant.icMeetWellLogoPng),
            child: Stack(children: [
              Align(
                alignment: Alignment.bottomRight,
                child: CircleAvatar(
                  radius: NumberConstant.doubleTwenty,
                  backgroundColor: blackColor26,
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
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: NumberConstant.doubleTen),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomTextField(
                      maxLength: NumberConstant.intFifty,
                      textFieldHint: StringConstant.textFullName,
                      textInputType: TextInputType.text,
                      controller: registrationController?.nameController,
                      inputFormatter:
                          formValidationMethod(ValidationParamsEnum.name.name),
                      validator: (value) {
                        if (value?.isEmpty ?? StringConstant.boolFalse) {
                          return StringConstant.textErrorFullName;
                        }
                        return null;
                      },
                      onChanged: () {
                        setState(() {
                          _formKey.currentState?.validate();
                        });
                      },
                    ),
                    CustomTextField(
                      maxLength: NumberConstant.intFifty,
                      textFieldHint: StringConstant.textEmail,
                      textInputType: TextInputType.emailAddress,
                      controller: registrationController?.emailController,
                      inputFormatter:
                          formValidationMethod(ValidationParamsEnum.email.name),
                      validator: (value) {
                        if (value?.isEmpty ?? StringConstant.boolFalse) {
                          return StringConstant.textErrorEmail;
                        }
                        return null;
                      },
                      onChanged: () {
                        setState(() {
                          _formKey.currentState?.validate();
                        });
                      },
                    ),
                    CustomTextField(
                      maxLength: NumberConstant.intTen,
                      isEnabled: StringConstant.boolFalse,
                      textFieldHint: StringConstant.textPhoneNumber,
                      textInputType: TextInputType.phone,
                      controller: registrationController?.numberController,
                      inputFormatter: formValidationMethod(
                          ValidationParamsEnum.phoneno.name),
                      validator: (String? value) {
                        if (value?.length != NumberConstant.intTen) {
                          return StringConstant.textErrorPhoneNumber;
                        }
                        return null;
                      },
                      onChanged: () {
                        setState(() {
                          _formKey.currentState?.validate();
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height *
                NumberConstant.doublePointOne,
          ),
          ElevatedButton(
              onPressed: () {
                ///Todo
                if (_formKey.currentState?.validate() ??
                    StringConstant.boolFalse) {

                }
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
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: NumberConstant.doubleEighty),
                child: Text(
                  StringConstant.textSubmit,
                  style: AppStyle.buttonTextStyle(),
                ),
              )),
        ]),
      ),
    );
  }
}
