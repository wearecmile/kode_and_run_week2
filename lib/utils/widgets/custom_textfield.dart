import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//import '../constants/color_constants.dart';
//import '../constants/number_constants.dart';
//import '../constants/string_constants.dart';

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
  final Function onSubmitField;
  final Function? onChanged;
  final Function? onTap;

  final List<TextInputFormatter>? inputFormatter;

  final FocusNode? focusNode;

  const WidgetEditTextField(
      {Key? key,
        required this.textFieldHint,
        required this.textInputType,
        this.textInputAction = TextInputAction.next,
        this.obscureText = false,
        required this.controller,
        this.suffixIcon,
        this.prefixIcon,
        this.maxLength,
        required this.onSubmitField,
        this.onChanged,
        this.helperText,
        this.isFilled = true,
        this.isEnabled,
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
          top: 10,
          bottom: 10,
        ),
        child: TextField(
          //  validator:,
          focusNode: widget.focusNode,
          inputFormatters: widget.inputFormatter,
          readOnly: widget.isReadOnly ?? false,
          enabled: widget.isEnabled,
          controller: widget.controller,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              // fontFamily: StringConstant.fontIBMPlexMonoRegular,
              fontWeight: FontWeight.w400),
          decoration: InputDecoration(
              labelText: widget.textFieldHint,
              labelStyle: const TextStyle(color: Colors.grey),
              counterText: "",
              contentPadding: const EdgeInsets.only(
                top: 14,
                bottom: 13,
                left: 24,
              ),
              // enabledBorder: const OutlineInputBorder(
              //     borderSide: BorderSide(color: Colors.black12),
              //     //color: loginTextFieldBorderColor
              //     borderRadius: BorderRadius.all(
              //         Radius.circular(38))),
              // focusedBorder: const OutlineInputBorder(
              //     borderSide: BorderSide(color: Colors.black12),
              //     borderRadius: BorderRadius.all(
              //         Radius.circular(38))),
              filled: widget.isFilled,
              hintStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  // fontFamily: StringConstant.fontIBMPlexMonoRegular,
                  fontWeight: FontWeight.w400),
              hintText: widget.textFieldHint,
              // fillColor: loginTextFieldBorderColor,
              suffixIcon: widget.suffixIcon,
              helperText: widget.helperText,
              prefixIcon: widget.prefixIcon),
          keyboardType: widget.textInputType,
          onSubmitted: (value) {
            widget.onSubmitField();
          },
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
