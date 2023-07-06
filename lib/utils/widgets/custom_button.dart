import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../constants/color_constants.dart';
import '../constants/number_constants.dart';

class CustomButton extends StatefulWidget {
  final String buttonText;
  final Function onButtonTap;

  const CustomButton(
      {Key? key, required this.buttonText, required this.onButtonTap})
      : super(key: key);

  @override
  State<CustomButton> createState() =>
      _CustomButtonState();
}

class _CustomButtonState
    extends State<CustomButton> {
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
        // bottom: NumberConstant.doubleTwentyFive
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
              child: Text(
                widget.buttonText,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: listTextPrimaryColor,
                    fontSize: NumberConstant.doubleTwenty,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
