import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meet_well/utils/constants/number_constants.dart';
import 'package:meet_well/utils/constants/string_constants.dart';
import 'package:meet_well/utils/constants/style_constants.dart';

import '../constants/color_constants.dart';

class WidgetEditTextField extends StatefulWidget {
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

  const WidgetEditTextField(
      {Key? key,
        required this.textFieldHint,
        required this.textInputType,
        this.textInputAction = TextInputAction.next,
        this.obscureText = StringConstant.boolFalse,
        required this.controller,
        this.suffixIcon,
        this.prefixIcon,
        this.maxLength,
        this.onChanged,
        this.helperText,
        required this.validator,
        this.isFilled = StringConstant.boolTrue,
        this.isEnabled =StringConstant.boolTrue,
        this.counterText,
        this.isReadOnly,
        this.inputFormatter,
        this.focusNode,
        this.onTap,
      })
      : super(key: key);

  @override
  State<WidgetEditTextField> createState() => _WidgetEditTextFieldState();
}

class _WidgetEditTextFieldState extends State<WidgetEditTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(
          top: NumberConstant.doubleTen,
          bottom: NumberConstant.doubleTen,
          left: NumberConstant.doubleFifteen,
          right: NumberConstant.doubleFifteen,
        ),
        child: TextFormField(
         validator: widget.validator,
          cursorColor: buttonColor,
          focusNode:widget.focusNode,
          inputFormatters: widget.inputFormatter,
          readOnly: widget.isReadOnly ?? StringConstant.boolFalse,
          enabled: widget.isEnabled,
          controller: widget.controller,
          style: AppStyle.textFormField(),
          decoration: InputDecoration(
              labelStyle:AppStyle.textFormFieldLabel(),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color:buttonBackGroundColor),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color:buttonColor),
              ),
              labelText: widget.textFieldHint,
              contentPadding: const EdgeInsets.only(
                top: NumberConstant.doubleFourteen,
                bottom: NumberConstant.doubleThirteen,
                left: NumberConstant.doubleEighteen,
              ),
              filled: widget.isFilled,
              hintStyle: AppStyle.textFormField(),
              hintText: widget.textFieldHint,
              fillColor: buttonBackGroundColor,
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