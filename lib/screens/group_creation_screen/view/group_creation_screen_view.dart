import 'package:flutter/material.dart';
import 'package:meet_well/utils/constants/number_constants.dart';

import '../../../utils/constants/color_constants.dart';
import '../../../utils/constants/string_constants.dart';
import '../../../utils/widgets/appbar.dart';
import '../../../utils/widgets/buttons.dart';
import '../../../utils/widgets/texxtfeilds.dart';

class GroupCreationScreen extends StatefulWidget {
  const GroupCreationScreen({super.key});

  @override
  State<GroupCreationScreen> createState() => _GroupCreationScreenState();
}

class _GroupCreationScreenState extends State<GroupCreationScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController groupNameEditingController =
      TextEditingController();
  final TextEditingController groupDescriptionEditingController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Appbar(title: StringConstant.textCreateGroup),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(),
              ],
            ),
            const SizedBox(
              height: NumberConstant.doubleTen,
            ),
            Form(
              key: formKey,
              child: Column(
                children: [
                  WidgetEditTextField(
                    textFieldHint: StringConstant.textAddGroupName,
                    textInputType: TextInputType.text,
                    controller: groupNameEditingController,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return StringConstant.textErrorGroupName;
                      }
                    },
                  ),
                  WidgetEditTextField(
                    textFieldHint: StringConstant.textAddGroupDescription,
                    textInputType: TextInputType.text,
                    controller: groupNameEditingController,
                    maxLength: NumberConstant.intFive,
                    validator: (String? value) {},
                  ),
                  const Padding(
                    padding: EdgeInsets.all(NumberConstant.doubleEight),
                    child: Text(StringConstant.textGroupSettings),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        StringConstant.textGroupSettings1,
                        style: TextStyle(
                          fontSize: NumberConstant.doubleEighteen,
                          fontWeight: FontWeight.w600,
                          color: blueAccentColor,
                        ),
                      ),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        StringConstant.textGroupSettings1,
                        style: TextStyle(
                          fontSize: NumberConstant.doubleTwenty,
                          fontWeight: FontWeight.w600,
                          color: blueAccentColor,
                        ),
                      ),
                    ],
                  ),
                  WidgetGradientBorderButton(
                    buttonText: StringConstant.textAddButton,
                    onButtonTap: () {
                      if (formKey.currentState!.validate()) {
                        print(groupNameEditingController.text);
                        // Provider.of<AddVisitorController>(context,
                        //     listen: StringConstant.boolFalse)
                        //     .AddVisitor(
                        //     textEditingController.text,
                        //     phoneNumberEditingController.text,
                        //     meetingFeesEditingController.text);
                      } else {
                        print("no");
                        return;
                      }
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
