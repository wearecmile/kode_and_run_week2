import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meet_well/utils/constants/number_constants.dart';
import 'package:meet_well/utils/constants/string_constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneNumberController = TextEditingController();
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
                    // height: MediaQuery.of(context).size.height,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: NumberConstant.doubleThirty, bottom: NumberConstant.doubleTwenty),
                            child: Center(
                                child: SvgPicture.asset(
                                    StringConstant.icMeetWellLogo)),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: NumberConstant.doubleTwenty,),
                            child: Text("Login",
                                style: TextStyle(
                                    fontSize: NumberConstant.doubleForty, fontWeight: FontWeight.bold)),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(
                                left: NumberConstant.doubleTwenty, bottom: NumberConstant.doubleThirty),
                            child: Text("The Platform of online Meeting",
                                style: TextStyle(fontWeight: FontWeight.w400)),
                          ),
                        ]),
                  ),
                ),
                Column(children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * NumberConstant.doublePointZeroSeven,
                  ),
                  const Center(
                    child: Text("Enter Your Mobile",
                        style: TextStyle(
                            fontSize: NumberConstant.doubleThirty,
                            fontWeight: FontWeight.bold)),
                  ),
                  const Center(
                    child: Text("Number",
                        style: TextStyle(
                            fontSize: NumberConstant.doubleThirty,
                            fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * NumberConstant.doublePointZeroZeroNine,
                  ),
                  const Center(
                    child: Text("We Will Send You A Verification",
                        style: TextStyle(fontWeight: FontWeight.w500)),
                  ),
                  const Center(
                    child: Text("Code",
                        style: TextStyle(fontWeight: FontWeight.w500)),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * NumberConstant.doublePointZeroEight,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: NumberConstant.doubleTwenty),
                    child: Center(
                      child: Form(
                        key: _phoneNumberValidation,
                        child: TextFormField(
                          onChanged: (value) {
                            setState(() {
                              if (value.length == NumberConstant.doubleTen) {
                                FocusScope.of(context).unfocus();
                              }
                            });
                          },
                          validator: (value) {
                            if (value!.isEmpty ||
                                value.length != NumberConstant.doubleTen) {
                              return "Please Enter Valid mobile number";
                            }
                          },
                          enabled: true,
                          controller: phoneNumberController,
                          decoration: const InputDecoration(
                            labelText: "Mobile Number",
                            hintStyle: TextStyle(
                              // fontFamily: StringConstant.fontNexaBold,
                              color: Colors.white10,
                              // fontSize: 14,
                            ),
                            fillColor: Colors.black12,
                            filled: true,
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                          ),
                          //style: AppStyle.staffInputTextStyle(),
                          keyboardType: TextInputType.phone,
                          maxLength: NumberConstant.intTen,
                          maxLengthEnforcement: MaxLengthEnforcement.enforced,
                        ),
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
                            print(
                                "object${MediaQuery.of(context).size.height}");
                          }
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateColor.resolveWith(
                                (states) => Colors.blue.shade50)),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: NumberConstant.doubleEighty),
                          child: Text(
                            "Submit",
                            style: TextStyle(color: Colors.black),
                          ),
                        )),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height *
                        NumberConstant.doublePointOne,
                  ),
                  Column(
                    children: [
                      const Text(
                        "By clicking on “Continue” you are agreeing to our",
                        style: TextStyle(
                          color: Colors.black26,
                        ),
                      ),
                      InkWell(
                          onTap: () {},
                          child: const Text(
                            "terms of use",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.black26,
                            ),
                          ))
                    ],
                  )
                ]),
              ]),
        ),
      ),
    );
  }
}
