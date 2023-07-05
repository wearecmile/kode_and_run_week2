import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meet_well/utils/constants/number_constants.dart';
import 'package:meet_well/utils/constants/string_constants.dart';

import '../constants/color_constants.dart';

class CustomTextField extends StatefulWidget {
  //String
  final String textFieldHint;
  final String? helperText;
  final String? counterText;

  //Boolean
  final bool obscureText;
  final bool? isFilled;
  final bool? isEnabled;
  final bool? isReadOnly;

  //Integers
  final int? maxLength;

  //Objects
  final TextInputAction? textInputAction;
  final TextInputType textInputType;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Function? onChanged;
  final Function? onTap;
  final String? Function(String?) validator;

  final List<TextInputFormatter>? inputFormatter;

  final FocusNode? focusNode;

  const CustomTextField({
    Key? key,
    required this.validator,
    required this.textFieldHint,
    required this.textInputType,
    this.textInputAction = TextInputAction.next,
    this.obscureText = false,
    required this.controller,
    this.suffixIcon,
    this.prefixIcon,
    this.maxLength,
    this.onChanged,
    this.helperText,
    this.isFilled = true,
    this.isEnabled,
    this.counterText,
    this.isReadOnly,
    this.inputFormatter,
    this.focusNode,
    this.onTap,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(
          top: NumberConstant.doubleTen,
          bottom: NumberConstant.doubleTen,
        ),
        child: TextFormField(
          validator: widget.validator,
          cursorColor: textFormFieldElementsColor,
          focusNode: widget.focusNode,
          inputFormatters: widget.inputFormatter,
          readOnly: widget.isReadOnly ?? StringConstant.boolFalse,
          enabled: widget.isEnabled,
          controller: widget.controller,
          style: const TextStyle(
              fontSize: NumberConstant.doubleFourteen,
              fontWeight: FontWeight.w400,
            color: blackColor,
          ),
          decoration: InputDecoration(
              focusColor: textFormFieldElementsColor,
              labelStyle: const TextStyle(
                color: textFormFieldElementsColor,
              ),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: blackColor12),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: textFormFieldElementsColor),
              ),
              labelText: widget.textFieldHint,
              contentPadding: const EdgeInsets.only(
                top: NumberConstant.doubleFourteen,
                bottom: NumberConstant.doubleThirteen,
                left: NumberConstant.doubleEighteen,
              ),
              filled: widget.isFilled,
              hintStyle: const TextStyle(
                  color: blackColor54,
                  fontSize: NumberConstant.doubleFourteen,
                  // fontFamily: StringConstant.fontIBMPlexMonoRegular,
                  fontWeight: FontWeight.w400),
              hintText: widget.textFieldHint,
              fillColor: blackColor12,
              suffixIcon: widget.suffixIcon,
              helperText: widget.helperText,
              prefixIcon: widget.prefixIcon),
          keyboardType: widget.textInputType,
          obscureText: widget.obscureText,
          maxLength: widget.maxLength,
          onChanged: (value) {
            if (widget.onChanged != null) {
              widget.onChanged!();
            }
          },
          onTap: () {
            if (widget.onTap != null) {
              widget.onTap!();
            }
          },
        ));
  }
}
