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
import 'package:meet_well/utils/route/route.dart' as routes;

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
    /// TODO (setState() or markNeedsBuild() called during build.)
    /// TODO facing this error so put on WidgetsBinding.instance.addPostFrameCallback
    WidgetsBinding.instance.addPostFrameCallback((_) {
      registrationController?.numberController.text =
          loginController?.number ?? StringConstant.textEmpty;
      ///testing purpose
      registrationController?.nameController.text =
          ModalRoute.of(context)?.settings.arguments.toString() ?? StringConstant.textEmpty;
      if (ModalRoute.of(context)?.settings.arguments.toString() ==
          routes.login) {
        registrationController?.registrationScreenCall();
      } else {
        registrationController?.profileScreenCall();
      }
    });
  }

  @override
  void dispose() {
    ///TODO (setState() or markNeedsBuild() called during build.) facing this error so put on WidgetsBinding.instance.addPostFrameCallback
    WidgetsBinding.instance.addPostFrameCallback((_) {
      registrationController?.numberController.clear();
      registrationController?.nameController.clear();
      registrationController?.emailController.clear();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var privousRoute = ModalRoute.of(context)?.settings.arguments.toString();
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        titleSpacing: NumberConstant.doubleZero,
        backgroundColor: transparentColor,
        title: (privousRoute == routes.login)
            ? const Text(StringConstant.textAddMemberDetail)
            : const Text(StringConstant.textProfile),

        ///todo For User Edit Implementation Later
        actions: [
          Consumer<RegistrationController>(
            builder: (BuildContext context, value, child) {
              return value.isRegistrationScreen
                  ? Container()
                  : Padding(
                      padding: EdgeInsets.only(
                          right: width * NumberConstant.doublePointZeroThree),
                      child: value.isEditDetails
                          ? InkWell(
                              onTap: () {
                                if (_formKey.currentState?.validate() ??
                                    StringConstant.boolFalse) {
                                  ///TODO
                                  value.isEditDetails =
                                      StringConstant.boolFalse;
                                  value.notifyListeners();
                                }
                              },
                              child: const Text(
                                StringConstant.textUpdate,
                                style: TextStyle(
                                    fontSize: NumberConstant.doubleEighteen,
                                    color: blueColor),
                              ),
                            )
                          : InkWell(
                              onTap: () {
                                value.isEditDetails = StringConstant.boolTrue;
                                value.notifyListeners();
                              },
                              child: const Text(
                                StringConstant.textEdit,
                                style: TextStyle(
                                    fontSize: NumberConstant.doubleTwenty,
                                    color: blueColor),
                              ),
                            ),
                    );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Consumer<RegistrationController>(
          builder: (context, value, child) {
            return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: NumberConstant.doubleTen,
                  ),
                  CircleAvatar(
                    radius: NumberConstant.doubleEighty,
                    ///TODO its dummy for now
                    backgroundImage:
                        const AssetImage(StringConstant.personLogoPng),
                    child: Stack(children: [
                      value.isEditDetails
                          ? Align(
                              alignment: Alignment.bottomRight,
                              child: InkWell(
                                radius: NumberConstant.doubleTen,
                                onTap: () {
                                  ///Todo
                                },
                                child: const CircleAvatar(
                                  radius: NumberConstant.doubleTwenty,
                                  backgroundColor: blackColor26,
                                  child: Icon(Icons.edit),
                                ),
                              ),
                            )
                          : Container(),
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
                              isEnabled: value.isEditDetails,
                              maxLength: NumberConstant.intFifty,
                              textFieldHint: StringConstant.textFullName,
                              textInputType: TextInputType.text,
                              controller:
                                  registrationController?.nameController,
                              inputFormatter: formValidationMethod(
                                  ValidationParamsEnum.name.name),
                              validator: (value) {
                                if (value?.isEmpty ??
                                    StringConstant.boolFalse) {
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
                              isEnabled: value.isEditDetails,
                              maxLength: NumberConstant.intFifty,
                              textFieldHint: StringConstant.textEmail,
                              textInputType: TextInputType.emailAddress,
                              controller:
                                  registrationController?.emailController,
                              inputFormatter: formValidationMethod(
                                  ValidationParamsEnum.email.name),
                              validator: (value) => isEmailValid(value ?? StringConstant.textEmpty),
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
                              controller:
                                  registrationController?.numberController,
                              inputFormatter: formValidationMethod(
                                  ValidationParamsEnum.phoneno.name),
                              validator: (String? value) {
                                if (value?.length != NumberConstant.intTen) {
                                  return StringConstant.textErrorPhoneNumber;
                                }
                                return null;
                              },
                              onChanged: () {},
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
                  !value.isRegistrationScreen
                      ? Container()
                      : ElevatedButton(
                          onPressed: () {
                            ///Todo
                            if (_formKey.currentState?.validate() ??
                                StringConstant.boolFalse) {
                              Navigator.pushReplacementNamed(
                                  context, routes.dashboard);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              elevation: NumberConstant.doubleZero,
                              backgroundColor: buttonColor,
                              padding: const EdgeInsets.symmetric(
                                  vertical: NumberConstant.doubleThirteen,
                                  horizontal: NumberConstant.doubleTwentyFive),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    NumberConstant.doubleThirty),
                              )),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: NumberConstant.doubleEighty),
                            child: Text(
                              StringConstant.textSubmit,
                              style: AppStyle.buttonTextStyle(),
                            ),
                          )),
                ]);
          },
        ),
      ),
    );
  }
}
