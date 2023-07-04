import 'package:flutter/material.dart';
import 'package:meet_well/utils/constants/color_constants.dart';
import 'package:meet_well/utils/constants/number_constants.dart';
import 'package:meet_well/utils/constants/string_constants.dart';
import 'package:provider/provider.dart';
import '../../utils/widgets/buttons.dart';
import '../../utils/widgets/texxtfeilds.dart';
import 'controller.dart';

class AddVisitor extends StatefulWidget {
  const AddVisitor({super.key});

  @override
  State<AddVisitor> createState() => _AddVisitorState();
}

class _AddVisitorState extends State<AddVisitor> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final TextEditingController textEditingController = TextEditingController();
    final TextEditingController phoneNumberEditingController =
        TextEditingController();
    final TextEditingController meetingFeesEditingController =
        TextEditingController();
    return Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
          backgroundColor: whiteColor,
          title: const Text(StringConstant.textAddVisitor,
              style: TextStyle(fontSize: NumberConstant.doubleThirty)),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: NumberConstant.doubleThirty,
                ),
                Column(
                  children: [
                    WidgetEditTextField(
                      textFieldHint: StringConstant.textAddFullName,
                      textInputType: TextInputType.text,
                      controller: textEditingController,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return StringConstant.textErrorFullName;
                        }
                      },
                    ),
                    WidgetEditTextField(
                      textFieldHint: StringConstant.textAddPhoneNumber,
                      textInputType: TextInputType.phone,
                      controller: phoneNumberEditingController,
                      validator: (String? value) {
                        if (value!.isEmpty ||
                            value!.length != NumberConstant.intTen) {
                          return StringConstant.textErrorPhoneNumber;
                        }
                      },
                    ),
                    WidgetEditTextField(
                      textFieldHint: StringConstant.textAddFees,
                      textInputType: TextInputType.number,
                      controller: meetingFeesEditingController,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return StringConstant.textErrorFees;
                        }
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: NumberConstant.doubleForty,
                ),
                WidgetGradientBorderButton(
                  buttonText: StringConstant.textAddButton,
                  onButtonTap: () {
                    if (formKey.currentState!.validate()) {
                      Provider.of<AddVisitorController>(context,
                              listen: StringConstant.boolFalse)
                          .AddVisitor(
                              textEditingController.text,
                              phoneNumberEditingController.text,
                              meetingFeesEditingController.text);
                    } else {
                      return;
                    }
                  },
                )
              ],
            ),
          ),
        ));
  }
}
