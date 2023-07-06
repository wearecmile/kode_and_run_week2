import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meet_well/utils/constants/style_constants.dart';
import '../constants/color_constants.dart';
import '../constants/number_constants.dart';

class WidgetButton extends StatefulWidget {
  final String buttonText;
  final Function onButtonTap;

  const WidgetButton(
      {Key? key, required this.buttonText, required this.onButtonTap})
      : super(key: key);

  @override
  State<WidgetButton> createState() =>
      _WidgetButtonState();
}

class _WidgetButtonState
    extends State<WidgetButton> {
  final kInnerDecoration = BoxDecoration(
    color: buttonBackGroundColor,
    borderRadius: BorderRadius.circular(NumberConstant.doubleFiftySeven),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: NumberConstant.doubleFortyEight,
        right: NumberConstant.doubleFortySeven,
      ),
      height: NumberConstant.doubleFortyFive,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(NumberConstant.doubleOne),
        child: GestureDetector(
          onTap: () {
            widget.onButtonTap();
          },
          child: Container(
            decoration: kInnerDecoration,
            child: Align(
              alignment: FractionalOffset.center,
              child: Text(widget.buttonText,
                  textAlign: TextAlign.center,
                  style: AppStyle.buttonTextStyle()),
            ),
          ),
        ),
      ),
    );
  }
}
