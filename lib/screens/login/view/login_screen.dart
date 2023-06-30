import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meet_well/utils/constants/number_constants.dart';
import 'package:meet_well/utils/constants/string_constants.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';
import 'package:meet_well/utils/route/route.dart' as routes;
import '../controller/login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  NumberProvider? numberProvider;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      numberProvider = Provider.of<NumberProvider>(context, listen: false);
    });
  }

  final GlobalKey<FormState> _phoneNumberValidation = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
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
                                top: NumberConstant.doubleThirty,
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
                  const Center(
                    child: Text(StringConstant.textEnterYourMobile,
                        style: TextStyle(
                            fontSize: NumberConstant.doubleThirty,
                            fontWeight: FontWeight.bold)),
                  ),
                  const Center(
                    child: Text(StringConstant.textNumber,
                        style: TextStyle(
                            fontSize: NumberConstant.doubleThirty,
                            fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height *
                        NumberConstant.doublePointZeroZeroNine,
                  ),
                  const Center(
                    child: Text(StringConstant.textWeWillSendYouAVerification,
                        style: TextStyle(fontWeight: FontWeight.w500)),
                  ),
                  const Center(
                    child: Text(StringConstant.textCode,
                        style: TextStyle(fontWeight: FontWeight.w500)),
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
                        controller: numberProvider?.phoneNumberController,
                        decoration: const InputDecoration(
                          fillColor: Colors.black12,
                          filled: true,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          labelText: StringConstant.textPhoneNumber,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(),
                          ),
                        ),
                        initialCountryCode: StringConstant.textCountry,
                        onChanged: (phone) {
                          setState(() {
                            numberProvider?.countryCode = phone.countryCode;
                            numberProvider?.number = phone.number;
                            if (phone.number.length ==
                                NumberConstant.doubleTen) {
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
                          if (_phoneNumberValidation.currentState!.validate()) {
                            if (numberProvider?.countryCode ==
                                StringConstant.textCountryCode) {
                              Navigator.pushNamed(context, routes.dashboard);
                            }
                          }
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateColor.resolveWith(
                                (states) => Colors.blue.shade50)),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: NumberConstant.doubleEighty),
                          child: Text(
                            StringConstant.textSubmit,
                            style: TextStyle(color: Colors.black),
                          ),
                        )),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height *
                        NumberConstant.doublePointOne,
                  ),
                  InkWell(
                    onTap: () {},
                    child: const Text(
                      StringConstant.textPrivacyTermsConditions,
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.blue,
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
