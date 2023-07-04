import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meet_well/screens/registration/controller/registration_controller.dart';
import 'package:meet_well/utils/constants/number_constants.dart';
import 'package:meet_well/utils/constants/string_constants.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:meet_well/utils/constants/style_constants.dart';
import 'package:provider/provider.dart';
import 'package:meet_well/utils/route/route.dart' as routes;
import '../../../utils/constants/color_constants.dart';
import '../../../utils/constants/enum_constants.dart';
import '../../../utils/constants/util.dart';
import '../controller/login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginController? numberProvider;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      numberProvider = Provider.of<LoginController>(context,
          listen: StringConstant.boolFalse);
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.addPostFrameCallback((_){
      numberProvider?.phoneNumberController.clear();
    });
    // TODO: implement dispose
    super.dispose();
  }
  final GlobalKey<FormState> _phoneNumberValidation = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(children: [
              Card(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(NumberConstant.doubleTen),
                    bottomRight: Radius.circular(NumberConstant.doubleTen),
                  ),
                ),
                margin: EdgeInsets.zero,
                color: Colors.white70,
                child: Container(
                  decoration: const BoxDecoration(color: Colors.transparent),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: NumberConstant.doubleFifty,
                              bottom: NumberConstant.doubleTwenty),
                          child: Center(
                              child: SvgPicture.asset(
                                  StringConstant.icMeetWellLogo)),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            left: NumberConstant.doubleTwenty,
                          ),
                          child: Text(StringConstant.textLogin,
                              style: TextStyle(
                                  fontSize: NumberConstant.doubleForty,
                                  fontWeight: FontWeight.bold)),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                              left: NumberConstant.doubleTwenty,
                              bottom: NumberConstant.doubleThirty),
                          child: Text(StringConstant.textThePlatformOfMeeting,
                              style: TextStyle(fontWeight: FontWeight.w400)),
                        ),
                      ]),
                ),
              ),
              Column(children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height *
                      NumberConstant.doublePointZeroSeven,
                ),
                Center(
                  child: Text(StringConstant.textEnterYourMobile,
                      style: AppStyle.enterMobileNumber()),
                ),
                Center(
                  child: Text(StringConstant.textNumber,
                      style: AppStyle.enterMobileNumber()),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height *
                      NumberConstant.doublePointZeroZeroNine,
                ),
                Center(
                  child: Text(StringConstant.textWeWillSendYouAVerification,
                      style: AppStyle.verificationTextStyle()),
                ),
                Center(
                  child: Text(StringConstant.textCode,
                      style: AppStyle.verificationTextStyle()),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height *
                      NumberConstant.doublePointZeroEight,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: NumberConstant.doubleTwenty),
                  child: Form(
                    key: _phoneNumberValidation,
                    child: IntlPhoneField(
                      inputFormatters: formValidationMethod(
                          ValidationParamsEnum.phoneno.name),
                      flagsButtonPadding: const EdgeInsets.only(
                          top: NumberConstant.doubleEighteen,
                          bottom: NumberConstant.doubleEighteen),
                      controller: numberProvider?.phoneNumberController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding:
                            EdgeInsets.all(NumberConstant.doubleEight),
                        fillColor: Colors.black12,
                        filled: StringConstant.boolTrue,
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        labelText: StringConstant.textPhoneNumber,
                      ),
                      initialCountryCode: StringConstant.textCountry,
                      onChanged: (phone) {
                        setState(() {
                          numberProvider?.countryCode = phone.countryCode;
                          numberProvider?.number = phone.number;
                          if (phone.number.length == NumberConstant.doubleTen) {
                            FocusScope.of(context).unfocus();
                          }
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height *
                      NumberConstant.doubleZeroPointOne,
                ),
                Center(
                  child: ElevatedButton(
                      onPressed: () {
                        if (_phoneNumberValidation.currentState?.validate() ??
                            StringConstant.boolFalse) {
                          if (numberProvider?.countryCode ==
                              StringConstant.textCountryCode) {
                            Navigator.pushNamed(context, routes.dashboard);
                          }
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
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height *
                      NumberConstant.doublePointSixteen,
                ),
                InkWell(
                  onTap: () {},
                  child: const Text(
                    StringConstant.textPrivacyTermsConditions,
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: NumberConstant.doubleFifteen,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ]),
            ]),
          ),
        ),
      );

  }
}
